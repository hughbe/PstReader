//
//  HID.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

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
/// [MS-PST] 2.3.1.1 HID
/// An HID is a 4-byte value that identifies an item allocated from the heap. The value is unique only
/// within the heap itself. The following is the structure of an HID.
internal struct HID {
    public let rawValue: UInt32
    public let hidType: NIDType
    public let hidIndex: UInt32
    public let hidBlockIndex: UInt32
    
    public init(dataStream: inout DataStream) throws {
        self.init(rawValue: try dataStream.read(endianess: .littleEndian))
    }
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
        
        /// nidType (5 bits): Identifies the type of the node represented by the NID. The following table
        /// specifies a list of values for nidType. However, it is worth noting that nidType has no meaning to
        /// the structures defined in the NDB Layer.
        let rawHidType = rawValue & 0b11111
        guard let hidType = NIDType(rawValue: rawHidType) else {
            fatalError("Unknown type \(rawHidType)")
        }
        
        self.hidType = hidType
        
        /// hidIndex (11 bits): HID index. This is the 1-based index value that identifies an item allocated from
        /// the heap node. This value MUST NOT be zero.
        self.hidIndex = (rawValue >> 5) & 0b11111111111
        
        /// hidBlockIndex (16 bits): This is the zero-based data block index. This number indicates the zerobased index of the data block in which this heap item resides.
        self.hidBlockIndex = (rawValue >> 16) & 0b1111111111111111
    }
}
