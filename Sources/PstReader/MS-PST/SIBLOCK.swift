//
//  SIBLOCK.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.8.3.3 Subnode BTree
/// The subnode BTree collectively refers to all the elements that make up a subnode. The subnode BTree
/// is a BTree that is made up of SIBLOCK and SLBLOCK structures, which contain SIENTRY and SLENTRY
/// structures, respectively. These structures are defined in the following sections.
/// [MS-PST] 2.2.2.8.3.3.2 SIBLOCKs
/// An SIBLOCK is a block that contains an array of SIENTRYs. It is used to extend the number of
/// subnodes that a node can reference by chaining SLBLOCKS.
/// [MS-PST] 2.2.2.8.3.3.2.2 SIBLOCK
internal struct SIBLOCK: CustomDebugStringConvertible {
    public let type: PstFileType
    public let btype: UInt8
    public let cLevel: UInt8
    public let cEnt: UInt16
    public let dwPadding: UInt32?
    public let rgentries: [SIENTRY]
    //public let blockTrailer: BLOCKTRAILER
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        /// btype (1 byte): Block type; MUST be set to 0x02.
        self.btype = try dataStream.read()
        if btype != 0x02 {
            throw PstReadError.invalidBtype(btype: btype)
        }
        
        /// cLevel (1 byte): MUST be set to 0x01.
        self.cLevel = try dataStream.read()
        if cLevel != 0x01 {
            throw PstReadError.invalidCLevel(cLevel: cLevel)
        }
        
        /// cEnt (2 bytes): The number of SIENTRYs in the SIBLOCK.
        self.cEnt = try dataStream.read(endianess: .littleEndian)
        
        /// dwPadding (4 bytes, Unicode only): Padding; MUST be set to zero.
        if type.isUnicode {
            self.dwPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding = nil
        }
        
        /// rgentries (variable size): Array of SIENTRY structures. The size is equal to the number of entries
        /// indicated by cEnt multiplied by the size of an SIENTRY (16 bytes for Unicode PST files, 8 bytes for
        /// ANSI PST Files).
        var rgentries = [SIENTRY]()
        rgentries.reserveCapacity(Int(self.cEnt))
        for _ in 0..<self.cEnt {
            let entry = try SIENTRY(dataStream: &dataStream, type: type)
            rgentries.append(entry)
        }
        
        self.rgentries = rgentries
        
        /*
        /// rgbPadding (optional, variable): This field is present if the total size of all of the other fields is not
        /// a multiple of 64. The size of this field is the smallest number of bytes required to make the size of
        /// the SIBLOCK a multiple of 64. Implementations MUST ignore this field.
        let totalSize = (dataStream.position - position) + type.blockTrailerSize
        if (totalSize % 64) != 0 {
            let paddingSize = 64 - (totalSize % 64)
            dataStream.position += paddingSize
        }
        
        /// blockTrailer (ANSI: 12 bytes; Unicode: 16 bytes): A BLOCKTRAILER structure (section
        /// 2.2.2.8.1).
        self.blockTrailer = try BLOCKTRAILER(dataStream: &dataStream, type: type)
        */
    }

    public var debugDescription: String {
        var s = "SIBLOCK\n"
        s += "- btype: \(btype.hexString)\n"
        s += "- cLevel: \(cLevel.hexString)\n"
        s += "- cEnt: \(cEnt.hexString)\n"
        if type.isUnicode {
            s += "- dwPadding: \(dwPadding!.hexString)\n"
        }
        for entry in rgentries.enumerated() {
            s += " - rgentries[\(entry.offset)] \(entry.element)"
        }
        //s += "- blockTrailer: \(blockTrailer)"
        return s
    }
}
