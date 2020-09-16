//
//  HNBITMAPHDR.swift
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
/// [MS-PST] 2.3.1.4 HNBITMAPHDR
/// Beginning with the eighth data block, a new Fill Level Map is required. An HNBITMAPHDR fulfills this
/// requirement. The Fill Level Map in the HNBITMAPHDR can map 128 blocks. This means that an
/// HNBITMAPHDR appears at data block 8 (the first data block is data block 0) and thereafter every 128
/// blocks. (that is, data block 8, data block 136, data block 264, and so on).
internal struct HNBITMAPHDR: CustomDebugStringConvertible {
    public let ibHnpm: UInt16
    public let rgbFillLevel: [FillLevel]
    
    public init(dataStream: inout DataStream) throws {
        /// ibHnpm (2 bytes): The byte offset to the HNPAGEMAP record (section 2.3.1.5) relative to the
        /// beginning of the HNPAGEHDR structure.
        self.ibHnpm = try dataStream.read(endianess: .littleEndian)
        
        /// rgbFillLevel (64 bytes): Per-block Fill Level Map. This array consists of one hundred and twentyeight (128) 4-bit values that indicate the fill level for the next 128 data blocks (including this data
        /// block). If the HN has fewer than 128 data blocks after this data block, then the values
        /// corresponding to the non-existent data blocks MUST be set to zero. See rgbFillLevel in section
        /// 2.3.1.2 for possible values.
        var rgbFillLevel: [FillLevel] = []
        rgbFillLevel.reserveCapacity(128)
        for _ in 0..<64 {
            let byteValue: UInt8 = try dataStream.read()
            let rawFillLevel1 = byteValue & 0b1111
            let rawFillLevel2 = UInt8(byteValue >> 4)
            
            guard let fillLevel1 = FillLevel(rawValue: rawFillLevel1) else {
                throw PstReadError.invalidFillLevel(fillLevel: rawFillLevel1)
            }
            
            guard let fillLevel2 = FillLevel(rawValue: rawFillLevel2) else {
                throw PstReadError.invalidFillLevel(fillLevel: rawFillLevel2)
            }
            
            rgbFillLevel.append(fillLevel1)
            rgbFillLevel.append(fillLevel2)
        }
        
        self.rgbFillLevel = rgbFillLevel
    }

    public var debugDescription: String {
        var s = "HNBITMAPHDR\n"
        s += "- ibHnpm: \(ibHnpm.hexString)\n"
        for entry in rgbFillLevel.enumerated() {
            s += "- rgbFillLevel[\(entry.offset)] \(entry.element)"
        }
        return s
    }
}
