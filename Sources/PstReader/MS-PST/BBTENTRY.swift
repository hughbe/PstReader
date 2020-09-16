//
//  BBTENTRY.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.7.7.3 BBTENTRY (Leaf BBT Entry)
/// BBTENTRY records contain information about blocks and are found in BTPAGES with cLevel equal to
/// 0, with the ptype of "ptypeBBT". These are the leaf entries of the BBT. As noted in section
/// 2.2.2.7.7.1, these structures might not be tightly packed and the cbEnt field of the BTPAGE SHOULD
/// be used to iterate over the entries.
internal struct BBTENTRY: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let BREF: BREF
    public let cb: UInt16
    public let cRef: UInt16
    public let dwPadding: UInt32?

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// BREF (Unicode: 16 bytes; ANSI: 8 bytes): BREF structure (section 2.2.2.4) that contains the BID
        /// and IB of the block that the BBTENTRY references.
        self.BREF = try PstReader.BREF(dataStream: &dataStream, isUnicode: isUnicode)
        
        /// cb (2 bytes): The count of bytes of the raw data contained in the block referenced by BREF
        /// excluding the block trailer and alignment padding, if any.
        self.cb = try dataStream.read(endianess: .littleEndian)
        
        /// cRef (2 bytes): Reference count indicating the count of references to this block. See section
        /// 2.2.2.7.7.3.1 regarding how reference counts work.
        self.cRef = try dataStream.read(endianess: .littleEndian)
        
        /// dwPadding (Unicode file format only, 4 bytes): Padding; MUST be set to zero.
        if isUnicode {
            self.dwPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding = nil
        }
    }

    public var debugDescription: String {
        var s = "BBTENTRY\n"
        s += "- BREF: \(BREF)\n"
        s += "- cb: \(cb.hexString)\n"
        s += "- cRef: \(cRef.hexString)\n"
        if isUnicode {
            s += "- dwPadding: \(dwPadding!.hexString)\n"
        }

        return s
    }
}
