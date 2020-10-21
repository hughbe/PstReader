//
//  HNHDR.swift
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
/// [MS-PST] 2.3.1.2 HNHDR
/// The HNHDR record resides at the beginning of the first data block in the HN (an HN can span several
/// blocks), which contains root information about the HN.
internal struct HNHDR: CustomDebugStringConvertible {
    public let ibHnpm: UInt16
    public let bSig: UInt8
    public let bClientSig: ClientSignature
    public let hidUserRoot: HID
    public let rgbFillLevel: [FillLevel]
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// ibHnpm (2 bytes): The byte offset to the HN page Map record (section 2.3.1.5), with respect to the
        /// beginning of the HNHDR structure.
        self.ibHnpm = try dataStream.read(endianess: .littleEndian)
        
        /// bSig (1 byte): Block signature; MUST be set to 0xEC to indicate an HN.
        self.bSig = try dataStream.read()
        if self.bSig != 0xEC {
            throw PstReadError.invalidBSig(bSig: self.bSig)
        }
        
        /// bClientSig (1 byte): Client signature. This value describes the higher-level structure that is
        /// implemented on top of the HN. This value is intended as a hint for a higher-level structure and has
        /// no meaning for structures defined at the HN level. The following values are pre-defined for
        /// bClientSig. All other values not described in the following table are reserved and MUST NOT be
        /// assigned or used.
        let rawBClientSig: UInt8 = try dataStream.read()
        guard let bClientSig = ClientSignature(rawValue: rawBClientSig) else {
            throw PstReadError.invalidBClientSig(bClientSig: rawBClientSig)
        }
        
        self.bClientSig = bClientSig
        
        /// hidUserRoot (4 bytes): HID that points to the User Root record. The User Root record contains data
        /// that is specific to the higher level.
        self.hidUserRoot = try HID(dataStream: &dataStream, type: type)
        
        /// rgbFillLevel (4 bytes): Per-block Fill Level Map. This array consists of eight 4-bit values that indicate
        /// the fill level for each of the first 8 data blocks (including this header block). If the HN has fewer
        /// than 8 data blocks, then the values corresponding to the non-existent data blocks MUST be set to
        /// zero. The following table explains the values indicated by each 4-bit value.
        var rgbFillLevel: [FillLevel] = []
        rgbFillLevel.reserveCapacity(8)
        for _ in 0..<4 {
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
        var s = "HNHDR\n"
        s += "- ibHnpm: \(ibHnpm.hexString)\n"
        s += "- bSig: \(bSig.hexString)\n"
        s += "- bClientSig: \(bClientSig)\n"
        s += "- hidUserRoot: \(hidUserRoot)\n"
        for entry in rgbFillLevel.enumerated() {
            s += "- rgbFillLevel[\(entry.offset)] \(entry.element)"
        }
        return s
    }
}
