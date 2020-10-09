//
//  LTP.TableContext.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import DataStream
import Foundation
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
    struct TableContext {
        public let rows: [TableRow]
        
        public init(ndb: NDB, nid: NID) throws {
            guard let node = try ndb.lookupNode(nid: nid) else {
                rows = []
                return
            }
            
            let subNodeTree = try ndb.readSubNodeBTree(bid: node.subDataBid)
            
            let heapOnNode = try HN(ndb: ndb, dataBid: node.dataBid)
            guard let firstBlock = heapOnNode.blocks.first, firstBlock.bClientSig! == .tc else {
                rows = []
                return
            }
            
            /// The hidUserRoot of the HNHDR points to the TC header, which is allocated from the heap with
            /// HID=0x20. The TC header contains a TCINFO structure, followed by an array of column descriptors.
            /// The TCINFO structure contains pointers that point to the RowIndex (hidRowIndex) and The Row
            /// Matrix (hnidRowData). The RowIndex is allocated off the heap, whereas the Row Matrix is stored in
            /// the subnode (in rare cases where the TC is very small, the Row Matrix can be stored in a heap
            /// allocation instead. Note that the subnode structure in the diagram is significantly simplified for
            /// illustrative purposes.
            var dataStream = heapOnNode.getDataStream(hid: firstBlock.hidUserRoot!)
            let tcInfo = try TCINFO(dataStream: &dataStream)
            
            /// [MS-PST] 2.3.4.3 The RowIndex
            /// The hidRowIndex member in TCINFO points to an embedded BTH that contains an array of
            /// (dwRowID, dwRowIndex) value pairs, which provides a 32-bit primary index for searching the Row
            /// Matrix. Simply put, the RowIndex maps dwRowID, a unique identifier, to the index of a particular
            /// row in the Row Matrix.
            /// The RowIndex itself is a generic mechanism to provide a 32-bit primary key and therefore it is up to
            /// the implementation to decide what value to use for the primary key. However, an NID value is used as
            /// the primary key because of its uniqueness within a PST.
            /// The following is the layout of the BTH data record used in the RowIndex.
            let btreeOnHeap = try BTreeOnHeap<TCROWID>(heapOnNode: heapOnNode, hid: tcInfo.hidRowIndex)

            func readValue(column: TCOLDESC, blockDataStream: inout DataStream, rowOffset: Int) throws -> Any? {
                blockDataStream.position = rowOffset + Int(column.ibData)
                func readData<T>(hnid: HNID, readFunc: (inout DataStream, Int) throws -> T) throws -> T? {
                    return try heapOnNode.getBytes(subNodeTree: subNodeTree, hnid: hnid, readFunc: readFunc)
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
            
            func readTableData(dataBlocks: [RowDataBlock]) throws -> [TableRow] {
                let rgCEBSize = Int((Float(tcInfo.cCols) / 8).rounded(.up))
                
                let blockTrailerSize: UInt32 = ndb.isUnicode ? 16 : 12
                let rowsPerBlock = (ndb.blockSize - blockTrailerSize) / UInt32(tcInfo.rgib.bm)
                
                var rows: [TableRow] = []
                rows.reserveCapacity(btreeOnHeap.bthList.count)
                for index in btreeOnHeap.bthList {
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
                    var properties: [UInt16: Any?] = [:]
                    properties.reserveCapacity(tcInfo.rgTCOLDESC.count)

                    for column in tcInfo.rgTCOLDESC {
                        // Check if the column exists
                        if rgCEB[Int(column.iBit) / 8] & (0x01 << (7 - (Int(column.iBit) % 8))) == 0 {
                            continue
                        }
                        
                        let value = try readValue(column: column, blockDataStream: &blockDataStream, rowOffset: rowOffset)
                        properties[column.tag.id] = value
                    }
                    
                    rows.append(TableRow(nid: index.dwRowID, properties: properties))
                }
                
                return rows
            }
            
            // The data rows may be held in line, or in a sub node
            if tcInfo.hnidRows.hidType == .hid {
                // Data is in line
                let data = try heapOnNode.getBytes(subNodeTree: subNodeTree, hnid: tcInfo.hnidRows) { (dataStream, count) in
                    return try dataStream.readBytes(count: count)
                }
                guard let dataForBlock = data else {
                    self.rows = []
                    return
                }
                
                let dataBlock = RowDataBlock(buffer: dataForBlock)
                self.rows = try readTableData(dataBlocks: [dataBlock])
            } else if tcInfo.hnidRows.nid.rawValue != 0 {
                guard let subNode = subNodeTree?.lookup(key: UInt64(tcInfo.hnidRows.nid.rawValue)) else {
                    self.rows = []
                    return
                }
                
                if subNode.subDataBid.rawValue != 0 {
                    fatalError("NYI: sub-nodes of sub-nodes")
                }
                
                let dataBlocks = try ndb.readBlocks(dataBid: subNode.dataBid).map(RowDataBlock.init)
                //let dataBlocks = try ltp.readSubNodeRowDataBlocks(subNodeTree: subNodeTree, nid: tcInfo.hnidRows.nid)
                self.rows = try readTableData(dataBlocks: dataBlocks)
            } else {
                self.rows = []
                return
            }
        }
        
        public struct TableRow {
            public let nid: NID
            public let properties: [UInt16: Any?]
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
