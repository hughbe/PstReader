//
//  HNPAGEHDR.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

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
/// [MS-PST] 2.3.1.3 HNPAGEHDR
/// This is the header record used in subsequent data blocks of the HN that do not require a new Fill Level
/// Map (see next section). This is only used when multiple data blocks are present.
internal struct HNPAGEHDR: CustomDebugStringConvertible {
    public let ibHnpm: UInt16
    
    public init(dataStream: inout DataStream) throws {
        /// ibHnpm (2 bytes): The bytes offset to the HNPAGEMAP record (section 2.3.1.5), with respect to
        /// the beginning of the HNPAGEHDR structure.
        self.ibHnpm = try dataStream.read(endianess: .littleEndian)
    }

    public var debugDescription: String {
        var s = "HNPAGEHDR\n"
        s += "- ibHnpm: \(ibHnpm.hexString)\n"
        return s
    }
}
