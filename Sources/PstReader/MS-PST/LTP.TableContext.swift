//
//  LTP.TableContext.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import DataStream
import Foundation
import MAPI
import WindowsDataTypes

internal extension LTP {
    /// [MS-PST] 2.3.4 Table Context (TC)
    /// A Table Context represents a table with rows of columns. From an implementation perspective, a TC is
    /// a complex, composite structure that is built on top of an HN. The presence of a TC is indicated at both
    /// the NDB and LTP Layers. At the NDB Layer, a TC is indicated through one of the special NID_TYPEs,
    /// and at the LTP Layer, a value of bTypeTC for bClientSig in the HNHEADER structure is reserved for
    /// TCs. The underlying TC data is separated into 3 entries: a header with Column descriptors, a
    /// RowIndex (a nested BTH), and the actual table data (known as the Row Matrix).
    /// The Row Matrix contains the actual row data for the TC. New rows are appended to the end of the Row
    /// Matrix, which means that the rows are not sorted in any meaningful manner. To provide a way to
    /// efficiently search the Row Matrix for a particular data row, each TC also contains an embedded BTH,
    /// known as the RowIndex, to provide a 32-bit "primary index" for the Row Matrix. Each 32-bit value is a
    /// key that uniquely identifies a row within the Row Matrix.
    /// In practice, the Row Matrix is stored in a subnode because of its typical size, but in rare cases, a TC
    /// can fit into a single data block if it is small enough. To facilitate navigation between rows, each row of
    /// data is of the same size, and the size is stored in the TCINFO header structure (section 2.3.4.1). To
    /// further help with data packing and alignment, the data values are grouped according to its
    /// corresponding data size. DWORD and ULONGLONG values are grouped first, followed by WORD-sized
    /// data, and then byte-sized data. The TCINFO structure contains an array of offsets that points to the
    /// starting offset of each group of data.
    /// The TC also includes a construct known as a Cell Existence Bitmap (CEB), which is used to denote
    /// whether a particular column in a particular row actually "exists". A CEB is present at the end of each
    /// row of data in the Row Matrix that indicates which columns in that row exists and which columns don't
    /// exist.
    /// The following diagram depicts the various elements of a TC, and how they relate to each other.
    /// The preceding example illustrates a typical TC arrangement, where the metadata is stored in the main
    /// data block (a data tree can be used if the TC is large), and the RowMatrix is stored in the
    /// corresponding subnode. Note that the numerical values used in the example are for reference
    /// purposes only.
    /// The hidUserRoot of the HNHDR points to the TC header, which is allocated from the heap with
    /// HID=0x20. The TC header contains a TCINFO structure, followed by an array of column descriptors.
    /// The TCINFO structure contains pointers that point to the RowIndex (hidRowIndex) and The Row
    /// Matrix (hnidRowData). The RowIndex is allocated off the heap, whereas the Row Matrix is stored in
    /// the subnode (in rare cases where the TC is very small, the Row Matrix can be stored in a heap
    /// allocation instead. Note that the subnode structure in the diagram is significantly simplified for
    /// illustrative purposes.
    /// The next sections describe actual data structures associated with Table Contexts:
    struct TableContext: LTPContext {
        public let ndb: NDB
        public let tcInfo: TCINFO
        public let heapOnNode: HN
        public let bTreeOnHeap: BTreeOnHeap<TCROWID>
        public let subNodeTree: BTree<Node>?
        
        init(ndb: NDB, subNodeTree: BTree<Node>?, dataBid: BID) throws {
            self.subNodeTree = subNodeTree
            self.ndb = ndb

            self.heapOnNode = try HN(ndb: ndb, dataBid: dataBid)
            guard let firstBlock = heapOnNode.blocks.first else {
                throw PstReadError.corruptedHeapNode(dataBid: dataBid.rawValue)
            }
            
            guard firstBlock.bClientSig! == .tc else {
                throw PstReadError.invalidContext(expected: ClientSignature.tc.rawValue, actual: firstBlock.bClientSig!.rawValue)
            }
            
            /// The hidUserRoot of the HNHDR points to the TC header, which is allocated from the heap with
            /// HID=0x20. The TC header contains a TCINFO structure, followed by an array of column descriptors.
            /// The TCINFO structure contains pointers that point to the RowIndex (hidRowIndex) and The Row
            /// Matrix (hnidRowData). The RowIndex is allocated off the heap, whereas the Row Matrix is stored in
            /// the subnode (in rare cases where the TC is very small, the Row Matrix can be stored in a heap
            /// allocation instead. Note that the subnode structure in the diagram is significantly simplified for
            /// illustrative purposes.
            var dataStream = heapOnNode.getDataStream(hid: firstBlock.hidUserRoot!)
            self.tcInfo = try TCINFO(dataStream: &dataStream, type: ndb.type)
            
            /// [MS-PST] 2.3.4.3 The RowIndex
            /// The hidRowIndex member in TCINFO points to an embedded BTH that contains an array of
            /// (dwRowID, dwRowIndex) value pairs, which provides a 32-bit primary index for searching the Row
            /// Matrix. Simply put, the RowIndex maps dwRowID, a unique identifier, to the index of a particular
            /// row in the Row Matrix.
            /// The RowIndex itself is a generic mechanism to provide a 32-bit primary key and therefore it is up to
            /// the implementation to decide what value to use for the primary key. However, an NID value is used as
            /// the primary key because of its uniqueness within a PST.
            /// The following is the layout of the BTH data record used in the RowIndex.
            self.bTreeOnHeap = try BTreeOnHeap<TCROWID>(heapOnNode: heapOnNode, hid: tcInfo.hidRowIndex, type: ndb.type)
        }

        public lazy var rows: [TableRow] = try! {
            // The data rows may be held in line, or in a sub node
            if tcInfo.hnidRows.hidType == .hid {
                // Data is in line
                let data = try heapOnNode.getBytes(subNodeTree: subNodeTree, hnid: tcInfo.hnidRows) { (dataStream, count) in
                    return try dataStream.readBytes(count: count)
                }
                guard let dataForBlock = data else {
                    return []
                }
                
                let dataBlock = RowDataBlock(buffer: dataForBlock)
                return try readTableData(dataBlocks: [dataBlock])
            } else if tcInfo.hnidRows.nid.rawValue != 0 {
                guard let subNode = subNodeTree?.lookup(key: UInt64(tcInfo.hnidRows.nid.rawValue)) else {
                    return []
                }
                
                if subNode.subDataBid.rawValue != 0 {
                    fatalError("NYI: sub-nodes of sub-nodes")
                }
                
                let dataBlocks = try ndb.readBlocks(dataBid: subNode.dataBid).map(RowDataBlock.init)
                return try readTableData(dataBlocks: dataBlocks)
            } else {
                return []
            }
        }()
        
        func readValue(column: TCOLDESC, blockDataStream: inout DataStream, rowOffset: Int) throws -> Any? {
            blockDataStream.position = rowOffset + Int(column.ibData)
            func readData<T>(hnid: HNID, readFunc: (inout DataStream, Int) throws -> T) throws -> T? {
                return try heapOnNode.getBytes(subNodeTree: subNodeTree, hnid: hnid, readFunc: readFunc)
            }
            
            /// [MS-PST] 2.3.4.4.2 Variable-sized Data
            /// With respect to the TC, variable-sized data is defined as any data type that allows a variable size
            /// (such as strings), or any fixed-size data type that exceeds 8 bytes (for example, a GUID). In the case
            /// of variable-sized data, the actual data is stored elsewhere in the heap or in a subnode, and the HNID
            /// that references the data is stored the corresponding rgdwData slot instead. The following is a list of
            /// the property types that are stored using an HNID. A complete list of property types is specified in
            /// [MS-OXCDATA] section 2.11.1.
            ///  PtypString
            ///  PtypString8
            ///  PtypBinary
            ///  PtypObject
            ///  PtypGuid
            ///  All multi-valued types
            /// The following table illustrates the handling of fixed- and variable-sized data in the TC (see section
            /// 2.3.3.2 for determining if an HNID is an HID or an NID).
            /// Variable size? | Fixed data size | NID_TYPE(dwValueHnid) == NID_TYPE_HID? | rgdwData value
            /// ----------------------------------------------------------------------------------------------------
            /// N                               | <= 8 bytes*      |-                                       | Data value
            ///                | > 8 bytes*                    | Y                                                                                       | HID
            /// Y                                | -                                    | Y                                                                                       | HID (<= 3580 bytes)
            ///                |                 | N                                      | NID (subnode, > 3580 bytes)
            /// This contrasts with the PC in that the TC stores 8-byte values inline (in rgdwData), whereas a PC
            /// would use an HNID for any data that exceeds 4-bytes in size.
            func readMultiValuedPropertiesWithFixedSizeBaseType<T>(hnid: HNID, size: Int = MemoryLayout<T>.size, readFunc: (inout DataStream) throws -> T) throws -> [T]? {
                if hnid.rawValue == 0 {
                    return []
                }
                
                return try readData(hnid: hnid) { (dataStream, count) in
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
            
            func readMultiValuedPropertiesWithVariableSizeBaseType<T>(hnid: HNID, readFunc: (inout DataStream, Int) throws -> T) throws -> [T]? {
                if hnid.rawValue == 0 {
                    return []
                }
                
                return try readData(hnid: hnid) { (dataStream, count) in
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

            switch column.tag.type {
            case .unspecified:
                return nil
            case .null:
                return nil
            case .integer16:
                if column.cbData != 2 {
                    throw PstReadError.invalidPropertySize(expected: 2, actual: column.cbData)
                }

                return try blockDataStream.read(endianess: .littleEndian) as UInt16
            case .integer32:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }

                return try blockDataStream.read(endianess: .littleEndian) as UInt32
            case .floating32:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }

                return try blockDataStream.readFloat(endianess: .littleEndian)
            case .floating64:
                if column.cbData != 8 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }

                return try blockDataStream.readDouble(endianess: .littleEndian)
            case .currency:
                if column.cbData != 8 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }

                return Double(currency: try blockDataStream.read(endianess: .littleEndian))
            case .floatingTime:
                if column.cbData != 8 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }

                return Date(floatingTime: try blockDataStream.readDouble(endianess: .littleEndian))
            case .errorCode:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }

                return try blockDataStream.read(endianess: .littleEndian) as UInt32
            case .boolean:
                if column.cbData != 1 {
                    throw PstReadError.invalidPropertySize(expected: 1, actual: column.cbData)
                }
                
                let rawValue: UInt8 = try blockDataStream.read()
                return rawValue != 0x00
            case .objectOrEmbeddedTable:
                fatalError("NYI: PtypObject or PtypEmbeddedTable")
            case .integer64:
                if column.cbData != 8 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }

                return try blockDataStream.read(endianess: .littleEndian) as UInt64
            case .string8:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return ""
                }
                
                return try readData(hnid: hnid) { try $0.readString(count: $1, encoding: .ascii)! }
            case .string:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return ""
                }
                
                return try readData(hnid: hnid) { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
            case .time:
                if column.cbData != 8 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }

                return try FILETIME(dataStream: &blockDataStream).date
            case .guid:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return nil
                }

                return try readData(hnid: hnid) { (dataStream, count) in try dataStream.readGUID(endianess: .littleEndian) }
            case .serverId:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return nil
                }

                return try readData(hnid: hnid) { (dataStream, count) in
                    let _: UInt16 = try dataStream.read(endianess: .littleEndian)
                    return try ServerId(dataStream: &dataStream)
                }
            case .restriction:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return nil
                }

                return try readData(hnid: hnid) { (dataStream, count) in try Restriction(dataStream: &dataStream, standard: false) }
            case .ruleAction:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return nil
                }

                return try readData(hnid: hnid) { (dataStream, count) in
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
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                if hnid.rawValue == 0 {
                    return Data()
                }
                
                return try readData(hnid: hnid) { Data(try $0.readBytes(count: $1)) }
            case .multipleInteger16:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.read(endianess: .littleEndian) as UInt16 }
            case .multipleInteger32:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.read(endianess: .littleEndian) as UInt32 }
            case .multipleFloating32:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.readFloat(endianess: .littleEndian) }
            case .multipleFloating64:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.readDouble(endianess: .littleEndian) }
            case .multipleCurrency:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid, size: MemoryLayout<UInt64>.size) { Double(currency: try $0.read(endianess: .littleEndian)) }
            case .multipleFloatingTime:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid, size: MemoryLayout<Double>.size) { Date(floatingTime: try $0.readDouble(endianess: .littleEndian)) }
            case .multipleInteger64:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.read(endianess: .littleEndian) as UInt64 }
            case .multipleString8:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithVariableSizeBaseType(hnid: hnid) { try $0.readString(count: $1, encoding: .ascii)! }
            case .multipleString:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithVariableSizeBaseType(hnid: hnid) { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
            case .multipleTime:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid, size: MemoryLayout<FILETIME>.size) { try FILETIME(dataStream: &$0).date }
            case .multipleGuid:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithFixedSizeBaseType(hnid: hnid) { try $0.readGUID(endianess: .littleEndian) }
            case .multipleBinary:
                if column.cbData != 4 {
                    throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
                }
                
                let hnid = try HNID(dataStream: &blockDataStream, type: ndb.type)
                return try readMultiValuedPropertiesWithVariableSizeBaseType(hnid: hnid) { Data(try $0.readBytes(count: $1)) }
            case .unknown:
                return nil
            }
        }
        
        private func readTableData(dataBlocks: [RowDataBlock]) throws -> [TableRow] {
            let rgCEBSize = Int((Float(tcInfo.cCols) / 8).rounded(.up))
            
            let rowsPerBlock = (ndb.type.blockSize - UInt32(ndb.type.blockTrailerSize)) / UInt32(tcInfo.rgib.bm)
            
            var rows: [TableRow] = []
            rows.reserveCapacity(bTreeOnHeap.bthList.count)
            for index in bTreeOnHeap.bthList {
                let blockNum = Int(index.dwRowIndex / rowsPerBlock)
                if blockNum >= dataBlocks.count {
                    throw PstReadError.invalidBlockNum(blockNum: blockNum)
                }
                
                let dataBlock = dataBlocks[blockNum]
                let rowOffset = dataBlock.offset + Int(index.dwRowIndex % rowsPerBlock) * Int(tcInfo.rgib.bm)
                let readPosition = rowOffset + Int(tcInfo.rgib.b1)
                if readPosition > dataBlock.offset + dataBlock.count {
                    throw PstReadError.invalidRowOffset(rowOffset: rowOffset)
                }
                
                // Read the column existence data
                var blockDataStream = DataStream(dataBlock.buffer)
                blockDataStream.position = readPosition
                
                let rgCEB = try blockDataStream.readBytes(count: rgCEBSize)
                var propertyFactories: [UInt16: () throws -> Any?] = [:]
                propertyFactories.reserveCapacity(tcInfo.rgTCOLDESC.count)

                for column in tcInfo.rgTCOLDESC {
                    // Check if the column exists
                    if rgCEB[Int(column.iBit) / 8] & (0x01 << (7 - (Int(column.iBit) % 8))) == 0 {
                        continue
                    }
                    
                    let value = { try readValue(column: column, blockDataStream: &blockDataStream, rowOffset: rowOffset) }
                    propertyFactories[column.tag.id] = value
                }
                
                rows.append(TableRow(nid: index.dwRowID, properties: PropertiesReader(propertyFactories: propertyFactories)))
            }
            
            return rows
        }
        
        public struct TableRow {
            public var nid: NID
            public var properties: PropertiesReader
        }
        
        private struct RowDataBlock {
            public let buffer: [UInt8]
            public let offset: Int
            public let count: Int
            
            public init(buffer: [UInt8]) {
                self.buffer = buffer
                self.offset = 0
                self.count = buffer.count
            }
        }
    }
}
