//
//  PAGETRAILER.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.7.1 PAGETRAILER
/// A PAGETRAILER structure contains information about the page in which it is contained. PAGETRAILER
/// structure is present at the very end of each page in a PST file.
internal struct PAGETRAILER: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let ptype: PageType
    public let ptypeRepeat: PageType
    public let wSig: UInt16
    public let dwCRC: UInt32
    public let bid: BID

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode
        
        /// ptype (1 byte): This value indicates the type of data contained within the page. This field MUST
        /// contain one of the following values.
        let rawPtype: UInt8 = try dataStream.read()
        guard let ptype = PageType(rawValue: rawPtype) else {
            throw PstReadError.invalidPtype(ptype: rawPtype)
        }
        
        self.ptype = ptype
        
        // ptypeRepeat (1 byte): MUST be set to the same value as ptype.
        let rawPtypeRepeat: UInt8 = try dataStream.read()
        guard let ptypeRepeat = PageType(rawValue: rawPtypeRepeat) else {
            throw PstReadError.invalidPtypeRepeat(ptype: ptype.rawValue, ptypeRepeat: rawPtypeRepeat)
        }
        
        self.ptypeRepeat = ptypeRepeat
        
        /// wSig (2 bytes): Page signature. This value depends on the value of the ptype field. This value is
        /// zero (0x0000) for AMap, PMap, FMap, and FPMap pages. For BBT, NBT, and DList pages, a page /
        /// block signature is computed (see section 5.5).
        wSig = try dataStream.read(endianess: .littleEndian)
        
        /// dwCRC (4 bytes): 32-bit CRC of the page data, excluding the page trailer. See section 5.3 for the
        /// CRC algorithm. Note the locations of the dwCRC and bid are differs between the Unicode and ANSI
        /// version of this structure.
        dwCRC = try dataStream.read(endianess: .littleEndian)
        
        /// bid (Unicode: 8 bytes; ANSI 4 bytes): The BID of the page's block. AMap, PMap, FMap, and FPMap
        /// pages have a special convention where their BID is assigned the same value as their IB (that is,
        /// the absolute file offset of the page). The bidIndex for other page types are allocated from the
        /// special bidNextP counter in the HEADER structure.
        bid = try BID(dataStream: &dataStream, isUnicode: isUnicode)
    }
    
    public var debugDescription: String {
        var s = "PAGETRAILER\n"
        s += "- ptype: \(ptype)\n"
        s += "- ptypeRepeat: \(ptypeRepeat)\n"
        s += "- wSig: \(wSig.hexString)\n"
        s += "- dwCRC: \(dwCRC.hexString)\n"
        s += "- bid: \(bid)\n"
        return s
    }
}
