//
//  LTP.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import DataStream
import Foundation
import MAPI
import WindowsDataTypes

/// [MS-PST] 1.3.1.2 Lists, Tables, and Properties (LTP) Layer
/// The LTP layer implements higher-level concepts on top of the NDB construct. The core elements of the
/// LTP Layer are the Property Context (PC) and Table Context (TC). A PC represents a collection of
/// properties. A TC represents a two-dimensional table. The rows represent a collection of properties.
/// The columns represent which properties are within the rows.
/// From a high-level implementation standpoint, each PC or TC is stored as data in a single node. The
/// LTP layer uses NIDs to identify PCs and TCs.
/// To implement PCs and TCs efficiently, the LTP layer employs the following two types of data structures
/// on top of each NDB node.
internal struct LTP {
    public var isUnicode: Bool {
        return ndb.isUnicode
    }
    private var ndb: NDB
    
    public init(ndb: NDB) {
        self.ndb = ndb
    }
    
    public mutating func readProperties(nid: NID) throws -> [UInt16: Any?] {
        guard let (node, subNodeTree) =  try ndb.lookupNodeAndSubNodeTree(nid: nid) else {
            return [:]
        }
        
        return try readProperties(subNodeTree: subNodeTree, dataBid: node.dataBid)
    }

    private mutating func readProperties(subNodeTree: BTree<Node>?, dataBid: BID) throws -> [UInt16: Any?] {
        let blocks = try readHeapOnNode(dataBid: dataBid)
        guard let firstBlock = blocks.first, firstBlock.bClientSig! == .pc else {
            return [:]
        }

        let properties: [PCBTH] = try readBTHIndex(blocks: blocks, hid: firstBlock.hidUserRoot!)
        var result: [UInt16: Any?] = [:]
        result.reserveCapacity(properties.count)
        for property in properties {
            result[property.wPropId] = try readPropertyValue(subNodeTree: subNodeTree, blocks: blocks, property: property)
        }
        
        dump(properties: result)
        return result
    }
    
    private mutating func readHeapOnNode(nid: NID) throws -> [HNDataBlock] {
        guard let node = try ndb.lookupNode(nid: nid) else {
            return []
        }
        
        return try readHeapOnNode(dataBid: node.dataBid)
    }
    
    /// Read a heap on node data structure. The division of data into blocks is preserved,
    /// because references into it have two parts: block index, and offset within block
    private mutating func readHeapOnNode(dataBid: BID) throws -> [HNDataBlock] {
        var blocks: [HNDataBlock] = []

        for entry in try ndb.readBlocks(dataBid: dataBid).enumerated() {
            var bufferDataStream = DataStream(buffer: entry.element)
            // First block contains a HNHDR
            if entry.offset == 0 {
                let header = try HNHDR(dataStream: &bufferDataStream)
                bufferDataStream.position = Int(header.ibHnpm)
                let pageMap = try HNPAGEMAP(dataStream: &bufferDataStream)

                let block = HNDataBlock(index: entry.offset, buffer: entry.element, rgbidAlloc: pageMap.rgibAlloc, bClientSig: header.bClientSig, hidUserRoot: header.hidUserRoot)
                blocks.append(block)
            }
            // Blocks 8, 136, then every 128th contains a HNBITMAPHDR
            else if (entry.offset == 8 || (entry.offset >= 136 && (entry.offset - 8) % 128 == 0)) {
                let header = try HNBITMAPHDR(dataStream: &bufferDataStream)
                bufferDataStream.position = Int(header.ibHnpm)
                let pageMap = try HNPAGEMAP(dataStream: &bufferDataStream)

                let block = HNDataBlock(index: entry.offset, buffer: entry.element, rgbidAlloc: pageMap.rgibAlloc)
                blocks.append(block)
            }
            // All other blocks contain a HNPAGEHDR
            else {
                let header = try HNPAGEHDR(dataStream: &bufferDataStream)
                bufferDataStream.position = Int(header.ibHnpm)
                let pageMap = try HNPAGEMAP(dataStream: &bufferDataStream)

                let block = HNDataBlock(index: entry.offset, buffer: entry.element, rgbidAlloc: pageMap.rgibAlloc)
                blocks.append(block)
            }
        }
        
        return blocks
    }
    
    /// Walk a b-tree implemented on a heap, and return all the type T entries
    /// This is used when reading the index of properties in a PC (property context), or rows in a TC (table context)
    private mutating func readBTHIndex<T>(blocks: [HNDataBlock], hid: HID) throws -> [T] where T: BTH {
        let (block, position) = getPosition(blocks: blocks, hid: hid)
        var blockDataStream = DataStream(buffer: block.buffer)
        blockDataStream.position = Int(position)
        let header = try BTHHEADER(dataStream: &blockDataStream)

        var bthList: [T] = []
        try readBTHIndexHelper(blocks: blocks, hid: header.hidRoot, level: header.bIdxLevels, bthList: &bthList)
        return bthList
    }
    
    private mutating func readBTHIndexHelper<T>(blocks: [HNDataBlock], hid: HID, level: UInt8, bthList: inout [T]) throws where T: BTH {
        if level == 0 {
            let recCount = hidSize(blocks: blocks, hid: hid) / T.size
            if hid.hidIndex != 0 {
                bthList.reserveCapacity(bthList.capacity + Int(recCount))

                // The T record also forms the key of the BTH entry
                let (block, position) = getPosition(blocks: blocks, hid: hid)
                var blockDataStream = DataStream(buffer: block.buffer)
                blockDataStream.position = Int(position)
                for _ in 0..<recCount {
                    let bth = try T(dataStream: &blockDataStream, isUnicode: isUnicode)
                    bthList.append(bth)
                }
            }
        } else {
            let recCount = hidSize(blocks: blocks, hid: hid) / IntermediateBTH<UInt32>.size
            let (block, position) = getPosition(blocks: blocks, hid: hid)
            var blockDataStream = DataStream(buffer: block.buffer)
            blockDataStream.position = Int(position)
            
            for _ in 0..<recCount {
                let intermediate = try IntermediateBTH<UInt32>(dataStream: &blockDataStream, isUnicode: isUnicode)
                try readBTHIndexHelper(blocks: blocks, hid: intermediate.hidNextLevel, level: level - 1, bthList: &bthList)
            }
        }
    }
    
    /// Dereference the supplied HID in the supplied heap-on-node blocks,
    /// and map the resulting data buffer onto the specified type T
    private func getPosition(blocks: [HNDataBlock], hid: HID) -> (HNDataBlock, UInt16) {
        let block = blocks[Int(hid.hidBlockIndex)]
        return (block, block.rgbidAlloc[Int(hid.hidIndex - 1)])
    }
    
    /// Dereference the supplied HID in the supplied heap-on-node blocks,
    /// and return the size of the resulting data buffer
    private func hidSize(blocks: [HNDataBlock], hid: HID) -> UInt16 {
        let index = hid.hidIndex
        // Check for empty
        if index == 0 {
            return 0
        }

        let block = blocks[Int(hid.hidBlockIndex)]
        return block.rgbidAlloc[Int(index)] - block.rgbidAlloc[Int(index - 1)]
    }
    
    private mutating func readPropertyValue(subNodeTree: BTree<Node>?, blocks: [HNDataBlock], property: PCBTH) throws -> Any? {
        func readData<T>(readFunc: (inout DataStream, Int) throws -> T) throws -> T? {
            return try getBytes(blocks: blocks, subNodeTree: subNodeTree, hnid: HNID(rawValue: property.dwValueHnid), readFunc: readFunc)
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
        func readMultiValuedPropertiesWithFixedSizeBaseType<T>(readFunc: (inout DataStream) throws -> T) throws -> [T]? {
            if property.dwValueHnid == 0 {
                return []
            }
            
            return try readData { (dataStream, count) in
                let count = count / MemoryLayout<T>.size
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
            if property.dwValueHnid == 0 {
                return []
            }

            return try readData { (dataStream, count) in
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
                    dataStream.position = Int(dataOffsets[Int(i)])

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
            return UInt16(property.dwValueHnid)
        case .integer32:
            return property.dwValueHnid
        case .floating32:
            return Float(bitPattern: property.dwValueHnid)
        case .floating64:
            if property.dwValueHnid == 0 {
                return 0.0
            }
            
            return try readData { (dataStream, count) in try dataStream.readDouble() }
        case .currency:
            fatalError("NYI: PtypCurrency")
        case .floatingTime:
            fatalError("NYI: PtypCurrency")
        case .errorCode:
            fatalError("NYI: PtypErrorCode")
        case .boolean:
            return property.dwValueHnid != 0x00
        case .objectOrEmbeddedTable:
            fatalError("NYI: PtypObject or PtypEmbeddedTable")
        case .integer64:
            return try readData { (dataStream, count) in try dataStream.read(endianess: .littleEndian) as UInt64 }
        case .string8:
            if property.dwValueHnid == 0 {
                return ""
            }
            
            return try readData { try $0.readString(count: $1, encoding: .ascii)! }
        case .string:
            if property.dwValueHnid == 0 {
                return ""
            }
            
            return try readData { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
        case .time:
            return try readData { (dataStream, count) in try FILETIME(dataStream: &dataStream).date }
        case .guid:
            return try readData { (dataStream, count) in try dataStream.readGUID(endianess: .littleEndian) }
        case .serverId:
            fatalError("NYI: PtypServerId")
        case .restriction:
            fatalError("NYI: PtypRestriction")
        case .ruleAction:
            fatalError("NYI: PtypRuleAction")
        case .binary:
            return try readData { Data(try $0.readBytes(count: $1)) }
        case .multipleInteger16:
            fatalError("NYI: PtypMultipleInteger16")
        case .multipleInteger32:
            return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.read(endianess: .littleEndian) as UInt32 }
        case .multipleFloating32:
            fatalError("NYI: PtypMultipleFloating32")
        case .multipleFloating64:
            fatalError("NYI: PtypMultipleFloating64")
        case .multipleCurrency:
            fatalError("NYI: PtypMultipleCurrency")
        case .multipleFloatingTime:
            fatalError("NYI: PtypMultipleFloatingTime")
        case .multipleInteger64:
            fatalError("NYI: PtypMultipleInteger64")
        case .multipleString8:
            return try readMultiValuedPropertiesWithVariableSizeBaseType { try $0.readString(count: $1, encoding: .ascii)! }
        case .multipleString:
            return try readMultiValuedPropertiesWithVariableSizeBaseType { try $0.readString(count: $1 / 2, encoding: .utf16LittleEndian)! }
        case .multipleTime:
            fatalError("NYI: PtypMultipleTime")
        case .multipleGuid:
            return try readMultiValuedPropertiesWithFixedSizeBaseType { try $0.readGUID(endianess: .littleEndian) }
        case .multipleBinary:
            return try readMultiValuedPropertiesWithVariableSizeBaseType { Data(try $0.readBytes(count: $1)) }
        case .unknown:
            return nil
        }
    }
    
    private mutating func getBytes<T>(blocks: [HNDataBlock], subNodeTree: BTree<Node>?, hnid: HNID, readFunc: (_ dataStream: inout DataStream, _ count: Int) throws -> T) throws -> T? {
        switch hnid.hidType {
        case .hid:
            if hnid.hid.hidIndex == 0 {
                return nil
            }
            
            let (block, position) = getPosition(blocks: blocks, hid: hnid.hid)
            let size = hidSize(blocks: blocks, hid: hnid.hid)
            var dataStream = DataStream(buffer: block.buffer)
            dataStream.position = Int(position)
            return try readFunc(&dataStream, Int(size))
        case .ltp:
            guard let subNodeTree = subNodeTree else {
                return nil
            }

            let buffer = try ndb.readSubNodeBlock(subNodeTree: subNodeTree, nid: hnid.nid)
            var dataStream = DataStream(buffer: buffer)
            return try readFunc(&dataStream, buffer.count)
        default:
            throw PstReadError.invalidHidType(hidType: hnid.hidType.rawValue)
        }
    }
    
    /// This is a cutdown version of the table reader to fetch subfolder NIDs from the hierarchy table of a folder,
    /// avoiding the overhead of reading the data rows when scanning the folder tree
    public mutating func readTableRowIds(nid: NID) throws -> [NID] {
        let blocks = try readHeapOnNode(nid: nid)
        guard let firstBlock = blocks.first, firstBlock.bClientSig! == .tc else {
            return []
        }
        
        // Read the table information
        let (block, position) = getPosition(blocks: blocks, hid: firstBlock.hidUserRoot!)
        var blockDataStream = DataStream(buffer: block.buffer)
        blockDataStream.position = Int(position)
        
        let tcInfo = try TCINFO(dataStream: &blockDataStream)
        
        // Read the row index and return the NIDs from it
        let rowIds: [TCROWID] = try readBTHIndex(blocks: blocks, hid: tcInfo.hidRowIndex)
        return rowIds.map { NID(rawValue: $0.dwRowID) }
    }
    
    public mutating func readTable(nid: NID) throws -> [[UInt16: Any?]] {
        guard let (node, subNodeTree) =  try ndb.lookupNodeAndSubNodeTree(nid: nid) else {
            return []
        }

        let blocks = try readHeapOnNode(dataBid: node.dataBid)
        guard let firstBlock = blocks.first, firstBlock.bClientSig! == .tc else {
            return []
        }
        
        // Read the table information
        let (block, position) = getPosition(blocks: blocks, hid: firstBlock.hidUserRoot!)
        var blockDataStream = DataStream(buffer: block.buffer)
        blockDataStream.position = Int(position)
        
        let tcInfo = try TCINFO(dataStream: &blockDataStream)
        
        // Read the row index
        let rowIndices: [TCROWID] = try readBTHIndex(blocks: blocks, hid: tcInfo.hidRowIndex)
        
        // The data rows may be held in line, or in a sub node
        if tcInfo.hnidRows.hidType == .hid {
            // Data is in line
            let data = try getBytes(blocks: blocks, subNodeTree: subNodeTree, hnid: tcInfo.hnidRows) { (dataStream, count) in
                return try dataStream.readBytes(count: count)
            }
            guard let dataForBlock = data else {
                return []
            }
            
            let dataBlock = RowDataBlock(buffer: dataForBlock)
            return try readTableData(tcInfo: tcInfo, blocks: blocks, dataBlocks: [dataBlock], rowIndices: rowIndices, subNodeTree: subNodeTree)
        } else if tcInfo.hnidRows.nid.rawValue != 0 {
            // Don't use GetBytesForHNID in this case, as we need to handle multiple blocks
            let dataBlocks = try readSubNodeRowDataBlocks(subNodeTree: subNodeTree, nid: tcInfo.hnidRows.nid)
            return try readTableData(tcInfo: tcInfo, blocks: blocks, dataBlocks: dataBlocks, rowIndices: rowIndices, subNodeTree: subNodeTree)
        } else {
            return []
        }
    }
    
    // Read all of the data blocks for a table, in the case where the rows are to be accessed via a sub node
    // The variation here is that for reading rows, we need to retain the block structure, so we return a set of blocks
    private mutating func readSubNodeRowDataBlocks(subNodeTree: BTree<Node>?, nid: NID) throws -> [RowDataBlock] {
        guard let subNode = subNodeTree?.lookup(key: UInt64(nid.rawValue)) else {
            return []
        }
        
        if subNode.subDataBid.rawValue != 0 {
            fatalError("NYI: sub-nodes of sub-nodes")
        }
        
        return try ndb.readBlocks(dataBid: subNode.dataBid).map(RowDataBlock.init)
    }

    private mutating func readTableData(tcInfo: TCINFO, blocks: [HNDataBlock], dataBlocks: [RowDataBlock], rowIndices: [TCROWID], subNodeTree: BTree<Node>?) throws -> [[UInt16: Any?]] {
        let rgCEBSize = Int((Float(tcInfo.cCols) / 8).rounded(.up))
        
        let blockTrailerSize: UInt32 = isUnicode ? 16 : 12
        let rowsPerBlock = (ndb.blockSize - blockTrailerSize) / UInt32(tcInfo.rgib.bm)
        
        var values: [[UInt16: Any?]] = []
        values.reserveCapacity(rowIndices.count)

        for index in rowIndices {
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
            var blockDataStream = DataStream(buffer: dataBlock.buffer)
            blockDataStream.position = readPosition
            
            let rgCEB = try blockDataStream.readBytes(count: rgCEBSize)
            var rowValues: [UInt16: Any?] = [:]
            rowValues.reserveCapacity(tcInfo.rgTCOLDESC.count)

            for column in tcInfo.rgTCOLDESC {
                // Check if the column exists
                if rgCEB[Int(column.iBit) / 8] & (0x01 << (7 - (Int(column.iBit) % 8))) == 0 {
                    continue
                }
                
                let value = try readTableColumnValue(subNodeTree: subNodeTree, blocks: blocks, column: column, blockDataStream: &blockDataStream, rowOffset: rowOffset)
                rowValues[column.tag.id] = value
            }
            
            values.append(rowValues)
        }
        
        return values
    }
    
    private mutating func readTableColumnValue(subNodeTree: BTree<Node>?, blocks: [HNDataBlock], column: TCOLDESC, blockDataStream: inout DataStream, rowOffset: Int) throws -> Any? {
        blockDataStream.position = rowOffset + Int(column.ibData)
        func readData<T>(hnid: HNID, readFunc: (inout DataStream, Int) throws -> T) throws -> T? {
            return try getBytes(blocks: blocks, subNodeTree: subNodeTree, hnid: hnid, readFunc: readFunc)
        }

        switch column.tag.type {
        case .unspecified:
            return nil
        case .null:
            return nil
        case .integer16:
            fatalError("NYI: PtypInteger16")
        case .integer32:
            if column.cbData != 4 {
                throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
            }

            return try blockDataStream.read(endianess: .littleEndian) as UInt32
        case .floating32:
            fatalError("NYI: PtypFloating32")
        case .floating64:
            fatalError("NYI: PtypFloating64")
        case .currency:
            fatalError("NYI: PtypCurrency")
        case .floatingTime:
            fatalError("NYI: PtypCurrency")
        case .errorCode:
            fatalError("NYI: PtypErrorCode")
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
            
            let hnid = try HNID(dataStream: &blockDataStream)
            if hnid.rawValue == 0 {
                return ""
            }
            
            return try readData(hnid: hnid) { try $0.readString(count: $1, encoding: .ascii)! }
        case .string:
            if column.cbData != 4 {
                throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
            }
            
            let hnid = try HNID(dataStream: &blockDataStream)
            if hnid.rawValue == 0 {
                return ""
            }
            
            return try readData(hnid: hnid) { try $0.readString(count: $1, encoding: .utf16LittleEndian)! }
        case .time:
            // In a Table Context, time values are held in line
            if column.cbData != 8 {
                throw PstReadError.invalidPropertySize(expected: 8, actual: column.cbData)
            }

            return try FILETIME(dataStream: &blockDataStream).date
        case .guid:
            fatalError("NYI: PtypGuid")
        case .serverId:
            fatalError("NYI: PtypServerId")
        case .restriction:
            fatalError("NYI: PtypRestriction")
        case .ruleAction:
            fatalError("NYI: PtypRuleAction")
        case .binary:
            if column.cbData != 4 {
                throw PstReadError.invalidPropertySize(expected: 4, actual: column.cbData)
            }
            
            let hnid = try HNID(dataStream: &blockDataStream)
            if hnid.rawValue == 0 {
                return []
            }
            
            return try readData(hnid: hnid) { Data(try $0.readBytes(count: $1)) }
        case .multipleInteger16:
            fatalError("NYI: PtypMultipleInteger16")
        case .multipleInteger32:
            fatalError("NYI: PtypMultipleInteger32")
        case .multipleFloating32:
            fatalError("NYI: PtypMultipleFloating32")
        case .multipleFloating64:
            fatalError("NYI: PtypMultipleFloating64")
        case .multipleCurrency:
            fatalError("NYI: PtypMultipleCurrency")
        case .multipleFloatingTime:
            fatalError("NYI: PtypMultipleFloatingTime")
        case .multipleInteger64:
            fatalError("NYI: PtypMultipleInteger64")
        case .multipleString8:
            fatalError("NYI: PtypMultipleString8")
        case .multipleString:
            fatalError("NYI: PtypMultipleString")
        case .multipleTime:
            fatalError("NYI: PtypMultipleTime")
        case .multipleGuid:
            fatalError("NYI: PtypMultipleGuid")
        case .multipleBinary:
            fatalError("NYI: PtypMultipleBinary")
        case .unknown:
            return nil
        }
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
    
    private struct HNDataBlock {
        public let index: Int
        public let buffer: [UInt8]
        public let rgbidAlloc: [UInt16]
        
        // In first block only
        public let bClientSig: ClientSignature?
        public let hidUserRoot: HID?
        
        public init(index: Int, buffer: [UInt8], rgbidAlloc: [UInt16], bClientSig: ClientSignature, hidUserRoot: HID) {
            self.index = index
            self.buffer = buffer
            self.rgbidAlloc = rgbidAlloc
            self.bClientSig = bClientSig
            self.hidUserRoot = hidUserRoot
        }
        
        public init(index: Int, buffer: [UInt8], rgbidAlloc: [UInt16]) {
            self.index = index
            self.buffer = buffer
            self.rgbidAlloc = rgbidAlloc
            self.bClientSig = nil
            self.hidUserRoot = nil
        }
    }
}
