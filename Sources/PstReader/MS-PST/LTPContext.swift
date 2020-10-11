//
//  LTPContext.swift
//  
//
//  Created by Hugh Bellamy on 10/10/2020.
//

internal protocol LTPContext {
    init(ndb: NDB, subNodeTree: BTree<Node>?, dataBid: BID) throws
}

internal extension LTPContext {
    init(ndb: NDB, nid: NID) throws {
        guard let node = try ndb.lookupNode(nid: nid) else {
            throw PstReadError.noSuchNode(nid: nid.rawValue)
        }
        
        let subNodeTree = try ndb.readSubNodeBTree(bid: node.subDataBid)
        try self.init(ndb: ndb, subNodeTree: subNodeTree, dataBid: node.dataBid)
    }
    
    init(ndb: NDB, nid: NID, subNodeTree: BTree<Node>) throws {
        guard let childSubNode = subNodeTree.lookup(key: UInt64(nid.rawValue)) else {
            throw PstReadError.noSuchNode(nid: nid.rawValue)
        }
        
        let childSubNodeTree = try ndb.readSubNodeBTree(bid: childSubNode.subDataBid)
        try self.init(ndb: ndb, subNodeTree: childSubNodeTree, dataBid: childSubNode.dataBid)
    }
}
