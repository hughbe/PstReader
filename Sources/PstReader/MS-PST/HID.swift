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
    public let wValue1: UInt16
    public let wValue2: UInt16
    public let hidType: NIDType
    public let hidIndex: UInt16
    public let hidBlockIndex: UInt16
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        let wValue1: UInt16 = try dataStream.read(endianess: .littleEndian)
        let wValue2: UInt16 = try dataStream.read(endianess: .littleEndian)
        self.init(wValue1: wValue1, wValue2: wValue2, type: type)
    }
    
    public init(wValue1: UInt16, wValue2: UInt16, type: PstFileType) {
        self.wValue1 = wValue1
        self.wValue2 = wValue2
        
        /// nidType (5 bits): Identifies the type of the node represented by the NID. The following table
        /// specifies a list of values for nidType. However, it is worth noting that nidType has no meaning to
        /// the structures defined in the NDB Layer.
        let rawHidType = wValue1 & 0x001F
        guard let hidType = NIDType(rawValue: rawHidType) else {
            fatalError("Unknown type \(rawHidType)")
        }
        
        self.hidType = hidType
        
        /// hidIndex (11 bits): HID index. This is the 1-based index value that identifies an item allocated from
        /// the heap node. This value MUST NOT be zero.
        switch type {
        case .ansi, .unicode:
            self.hidIndex = wValue1 >> 5
        case .unicode4K:
            self.hidIndex = (wValue1 >> 5) | ((wValue2 & 0x0007) << 11)
        }
        
        /// hidBlockIndex (16 bits): This is the zero-based data block index. This number indicates the zerobased index of the data block in which this heap item resides.
        switch type {
        case .ansi, .unicode:
            self.hidBlockIndex = wValue2
        case .unicode4K:
            self.hidBlockIndex = wValue2 >> 3
        }
    }
}
