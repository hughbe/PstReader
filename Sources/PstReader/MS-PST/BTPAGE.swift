//
//  BTPAGE.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.7.7.1 BTPAGE
/// A BTPAGE structure implements a generic BTree using 512-byte pages.
internal struct BTPAGE: CustomDebugStringConvertible {
    public var type: PstFileType
    public var rgentries: [UInt8]
    public var cEnt: UInt16
    public var cEntMax: UInt16
    public var cbEnt: UInt8
    public var cLevel: Int8
    public var dwPadding: UInt32?
    public var dwPadding2: UInt32?
    public var dwPadding3: UInt16?
    public var pageTrailer: PAGETRAILER
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        /// rgentries (Unicode: 488 bytes; ANSI: 496 bytes): Entries of the BTree array. The entries in the
        /// array depend on the value of the cLevel field. If cLevel is greater than 0, then each entry in the
        /// array is of type BTENTRY. If cLevel is 0, then each entry is either of type BBTENTRY or
        /// NBTENTRY, depending on the ptype of the page.
        switch type {
        case .ansi:
            self.rgentries = try dataStream.readBytes(count: 496)
        case .unicode:
            self.rgentries = try dataStream.readBytes(count: 488)
        case .unicode4K:
            self.rgentries = try dataStream.readBytes(count: 4056)
        }
        
        /// cEnt (1 byte): The number of BTree entries stored in the page data.
        switch type {
        case .ansi, .unicode:
            self.cEnt = UInt16(try dataStream.read() as UInt8)
        case .unicode4K:
            self.cEnt = try dataStream.read(endianess: .littleEndian)
        }
        
        /// cEntMax (1 byte): The maximum number of entries that can fit inside the page data.
        switch type {
        case .ansi, .unicode:
            self.cEntMax = UInt16(try dataStream.read() as UInt8)
        case .unicode4K:
            self.cEntMax = try dataStream.read(endianess: .littleEndian)
        }
        
        /// cbEnt (1 byte): The size of each BTree entry, in bytes. Note that in some cases, cbEnt can be
        /// greater than the corresponding size of the corresponding rgentries structure because of
        /// alignment or other considerations. Implementations MUST use the size specified in cbEnt to
        /// advance to the next entry.
        /// BTree Type | cLevel             | rgentries structure | cbEnt (bytes)
        /// NBT            | 0                     | NBTENTRY            | ANSI: 16, Unicode: 32
        ///         | Greater than 0 | BTENTRY               | ANSI: 12, Unicode: 24
        /// BBT            | 0                     | BBTENTRY            | ANSI: 12, Unicode: 24
        ///         | Less than 0      | BTENTRY               | ANSI: 12, Unicode: 24
        self.cbEnt = try dataStream.read()
        
        /// cLevel (1 byte): The depth level of this page. Leaf pages have a level of zero, whereas intermediate
        /// pages have a level greater than 0. This value determines the type of the entries in rgentries, and
        /// is interpreted as unsigned.
        self.cLevel = try dataStream.read()
        
        /// dwPadding (Unicode: 4 bytes): Padding; MUST be set to zero. Note there is no padding in the ANSI
        /// version of this structure.
        if type.isUnicode {
            self.dwPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding = nil
        }
        
        if type == .unicode4K {
            self.dwPadding2 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding2 = nil
        }
        
        if type == .unicode4K {
            self.dwPadding3 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding3 = nil
        }
        
        /// pageTrailer (Unicode: 16 bytes; ANSI: 12 bytes): A PAGETRAILER structure (section 2.2.2.7.1).
        /// The ptype subfield of pageTrailer MUST be set to ptypeBBT for a Block BTree page, or
        /// ptypeNBT for a Node BTree page. The other subfields of pageTrailer MUST be set as specified in
        /// section 2.2.2.7.1.
        self.pageTrailer = try PAGETRAILER(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "BTPAGE\n"
        s += "- rgentries: \(rgentries.hexString)\n"
        switch type {
        case .ansi, .unicode:
            s += "- cEnt: \(UInt8(cEnt).hexString)\n"
        case .unicode4K:
            s += "- cEnt: \(cEnt.hexString)\n"
        }
        switch type {
        case .ansi, .unicode:
            s += "- cEntMax: \(UInt8(cEntMax).hexString)\n"
        case .unicode4K:
            s += "- cEntMax: \(cEntMax.hexString)\n"
        }
        s += "- cbEnt: \(cbEnt.hexString)\n"
        s += "- cLevel: \(cLevel)\n"
        if type.isUnicode {
            s += "- dwPadding: \(dwPadding!.hexString)\n"
        }
        if type == .unicode4K {
            s += "- dwPadding2: \(dwPadding2!.hexString)\n"
            s += "- dwPadding3: \(dwPadding3!.hexString)\n"
        }
        s += "- pageTrailer: \(pageTrailer)\n"
        return s
    }
}
