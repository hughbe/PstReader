//
//  NDB.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 1.3.1.1 Node Database (NDB) Layer
/// The NDB layer consists of a database of nodes, which represents the lower-level storage facilities of the PST file format.
/// From an implementation standpoint, the NDB layer consists of the header, file allocation information, blocks, nodes, and
/// two BTrees: the Node BTree (NBT) and the Block BTree (BBT).
/// The NBT contains references to all of the accessible nodes in the PST file. Its BTree implementation
/// allows for efficient searches to locate any specific node. Each node reference is represented using a
/// set of four properties that includes its NID, parent NID, data BID, and subnode BID. The data BID
/// points to the block that contains the data associated with the node, and the subnode BID points to the
/// block that contains references to subnodes of this node. Top-level NIDs are unique across the PST and
/// are searchable from the NBT. Subnode NIDs are only unique within a node and are not searchable (or
/// found) from the NBT. The parent NID is an optimization for the higher layers and has no meaning for
/// the NDB Layer.
/// The BBT contains references to all of the data blocks of the PST file. Its BTree implementation allows
/// for efficient searches to locate any specific block. A block reference is represented using a set of four
/// properties, which includes its BID, IB, CB, and CREF. The IB is the offset within the file where the
/// block is located. The CB is the count of bytes stored within the block. The CREF is the count of
/// references to the data stored within the block.
/// The roots of the NBT and BBT can be accessed from the header of the PST file.
internal class NDB {
    public var isUnicode: Bool {
        return header.isUnicode
    }
    
    public var blockSize: UInt32 {
        return 8192
    }

    private var dataStream: DataStream
    private var header: HEADER
    private var nodeTree = BTree<Node>()
    private var blockTree = BTree<Block>()
    public var deferReadingNodes = false
    
    init(dataStream: inout DataStream) throws {
        self.dataStream = dataStream
        let header = try HEADER(dataStream: &dataStream)
        self.header = header

        try readBTPage(dataStream: &dataStream, offset: header.root.BREFNBT.ib, parent: nodeTree.root)
        try readBTPage(dataStream: &dataStream, offset: header.root.BREFBBT.ib, parent: blockTree.root)
    }
    
    func readBTPage(dataStream: inout DataStream, offset: IB, parent: TreeIntermediate) throws {
        dataStream.position = Int(offset.rawValue)
        
        let page = try BTPAGE(dataStream: &dataStream, isUnicode: isUnicode)
        
        var entriesDataStream = DataStream(buffer: page.rgentries)
        for _ in 0..<page.cEnt {
            if page.cLevel > 0 {
                let entry = try BTENTRY(dataStream: &entriesDataStream, isUnicode: isUnicode)
                let intermediate = TreeIntermediate(key: entry.btkey)
                parent.children.append(intermediate)
                if deferReadingNodes {
                    intermediate.fileOffset = entry.BREF.ib
                } else {
                    try readBTPage(dataStream: &dataStream, offset: entry.BREF.ib, parent: intermediate)
                    intermediate.fileOffset = nil
                }
            } else if page.pageTrailer.ptype == .nodeBTree {
                let entry = try NBTENTRY(dataStream: &entriesDataStream, isUnicode: isUnicode)
                parent.children.append(Node(entry: entry))
            } else if page.pageTrailer.ptype == .blockBTree {
                let entry = try BBTENTRY(dataStream: &entriesDataStream, isUnicode: isUnicode)
                parent.children.append(Block(entry: entry))
            } else {
                throw PstReadError.invalidPageEntryType(pageEntryType: page.pageTrailer.ptype.rawValue)
            }
        }
    }
    
    func readDeferred(intermediate: TreeIntermediate) throws {
        var dataStream = self.dataStream
        try self.readBTPage(dataStream: &dataStream, offset: intermediate.fileOffset!, parent: intermediate)
        intermediate.fileOffset = nil
    }
    
    /// Look up a node in the main node b-tree
    public func lookupNode(nid: NID) throws -> Node? {
        return try nodeTree.lookup(key: UInt64(nid.rawValue), readDeferred: readDeferred)
    }
    
    public func readSubNodeBTree(bid: BID) throws -> BTree<Node>? {
        if bid.rawValue == 0 {
            return nil
        }

        let tree = BTree<Node>()
        try readSubNodeBTree(bid: bid, parent: tree.root)
        return tree
    }
    
    private func readAndDecompress(block: Block, buffer: UnsafeMutableBufferPointer<UInt8>) throws -> Int {
        dataStream.position = Int(block.offset.rawValue)
        try dataStream.copyBytes(to: buffer, count: Int(block.length))
        return Int(block.length)
    }
    
    /// When a data block has a subnode, it can be a simple node, or a two-level tree
    /// This reads a sub node and builds suitable data structures, so that we can later access data held in it
    private func readSubNodeBTree(bid: BID, parent: TreeIntermediate) throws {
        guard let block = try lookupBlock(bid: bid) else {
            fatalError("No such block \(bid)")
        }
        
        var buffer = [UInt8](repeating: 0, count: Int(block.length))
        _ = try buffer.withUnsafeMutableBufferPointer {
            try readAndDecompress(block: block, buffer: $0)
        }
        
        /// [MS-PST] 2.2.2.8.3.3 Subnode BTree
        /// The subnode BTree collectively refers to all the elements that make up a subnode. The subnode BTree
        /// is a BTree that is made up of SIBLOCK and SLBLOCK structures, which contain SIENTRY and SLENTRY
        /// structures, respectively. These structures are defined in the following sections.
        var blockDataStream = DataStream(buffer: buffer)
        let btype: UInt8 = try blockDataStream.read()
        if btype != 0x02 {
            throw PstReadError.invalidBtype(btype: btype)
        }
        
        let cLevel: UInt8 = try blockDataStream.read()
        blockDataStream.position = 0
        switch cLevel {
        case 0x00:
            let slBlock = try SLBLOCK(dataStream: &blockDataStream, isUnicode: isUnicode)
            for entry in slBlock.rgentries {
                parent.children.append(Node(entry: entry))
            }
        case 0x01:
            let siBlock = try SIBLOCK(dataStream: &blockDataStream, isUnicode: isUnicode)
            for entry in siBlock.rgentries {
                let intermediate = TreeIntermediate(key: UInt64(entry.nid.rawValue))
                parent.children.append(intermediate)
                
                // Read child nodes in tree
                try readSubNodeBTree(bid: entry.bid, parent: intermediate)
            }
        default:
            throw PstReadError.invalidCLevel(cLevel: cLevel)
        }
    }
    
    // Look up a block in the main data block b-tree
    public func lookupBlock(bid: BID) throws -> Block? {
        // Clear the LSB, which is reserved, but sometimes set
        return try blockTree.lookup(key: bid.rawValue & 0xFFFFFFFE, readDeferred: readDeferred);
    }
    
    private func decrypt(buffer: inout [UInt8], key: UInt32, offset: Int = 0, count: Int = 0) {
        return Crypto.decrypt(buffer: &buffer, method: header.bCryptMethod, key: key, offset: offset, count: count > 0 ? count: buffer.count - offset)
    }
    
    public func readBlocks(dataBid: BID) throws -> [[UInt8]] {
        var blocks: [[UInt8]] = []
        try readBlocks(dataBid: dataBid, blocks: &blocks, totalLength: 0)
        return blocks
    }
    
    private func readBlocks(dataBid: BID, blocks: inout [[UInt8]], totalLength: UInt32) throws {
        guard let block = try lookupBlock(bid: dataBid) else {
            fatalError("No such block \(dataBid)")
        }
        
        var buffer = [UInt8](repeating: 0, count: Int(block.length))
        _ = try buffer.withUnsafeMutableBufferPointer {
            try readAndDecompress(block: block, buffer: $0)
        }
        
        if block.isInternal {
            var blockDataStream = DataStream(buffer: buffer)
            let btype: UInt8 = try blockDataStream.read()
            if btype != 0x01 {
                throw PstReadError.invalidBtype(btype: btype)
            }
            
            let cLevel: UInt8 = try blockDataStream.read()
            blockDataStream.position = 0
            
            switch cLevel {
            case 0x01:
                let xBlock = try XBLOCK(dataStream: &blockDataStream, isUnicode: isUnicode)
                for bid in xBlock.rgbid {
                    // Recurse.
                    // Pass what we know here of the total length through, so that it can be returned on the first block
                    try readBlocks(dataBid: bid, blocks: &blocks, totalLength: totalLength != 0 ? totalLength : xBlock.lcbTotal)
                }
            case 0x02:
                let xxBlock = try XXBLOCK(dataStream: &blockDataStream, isUnicode: isUnicode)
                for bid in xxBlock.rgbid {
                    // Recurse.
                    // Pass what we know here of the total length through, so that it can be returned on the first block
                    try readBlocks(dataBid: bid, blocks: &blocks, totalLength: totalLength != 0 ? totalLength : xxBlock.lcbTotal)
                }
            default:
                throw PstReadError.invalidCLevel(cLevel: cLevel)
            }
        } else {
            // Key for cyclic algorithm is the low 32 bits of the BID, so supply it in case it's needed
            decrypt(buffer: &buffer, key: UInt32(dataBid.rawValue & 0xFFFF))
            blocks.append(buffer)
        }
    }
    
    public func readSubNodeBlock(subNodeTree: BTree<Node>, nid: NID) throws -> [UInt8] {
        if nid.rawValue == 0 {
            return []
        }
        
        guard let node = subNodeTree.lookup(key: UInt64(nid.rawValue)) else {
            return []
        }
        
        if node.subDataBid.rawValue != 0 {
            guard let subNodeTree = try readSubNodeBTree(bid: node.subDataBid) else {
                return []
            }

            return try readSubNodeBlock(subNodeTree: subNodeTree, nid: nid)
        }
        
        return try readBlock(dataBid: node.dataBid)
    }
    
    public func readBlock(dataBid: BID) throws -> [UInt8] {
        let blocks = try readBlocks(dataBid: dataBid)
        let totalSize = blocks.map { $0.count }.reduce(0, +)
        var result: [UInt8] = []
        result.reserveCapacity(totalSize)
        for block in blocks {
            result.append(contentsOf: block)
        }
        
        return result
    }
}
