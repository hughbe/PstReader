//
//  HNPAGEMAP.swift
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
/// [MS-PST] 2.3.1.5 HNPAGEMAP
/// The HNPAGEMAP is the last item in the variable length data portion of the block immediately
/// following the last heap item. There can be anywhere from 0 to 63 bytes of padding between the
/// HNPAGEMAP and the block trailer. The beginning of the HNPAGEMAP is aligned on a 2-byte
/// boundary so there can be an additional 1 byte of padding between the last heap item and the
/// HNPAGEMAP.
/// The HNPAGEMAP structure contains the information about the allocations in the page. The
/// HNPAGEMAP is located using the ibHnpm field in the HNHDR, HNPAGEHDR and HNBITMAPHDR
/// records.
internal struct HNPAGEMAP: CustomDebugStringConvertible {
    public let cAlloc: UInt16
    public let cFree: UInt16
    public let rgibAlloc: [UInt16]
    
    public init(dataStream: inout DataStream) throws {
        /// cAlloc (2 bytes): Allocation count. This represents the number of items (allocations) in the HN.
        self.cAlloc = try dataStream.read(endianess: .littleEndian)
        
        /// cFree (2 bytes): Free count. This represents the number of freed items in the HN.
        self.cFree = try dataStream.read(endianess: .littleEndian)
        
        /// rgibAlloc (variable): Allocation table. This contains cAlloc + 1 entries. Each entry is a WORD value
        /// that is the byte offset to the beginning of the allocation. An extra entry exists at the cAlloc + 1st
        /// position to mark the offset of the next available slot. Therefore, the nth allocation starts at offset
        /// rgibAlloc[n] (from the beginning of the HN header), and its size is calculated as rgibAlloc[n +
        /// 1] – rgibAlloc[n] bytes.
        var rgibAlloc: [UInt16] = []
        rgibAlloc.reserveCapacity(Int(self.cAlloc) + 1)
        for _ in 0..<cAlloc + 1 {
            let entry: UInt16 = try dataStream.read(endianess: .littleEndian)
            rgibAlloc.append(entry)
        }
        
        self.rgibAlloc = rgibAlloc
    }

    public var debugDescription: String {
        var s = "HNPAGEMAP\n"
        s += "- cAlloc: \(cAlloc.hexString)\n"
        s += "- cFree: \(cFree.hexString)\n"
        for entry in rgibAlloc.enumerated() {
            s += "- rgibAlloc[\(entry.offset)] \(entry.element.hexString)"
        }
        return s
    }
}
