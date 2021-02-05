//
//  LTP.PropertyContext.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import DataStream
import Foundation
import MAPI
import WindowsDataTypes

internal extension LTP {
    /// [MS-PST] 2.3.3 Property Context (PC)
    /// The Property Context is built directly on top of a BTH. The existence of a PC is indicated at the HN level, where bClientSig is set to bTypePC.
    /// Implementation-wise, the PC is simply a BTH with cbKey set to 2 and cbEnt set to 6 (see section 2.3.3.3). The following section explains the layout of a PC
    /// BTH record.
    /// Each property is stored as an entry in the BTH. Accessing a specific property is just a matter of searching the BTH for a key that matches the property
    /// identifier of the desired property, as the following data structure illustrates.
    struct PropertyContext: LTPContext {
        public let properties: PropertiesReader
        public let subNodeTree: BTree<Node>?
        
        init(ndb: NDB, subNodeTree: BTree<Node>?, dataBid: BID) throws {
            let heapOnNode = try HN(ndb: ndb, dataBid: dataBid)
            guard let firstBlock = heapOnNode.blocks.first else {
                throw PstReadError.corruptedHeapNode(dataBid: dataBid.rawValue)
            }
            
            guard firstBlock.bClientSig! == .pc else {
                throw PstReadError.invalidContext(expected: ClientSignature.pc.rawValue, actual: firstBlock.bClientSig!.rawValue)
            }

            /// [MS-PST] 2.3.3.1 Accessing the PC BTHHEADER
            /// The BTHHEADER structure of a PC is accessed through the hidUserRoot of the HNHDR structure of the containing HN.
            let btreeOnHeap = try BTreeOnHeap<PCBTH>(heapOnNode: heapOnNode, hid: firstBlock.hidUserRoot!, type: ndb.type)
            func readValue(property: PCBTH) throws -> Any? {
                func readData<T>(readFunc: (inout DataStream, Int) throws -> T) throws -> T? {
                    return try heapOnNode.getBytes(subNodeTree: subNodeTree, hnid: property.dwValueHnid, readFunc: readFunc)
                }
                
                /// [MS-PST] 2.3.3.4 Multi-Valued Properties
                /// Multi-valued (MV) properties are properties that contain an array of values. A Multi-Valued property
                /// can be derived from any basic property type, for example: PtypInteger32, PtypGuid, PtypString,
                /// PtypBinary ([MS-OXCDATA] section 2.11.1). The value of an MV property is stored using an HNID,
                /// and is encoded in a packed binary format. The following explains the data format for Multi-valued
                /// properties:
                /// [MS-PST] 2.3.3.4.1 MV Properties with Fixed-size Base Type
                /// When an MV property contains elements of fixed size, such as PtypInteger32 or PtypGuid, the data
                /// layout is very straightforward. The number of elements present is determined by dividing the size of
                /// the heap or node data size by the size of the data type. Each data element is aligned with respect to
                /// its own data type, which results in a tightly-packed array of elements.
                /// For example, if the HID points to an allocation of 64 bytes, and the Fixed-size type is a
                /// PtypInteger64 (8 bytes), then the number of items in the MV property is 64 / 8 = 8 items. The size
                /// of the heap or node data MUST be an integer multiple of the data type size.
                func readMultiValuedPropertiesWithFixedSizeBaseType<T>(size: Int = MemoryLayout<T>.size, readFunc: (inout DataStream) throws -> T) throws -> [T]? {
                    if property.dwValueHnid.rawValue == 0 {
                        return []
                    }
                    
                    return try readData { (dataStream, count) in
                        let count = count / size
                        var elements: [T] = []
                        elements.reserveCapacity(count)
                        for _ in 0..<count {
                            let element = try readFunc(&dataStream)
                            elements.append(element)
                        }
                        
                        return elements
                    }
                }

                /// [MS-PST] 2.3.3.4 Multi-Valued Properties
                /// Multi-valued (MV) properties are properties that contain an array of values. A Multi-Valued property
                /// can be derived from any basic property type, for example: PtypInteger32, PtypGuid, PtypString,
                /// PtypBinary ([MS-OXCDATA] section 2.11.1). The value of an MV property is stored using an HNID,
                /// and is encoded in a packed binary format. The following explains the data format for Multi-valued
                /// properties:
                /// [MS-PST] 2.3.3.4.2 MV Properties with Variable-size Base Type
                /// When the MV property contains variable-size elements, such as PtypBinary, PtypString, or PtypString8),
                /// the data layout is more complex. The following is the data format of a multi-valued property with
                /// variable-size base type.
                func readMultiValuedPropertiesWithVariableSizeBaseType<T>(readFunc: (inout DataStream, Int) throws-> T) throws -> [T]? {
                    if property.dwValueHnid.rawValue == 0 {
                        return []
                    }

                    return try readData { (dataStream, count) in
                        let position = dataStream.position

                        /// ulCount (4 bytes): Number of data items in the array.
                        let ulCount: UInt32 = try dataStream.read(endianess: .littleEndian)
                                        
                        /// rgulDataOffsets (variable): An array of ULONG values that represent offsets to the start of each
                        /// data item for the MV array. Offsets are relative to the beginning of the MV property data record.
                        /// The length of the Nth data item is calculated as: rgulOffsets[N+1] – rgulOffsets[N], with the
                        /// exception of the last item, in which the total size of the MV property data record is used instead of
                        /// rgulOffsets[N+1].
                        var dataOffsets: [UInt32] = []
                        dataOffsets.reserveCapacity(Int(ulCount))
                        for _ in 0..<ulCount {
                            let dataOffset: UInt32 = try dataStream.read(endianess: .littleEndian)
                            dataOffsets.append(dataOffset)
                        }
                        
                        func getElementCount(index: Int) -> UInt32 {
                            if index == dataOffsets.count - 1 {
                                return UInt32(count) - dataOffsets[index]
                            }
                            
                            return dataOffsets[index + 1] - dataOffsets[index]
                        }
                        
                        /// rgDataItems (variable): A byte-aligned array of data items. Individual items are delineated using the rgulOffsets values.
                        var rgDataItems: [T] = []
                        rgDataItems.reserveCapacity(Int(ulCount))
                        for i in 0..<ulCount {
                            dataStream.position = position + Int(dataOffsets[Int(i)])

                            let count = Int(getElementCount(index: Int(i)))
                            let rgDataItem = try readFunc(&dataStream, count)
                            rgDataItems.append(rgDataItem)
                        }
                        
                        return rgDataItems
                    }
                }

                switch property.wPropType {
                case .unspecified:
                    return nil
                case .null:
                    return nil
                case .integer16:
                    return UInt16(property.dwValueHnid.rawValue)
                case .integer32:
                    return property.dwValueHnid.rawValue
                case .floating32:
                    return Float(bitPattern: property.dwValueHnid.rawValue)
                case .floating64:
                    if property.dwValueHnid.rawValue == 0 {
                        return 0.0
                    }
                    
                    return try readData { (dataStream, count) in try dataStream.readDouble() }
                case .currency:
                    if property.dwValueHnid.rawValue == 0 {
                        return 0.0
                    }
                    
                    return try readData { (dataStream, count) in try Double(currency: dataStream.read(endianess: .littleEndian)) }
                case .floatingTime:
                    return try readData { (dataStream, count) in
                        guard let date = try Date(floatingTime: dataStream.readDouble()) else {
                            throw MAPIError.corrupted
                        }
                        
                        return date
                    }
                case .errorCode:
                    return property.dwValueHnid.rawValue
                case .boolean:
                    return property.dwValueHnid.rawValue != 0x00
                case .objectOrEmbeddedTable:
                    /// [MS-PST] 2.3.3.5 PtypObject Properties
                    /// When a property of type PtypObject is stored in a PC, the dwValueHnid value described in section 2.3.3.3
                    /// points to a heap allocation that contains a structure that defines the size and location of the object data.
                    if property.dwValueHnid.rawValue == 0 {
                        return nil
                    }
                    
                    return try readData { (dataStream, count) -> Data? in
                        /// Nid (4 bytes): The subnode identifier that contains the object data.
                        let nid: NID = try NID(dataStream: &dataStream)
                        
                        /// ulSize (4 bytes): The total size of the object.
                        let _: UInt32 = try dataStream.read(endianess: .littleEndian)
                        
                        guard let subNodeTree = subNodeTree else {
                            return nil
                        }
                        
                        return Data(try ndb.readSubNodeBlock(subNodeTree: subNodeTree, nid: nid))
                    }
                case .integer64:
                    return try readData { (dataStream, count) in try dataStream.read(endianess: .littleEndian) as UInt64 }
                case .string8:
                    if property.dwValueHnid.rawValue == 0 {
                        return ""
                    }
                    
                    return try readData { try $0.readString(count: $1, encoding: .ascii)! }
                case .string:
                    if property.dwValueHnid.rawValue == 0 {
                        return ""
                    }
                    
                    return try readData { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
                case .time:
                    return try readData { (dataStream, count) in try FILETIME(dataStream: &dataStream).date }
                case .guid:
                    return try readData { (dataStream, count) in try GUID(dataStream: &dataStream) }
                case .serverId:
                    return try readData { (dataStream, count) in
                        let _: UInt16 = try dataStream.read(endianess: .littleEndian)
                        return try ServerId(dataStream: &dataStream)
                    }
                case .restriction:
                    return try readData { (dataStream, count) in try Restriction(dataStream: &dataStream, standard: true) }
                case .ruleAction:
                    return try readData { (dataStream, count) in
                        let count: UInt16 = try dataStream.read(endianess: .littleEndian)
                        var actions: [RuleAction] = []
                        actions.reserveCapacity(Int(count))
                        for _ in 0..<count {
                            let action = try RuleAction(dataStream: &dataStream, standard: true)
                            actions.append(action)
                        }
                        
                        return actions
                    }
                case .binary:
                    return try readData { Data(try $0.readBytes(count: $1)) }
                case .multipleInteger16:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.read(endianess: .littleEndian) as UInt16 }
                case .multipleInteger32:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.read(endianess: .littleEndian) as UInt32 }
                case .multipleFloating32:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.readFloat(endianess: .littleEndian) }
                case .multipleFloating64:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.readDouble(endianess: .littleEndian) }
                case .multipleCurrency:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType(size: MemoryLayout<UInt64>.size) { Double(currency: try $0.read(endianess: .littleEndian)) }
                case .multipleFloatingTime:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType(size: MemoryLayout<Double>.size) { Date(floatingTime: try $0.readDouble(endianess: .littleEndian)) }
                case .multipleInteger64:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.read(endianess: .littleEndian) as UInt64 }
                case .multipleString8:
                    return try readMultiValuedPropertiesWithVariableSizeBaseType { try $0.readString(count: $1, encoding: .ascii)! }
                case .multipleString:
                    return try readMultiValuedPropertiesWithVariableSizeBaseType { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
                case .multipleTime:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType(size: MemoryLayout<FILETIME>.size) { try FILETIME(dataStream: &$0).date }
                case .multipleGuid:
                    return try readMultiValuedPropertiesWithFixedSizeBaseType { try GUID(dataStream: &$0) }
                case .multipleBinary:
                    return try readMultiValuedPropertiesWithVariableSizeBaseType { Data(try $0.readBytes(count: $1)) }
                case .unknown:
                    return nil
                }
            }
            
            var propertyFactories: [UInt16: () throws -> Any?] = [:]
            propertyFactories.reserveCapacity(btreeOnHeap.bthList.count)
            for property in btreeOnHeap.bthList {
                propertyFactories[property.wPropId] = { try readValue(property: property) }
            }
            
            self.subNodeTree = subNodeTree
            self.properties = PropertiesReader(propertyFactories: propertyFactories)
        }
    }
}
