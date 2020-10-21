//
//  LTP.HN.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import DataStream

internal extension LTP {
    /// [MS-PST] 2.3.1 HN (Heap-on-Node)
    /// The Heap-on-Node defines a standard heap over a node's data stream. Taking advantage of the
    /// flexible structure of the node, the organization of the heap data can take on several forms, depending
    /// on how much data is stored in the heap.
    /// For heaps whose size exceed the amount of data that can fit in one data block, the first data block in
    /// the HN contains a full header record and a trailer record. With the exception of blocks that require an
    /// HNBITMAPHDR structure, subsequent data blocks only have an abridged header and a trailer. This is
    /// explained in more detail in the following sections. Because the heap is a structure that is defined at a
    /// higher layer than the NDB, the heap structures are written to the external data sections of data blocks
    /// and do not use any information from the data block's NDB structure.
    struct HN {
        private var ndb: NDB
        public var type: PstFileType {
            return ndb.type
        }
        public var blocks: [HNDataBlock]
        
        public struct HNDataBlock {
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
        
        public init(ndb: NDB, dataBid: BID) throws {
            var blocks: [HNDataBlock] = []

            for entry in try ndb.readBlocks(dataBid: dataBid).enumerated() {
                var bufferDataStream = DataStream(buffer: entry.element)
                // First block contains a HNHDR
                if entry.offset == 0 {
                    let header = try HNHDR(dataStream: &bufferDataStream, type: ndb.type)
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
            
            self.ndb = ndb
            self.blocks = blocks
        }

        public func getDataStream(hid: HID) -> DataStream {
            let block = blocks[Int(hid.hidBlockIndex)]
            var dataStream = DataStream(buffer: block.buffer)
            
            let position = block.rgbidAlloc[Int(hid.hidIndex - 1)]
            dataStream.position = Int(position)

            return dataStream
        }
        
        /// Dereference the supplied HID in the supplied heap-on-node blocks, and return the size of the resulting data buffer
        public func getSize(hid: HID) -> UInt16 {
            let index = hid.hidIndex
            // Check for empty
            if index == 0 {
                return 0
            }

            let block = blocks[Int(hid.hidBlockIndex)]
            return block.rgbidAlloc[Int(index)] - block.rgbidAlloc[Int(index - 1)]
        }
        
        public func getBytes<T>(subNodeTree: BTree<Node>?, hnid: HNID, readFunc: (_ dataStream: inout DataStream, _ count: Int) throws -> T) throws -> T? {
            switch hnid.hidType {
            case .hid:
                if hnid.hid.hidIndex == 0 {
                    return nil
                }
                
                var dataStream = getDataStream(hid: hnid.hid)
                let size = getSize(hid: hnid.hid)
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
    }
}
