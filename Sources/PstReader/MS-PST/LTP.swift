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
internal class LTP {
    public static func readPropertyContext(ndb: NDB, nid: NID) throws -> PropertyContext {
        return try PropertyContext(ndb: ndb, nid: nid)
    }
    
    /// This is a cutdown version of the table reader to fetch subfolder NIDs from the hierarchy table of a folder, avoiding the overhead of reading the data rows when scanning the folder tree
    public static func readTableRowIds(ndb: NDB, nid: NID) throws -> [NID] {
        guard let node = try ndb.lookupNode(nid: nid) else {
            return []
        }

        let heapOnNode = try HN(ndb: ndb, dataBid: node.dataBid)
        guard let firstBlock = heapOnNode.blocks.first, firstBlock.bClientSig! == .tc else {
            return []
        }
        
        // Read the table information
        var dataStream = heapOnNode.getDataStream(hid: firstBlock.hidUserRoot!)
        let tcInfo = try TCINFO(dataStream: &dataStream)
        
        // Read the row index and return the NIDs from it
        let btreeOnHeap = try BTreeOnHeap<TCROWID>(heapOnNode: heapOnNode, hid: tcInfo.hidRowIndex)
        return btreeOnHeap.bthList.map { $0.dwRowID }
    }
    
    public static func readTable(ndb: NDB, nid: NID) throws -> TableContext {
        return try TableContext(ndb: ndb, nid: nid)
    }
}
