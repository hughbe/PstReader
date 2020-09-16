//
//  ROOT.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.5 ROOT
/// The ROOT structure contains current file state.
internal struct ROOT: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let dwReserved: UInt32
    public let ibFileEof: IB
    public let ibAMapLast: IB
    public let cbAMapFree: UInt64
    public let cbPMapFree: UInt64
    public let BREFNBT: BREF
    public let BREFBBT: BREF
    public let fAMapValid: FAMapValid
    public let bReserved: UInt8
    public let wReserved: UInt16

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// dwReserved (4 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<5>
        self.dwReserved = try dataStream.read(endianess: .littleEndian)

        /// ibFileEof (Unicode: 8 bytes; ANSI 4 bytes): The size of the PST file, in bytes.
        self.ibFileEof = try IB(dataStream: &dataStream, isUnicode: isUnicode)

        /// ibAMapLast (Unicode: 8 bytes; ANSI 4 bytes): An IB structure (section 2.2.2.3) that contains the
        /// absolute file offset to the last AMap page of the PST file.
        self.ibAMapLast = try IB(dataStream: &dataStream, isUnicode: isUnicode)

        /// cbAMapFree (Unicode: 8 bytes; ANSI 4 bytes): The total free space in all AMaps, combined.
        if isUnicode {
            self.cbAMapFree = try dataStream.read(endianess: .littleEndian)
        } else {
            self.cbAMapFree = UInt64(try dataStream.read(endianess: .littleEndian) as UInt32)
        }

        /// cbPMapFree (Unicode: 8 bytes; ANSI 4 bytes): The total free space in all PMaps, combined.
        /// Because the PMap is deprecated, this value SHOULD be zero. Creators of new PST files MUST
        /// initialize this value to zero.
        if isUnicode {
            self.cbPMapFree = try dataStream.read(endianess: .littleEndian)
        } else {
            self.cbPMapFree = UInt64(try dataStream.read(endianess: .littleEndian) as UInt32)
        }

        /// BREFNBT (Unicode: 16 bytes; ANSI: 8 bytes): A BREF structure (section 2.2.2.4) that references
        /// the root page of the Node BTree (NBT).
        self.BREFNBT = try BREF(dataStream: &dataStream, isUnicode: isUnicode)

        /// BREFBBT (Unicode: 16 bytes; ANSI: 8 bytes): A BREF structure that references the root page of
        /// the Block BTree (BBT).
        self.BREFBBT = try BREF(dataStream: &dataStream, isUnicode: isUnicode)

        /// fAMapValid (1 byte): Indicates whether all of the AMaps in this PST file are valid. For more details,
        /// see section 2.6.1.3.7. This value MUST be set to one of the pre-defined values specified in the
        /// following table.
        let fAMapValidRaw: UInt8 = try dataStream.read()
        guard let fAMapValid = FAMapValid(rawValue: fAMapValidRaw) else {
            throw PstReadError.invalidFAMapValid(fAMapValid: fAMapValidRaw)
        }

        self.fAMapValid = fAMapValid

        /// bReserved (1 byte): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<7>
        self.bReserved = try dataStream.read()

        /// wReserved (2 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<8>
        self.wReserved = try dataStream.read()
    }

    public var debugDescription: String {
        var s = "ROOT\n"
        s += "- dwReserved: \(dwReserved.hexString)\n"
        s += "- ibFileEof: \(ibFileEof)\n"
        s += "- ibAMapLast: \(ibAMapLast)\n"

        if isUnicode {
            s += "- cbAMapFree: \(cbAMapFree.hexString)\n"
        } else {
            s += "- cbAMapFree: \(UInt32(cbAMapFree).hexString)\n"
        }

        if isUnicode {
            s += "- cbPMapFree: \(cbPMapFree.hexString)\n"
        } else {
            s += "- cbPMapFree: \(UInt32(cbPMapFree).hexString)\n"
        }

        s += "- BREFNBT: \(BREFNBT)"
        s += "- BREFBBT: \(BREFBBT)"
        s += "- fAMapValid: \(fAMapValid)\n"
        s += "- bReserved: \(bReserved.hexString)\n"
        s += "- wReserved: \(wReserved.hexString)\n"

        return s
    }
}
