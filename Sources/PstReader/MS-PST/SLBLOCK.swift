//
//  SLBLOCK.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.8.3.3 Subnode BTree
/// The subnode BTree collectively refers to all the elements that make up a subnode. The subnode BTree
/// is a BTree that is made up of SIBLOCK and SLBLOCK structures, which contain SIENTRY and SLENTRY
/// structures, respectively. These structures are defined in the following sections.
/// [MS-PST] 2.2.2.8.3.3.1 SLBLOCKs
/// An SLBLOCK is a block that contains an array of SLENTRYs. It is used to reference the subnodes of a
/// node.
/// [MS-PST] 2.2.2.8.3.3.1.2 SLBLOCK
internal struct SLBLOCK: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let btype: UInt8
    public let cLevel: UInt8
    public let cEnt: UInt16
    public let dwPadding: UInt32?
    public let rgentries: [SLENTRY]
    //public let blockTrailer: BLOCKTRAILER
    
    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// btype (1 byte): Block type; MUST be set to 0x02.
        self.btype = try dataStream.read()
        if self.btype != 0x02 {
            throw PstReadError.invalidBtype(btype: self.btype)
        }
        
        /// cLevel (1 byte): MUST be set to 0x00.
        self.cLevel = try dataStream.read()
        if self.cLevel != 0x00 {
            throw PstReadError.invalidCLevel(cLevel: self.cLevel)
        }
        
        /// cEnt (2 bytes): The number of SLENTRYs in the SLBLOCK. This value and the number of elements in the rgentries
        /// array MUST be non-zero. When this value transitions to zero, it is required for the block to be deleted.
        self.cEnt = try dataStream.read(endianess: .littleEndian)
        if self.cEnt == 0x00 {
            throw PstReadError.invalidCEnt(cEnt: self.cEnt)
        }
        
        /// dwPadding (4 bytes, Unicode only): Padding; MUST be set to zero.
        if isUnicode {
            self.dwPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding = nil
        }
        
        /// rgentries (variable size): Array of SLENTRY structures. The size is equal to the number of entries indicated by cEnt
        /// multiplied by the size of an SLENTRY (24 bytes for Unicode PST files, 12 bytes for ANSI PST Files).
        var rgentries = [SLENTRY]()
        rgentries.reserveCapacity(Int(self.cEnt))
        for _ in 0..<self.cEnt {
            let entry = try SLENTRY(dataStream: &dataStream, isUnicode: isUnicode)
            rgentries.append(entry)
        }
        
        self.rgentries = rgentries

        /*
        /// rgbPadding (optional, variable): This field is present if the total size of all of the other fields is not
        /// a multiple of 64. The size of this field is the smallest number of bytes required to make the size of
        /// the SLBLOCK a multiple of 64. Implementations MUST ignore this field.
        let totalSize = (dataStream.position - position) + (isUnicode ? 16 : 12)
        if (totalSize % 64) != 0 {
            let paddingSize =
            dataStream.position += paddingSize
        }
        
        /// blockTrailer (ANSI: 12 bytes; Unicode: 16 bytes): A BLOCKTRAILER structure (section
        /// 2.2.2.8.1).
        self.blockTrailer = try BLOCKTRAILER(dataStream: &dataStream, isUnicode: isUnicode)
         */
    }

    public var debugDescription: String {
        var s = "SLBLOCK\n"
        s += "- btype: \(btype.hexString)\n"
        s += "- cLevel: \(cLevel.hexString)\n"
        s += "- cEnt: \(cEnt.hexString)\n"
        if isUnicode {
            s += "- dwPadding: \(dwPadding!.hexString)\n"
        }
        for entry in rgentries.enumerated() {
            s += " - rgentries[\(entry.offset)] \(entry.element)"
        }        
        //s += "- blockTrailer: \(blockTrailer)"
        return s
    }
}
