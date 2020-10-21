//
//  BTree.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import Foundation
import MAPI

/// [MS-PST] 2.2.2.7.7 BTrees
/// BTrees are widely used throughout the PST file format. In the NDB Layer, BTrees are the building
/// blocks for the NBT and BBT, which are used to quickly navigate and search nodes and blocks. The PST
/// file format uses a general BTree implementation that supports up to 8 intermediate levels.
internal struct BTree<T> : CustomDebugStringConvertible where T: TreeNode {
    public var root = TreeIntermediate(key: 0)
    
    public func lookup(key: UInt64, readDeferred: ((TreeIntermediate) throws -> Void)? = nil) rethrows -> T? {
        return try lookupTreeNode(parent: root, key: key, readDeferred: readDeferred) as! T?
    }
    
    private func lookupTreeNode(parent: TreeIntermediate, key: UInt64, readDeferred: ((TreeIntermediate) throws -> Void)?) rethrows -> TreeNode? {
        if parent.readDeferred {
            if readDeferred == nil {
                fatalError("Deferred index found, but no reader supplied")
            }
            
            try readDeferred!(parent)
        }

        var next: TreeIntermediate? = nil
        for child in parent.children {
            if key > child.key {
                next = child as? TreeIntermediate
            } else if key < child.key {
                guard let next = next else {
                    // Key does not exist.
                    return nil
                }
                
                return try lookupTreeNode(parent: next, key: key, readDeferred: readDeferred)
            } else {
                // Key matches
                if let childIntermediate = child as? TreeIntermediate {
                    return try lookupTreeNode(parent: childIntermediate, key: key, readDeferred: readDeferred)
                }
                
                return child
            }
        }
        
        guard let nextNode = next else {
            // Key does not exist
            return nil
        }
        
        return try lookupTreeNode(parent: nextNode, key: key, readDeferred: readDeferred)
    }
    
    public var debugDescription: String {
        return root.debugDescription
    }
}

/// The only thing that a tree node must have is a key
internal class TreeNode: CustomDebugStringConvertible {
    var key: UInt64
    
    public init(key: UInt64) {
        self.key = key
    }
    
    public var debugDescription: String {
        fatalError("Should override")
    }
}

/// Non-terminal tree nodes have children
internal class TreeIntermediate: TreeNode {
    var children: [TreeNode] = []
    var fileOffset: IB? = nil
    var readDeferred: Bool {
        return fileOffset != nil
    }
    
    public override var debugDescription: String {
        var s = "Key: \(key)\n"
        for child in children {
            s += "- \(child)"
        }
        
        return s
    }
}

internal class Node: TreeNode {
    public var type: NIDType
    public var dataBid: BID
    public var subDataBid: BID
    public var parent: NID?
    
    public init(entry: NBTENTRY) {
        self.type = entry.nid.type
        self.dataBid = entry.bidData
        self.subDataBid = entry.bidSub
        self.parent = entry.nidParent
        super.init(key: UInt64(entry.nid.rawValue))
    }
    
    public init(entry: SLENTRY) {
        self.type = entry.nid.type
        self.dataBid = entry.bidData
        self.subDataBid = entry.bidSub
        self.parent = nil
        super.init(key: UInt64(entry.nid.rawValue))
    }
    
    public override var debugDescription: String {
        var s = "Node\n"
        s += "- key: \(key)\n"
        s += "- type: \(type)\n"
        s += "- dataBid: \(dataBid)\n"
        s += "- subDataBid: \(subDataBid)\n"
        if let parent = parent {
            s += "- parent: \(parent)\n"
        }
        return s
    }
}

internal class Block: TreeNode {
    var offset: IB
    var length: UInt16
    var inflatedLength: UInt16

    var isInternal: Bool {
        return (key & 0x02) != 0
    }
    
    public init(entry: BBTENTRY) {
        self.offset = entry.BREF.ib
        self.length = entry.cb
        self.inflatedLength = entry.type == .unicode4K ? entry.cbInflated! : entry.cb
        super.init(key: entry.BREF.bid.rawValue)
    }
    
    public override var debugDescription: String {
        var s = "Block\n"
        s += "- key: \(key)\n"
        s += "- offset: \(offset)\n"
        s += "- length: \(length)\n"
        s += "- inflatedLength: \(inflatedLength)\n"
        return s
    }
}
