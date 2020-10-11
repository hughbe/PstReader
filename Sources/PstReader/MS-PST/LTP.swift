//
//  LTP.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

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
}
