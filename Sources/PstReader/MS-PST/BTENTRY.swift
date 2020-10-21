//
//  BTENTRY.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.7.7.2 BTENTRY (Intermediate Entries)
/// BTENTRY records contain a key value (NID or BID) and a reference to a child BTPAGE page in the
/// BTree.
internal struct BTENTRY: CustomDebugStringConvertible {
    public let type: PstFileType
    public let btkey: UInt64
    public let BREF: BREF

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        /// btkey (Unicode: 8 bytes; ANSI: 4 bytes): The key value associated with this BTENTRY. All the
        /// entries in the child BTPAGE referenced by BREF have key values greater than or equal to this key
        /// value. The btkey is either an NID (zero extended to 8 bytes for Unicode PSTs) or a BID,
        /// depending on the ptype of the page.
        if type.isUnicode {
            self.btkey = try dataStream.read(endianess: .littleEndian)
        } else {
            self.btkey = UInt64(try dataStream.read(endianess: .littleEndian) as UInt32)
        }

        /// BREF (Unicode: 16 bytes; ANSI: 8 bytes): BREF structure (section 2.2.2.4) that points to the child
        /// BTPAGE.
        self.BREF = try PstReader.BREF(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "BTENTRY\n"
        if type.isUnicode {
            s += "- btkey: \(btkey.hexString)\n"
        } else {
            s += "- btkey: \(UInt32(btkey).hexString)\n"
        }

        s += "- BREF: \(BREF)\n"
        return s
    }
}
