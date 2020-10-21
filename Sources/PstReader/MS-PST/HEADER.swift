//
//  HEADER.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 2.2.2.6 HEADER
/// The HEADER structure is located at the beginning of the PST file (absolute file offset 0), and contains
/// metadata about the PST file, as well as the ROOT information to access the NDB Layer data
/// structures. Note that the layout of the HEADER structure, including the location and relative ordering
/// of some fields, differs between the Unicode and ANSI versions.
internal struct HEADER: CustomDebugStringConvertible {
    public let type: PstFileType

    public let dwMagic: UInt32
    public let dwCRCPartial: UInt32
    public let wMagicClient: UInt16
    public let wVer: UInt16
    public let wVerClient: UInt16
    public let bPlatformCreate: UInt8
    public let bPlatformAccess: UInt8
    public let dwReserved1: UInt32
    public let dwReserved2: UInt32
    public let bidUnused: BID?
    public let bidNextB: BID
    public let bidNextP: BID
    public let dwUnique: UInt32
    public let rgnid: [NID]
    public let qwUnused: UInt64?
    public let root: ROOT
    public let dwAlign: UInt32?
    public let rgbFM: [UInt8]
    public let rgbFP: [UInt8]
    public let bSentinel: UInt8
    public let bCryptMethod: CryptMethod
    public let rgbReserved: UInt16
    public let dwCRCFull: UInt32?
    public let ullReserved: UInt64?
    public let dwReserved: UInt32?
    public let rgbReserved2: (UInt8, UInt8, UInt8)
    public let bReserved: UInt8
    public let rgbReserved3: [UInt8]

    public init(dataStream: inout DataStream) throws {
        /// dwMagic (4 bytes): MUST be "{ 0x21, 0x42, 0x44, 0x4E } ("!BDN")".
        let dwMagic: UInt32 = try dataStream.read(endianess: .littleEndian)
        if dwMagic != 0x4E444221 {
            throw PstReadError.invalidDwMagic(dwMagic: dwMagic)
        }

        self.dwMagic = dwMagic

        /// dwCRCPartial (4 bytes): The 32-bit cyclic redundancy check (CRC) value of the 471 bytes of
        /// data starting from wMagicClient (0ffset 0x0008)
        self.dwCRCPartial = try dataStream.read(endianess: .littleEndian)

        /// wMagicClient (2 bytes): MUST be "{ 0x53, 0x4D }".
        let wMagicClient: UInt16 = try dataStream.read(endianess: .littleEndian)
        if wMagicClient != 0x4D53 && wMagicClient != 0x4F53 {
            throw PstReadError.invalidWMagicClient(wMagicClient: wMagicClient)
        }

        self.wMagicClient = wMagicClient

        /// wVer (2 bytes): File format version. This value MUST be 14 or 15 if the file is an ANSI PST file, and
        /// MUST be greater than 23 if the file is a Unicode PST file. If the value is 37, it indicates that the file
        /// is written by an Outlook of version that supports Windows Information Protection (WIP). The data
        /// MAY have been protected by WIP.
        self.wVer = try dataStream.read(endianess: .littleEndian)
        switch self.wVer {
        case 14, 15:
            self.type = .ansi
        case 36:
            self.type = .unicode4K
        case let wVer where wVer >= 23:
            self.type = .unicode
        default:
            throw PstReadError.invalidWVer(wVer: wVer)
        }

        /// wVerClient (2 bytes): Client file format version. The version that corresponds to the format
        /// described in this document is 19. Creators of a new PST file based on this document SHOULD
        /// initialize this value to 19.
        self.wVerClient = try dataStream.read(endianess: .littleEndian)

        /// bPlatformCreate (1 byte): This value MUST be set to 0x01.
        let bPlatformCreate: UInt8 = try dataStream.read()
        if bPlatformCreate != 0x01 {
            throw PstReadError.invalidBPlatformCreate(bPlatformCreate: bPlatformCreate)
        }

        self.bPlatformCreate = bPlatformCreate

        /// bPlatformAccess (1 byte): This value MUST be set to 0x01.
        let bPlatformAccess: UInt8 = try dataStream.read()
        if bPlatformAccess != 0x01 {
            throw PstReadError.invalidBPlatformAccess(bPlatformAccess: bPlatformAccess)
        }

        self.bPlatformAccess = bPlatformAccess

        /// dwReserved1 (4 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<9>
        self.dwReserved1 = try dataStream.read(endianess: .littleEndian)

        /// dwReserved2 (4 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<10>
        self.dwReserved2 = try dataStream.read(endianess: .littleEndian)

        /// bidUnused (8 bytes Unicode only): Unused padding added when the Unicode PST file format was
        /// created.
        if type.isUnicode {
            self.bidUnused = try BID(dataStream: &dataStream, type: type)
        } else {
            self.bidUnused = nil
        }

        /// bidNextB (4 bytes ANSI only): Next BID. This value is the monotonic counter that indicates the BID
        /// to be assigned for the next allocated block. BID values advance in increments of 4. For more
        /// details, see section 2.2.2.2.
        var bidNextB: BID?
        if !type.isUnicode {
            bidNextB = try BID(dataStream: &dataStream, type: type)
        }

        /// bidNextP (Unicode: 8 bytes; ANSI: 4 bytes): Next page BID. Pages have a special counter for
        /// allocating bidIndex values. The value of bidIndex for BIDs for pages is allocated from this
        /// counter.
        self.bidNextP = try BID(dataStream: &dataStream, type: type)

        /// dwUnique (4 bytes): This is a monotonically-increasing value that is modified every time the PST
        /// file's HEADER structure is modified. The function of this value is to provide a unique value, and to
        /// ensure that the HEADER CRCs are different after each header modification.
        self.dwUnique = try dataStream.read(endianess: .littleEndian)

        /// rgnid[] (128 bytes): A fixed array of 32 NIDs, each corresponding to one of the 32 possible NID_TYPEs (section 2.2.2.1).
        /// Different NID_TYPEs can have different starting nidIndex values. When a blank PST file is created, these values are initialized by NID_TYPE
        /// according to the following table. Each of these NIDs indicates the last nidIndex value that had been allocated for the corresponding NID_TYPE.
        /// When an NID of a particular type is assigned, the corresponding slot n rgnid is also incremented by 1.
        /// NID_TYPE Starting nidIndex
        /// NID_TYPE_NORMAL_FOLDER 1024 (0x400)
        /// NID_TYPE_SEARCH_FOLDER 16384 (0x4000)
        /// NID_TYPE_NORMAL_MESSAGE 65536 (0x10000)
        /// NID_TYPE_ASSOC_MESSAGE 32768 (0x8000)
        /// Any other NID_TYPE 1024 (0x400)
        var rgnid: [NID] = []
        rgnid.reserveCapacity(32)
        for _ in 0..<32 {
            let nid = try NID(dataStream: &dataStream)
            rgnid.append(nid)
        }

        self.rgnid = rgnid

        /// qwUnused (8 bytes): Unused space; MUST be set to zero. Unicode PST file format only.
        if type.isUnicode {
            self.qwUnused = try dataStream.read(endianess: .littleEndian)
        } else {
            self.qwUnused = nil
        }

        /// root (Unicode: 72 bytes; ANSI: 40 bytes): A ROOT structure (section 2.2.2.5).
        self.root = try ROOT(dataStream: &dataStream, type: type)

        /// dwAlign (4 bytes): Unused alignment bytes; MUST be set to zero. Unicode PST file format only.
        if type.isUnicode {
            self.dwAlign = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwAlign = nil
        }

        /// rgbFM (128 bytes): Deprecated FMap. This is no longer used and MUST be filled with 0xFF. Readers
        /// SHOULD ignore the value of these bytes.
        self.rgbFM = try dataStream.readBytes(count: 128)

        /// rgbFP (128 bytes): Deprecated FPMap. This is no longer used and MUST be filled with 0xFF. Readers
        /// SHOULD ignore the value of these bytes.
        self.rgbFP = try dataStream.readBytes(count: 128)

        /// bSentinel (1 byte): MUST be set to 0x80.
        self.bSentinel = try dataStream.read()
        if bSentinel != 0x80 {
            throw PstReadError.invalidBSentinel(bSentinel: bSentinel)
        }

        /// bCryptMethod (1 byte): Indicates how the data within the PST file is encoded. MUST be set to one
        /// of the pre-defined values described in the following table.
        let bCryptMethodRaw: UInt8 = try dataStream.read()
        guard let bCryptMethod = CryptMethod(rawValue: bCryptMethodRaw) else {
            throw PstReadError.invalidBCryptMethod(bCryptMethod: bCryptMethodRaw)
        }

        self.bCryptMethod = bCryptMethod

        /// rgbReserved (2 bytes): Reserved; MUST be set to zero.
        self.rgbReserved = try dataStream.read(endianess: .littleEndian)
        if rgbReserved != 0x0000 {
            throw PstReadError.invalidRgbReserved(rgbReserved: rgbReserved)
        }

        /// bidNextB (Unicode ONLY: 8 bytes): Next BID. This value is the monotonic counter that indicates
        /// the BID to be assigned for the next allocated block. BID values advance in increments of 4. For
        /// more details, see section 2.2.2.2.
        if type.isUnicode {
            bidNextB = try BID(dataStream: &dataStream, type: type)
        }

        self.bidNextB = bidNextB!

        /// dwCRCFull (4 bytes): The 32-bit CRC value of the 516 bytes of data starting from wMagicClient to
        /// bidNextB, inclusive. Unicode PST file format only.
        if type.isUnicode {
            self.dwCRCFull = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwCRCFull = nil
        }

        /// ullReserved (8 bytes): Reserved; MUST be set to zero. ANSI PST file format only.
        if type.isUnicode {
            self.ullReserved = nil
        } else {
            self.ullReserved = try dataStream.read(endianess: .littleEndian)
        }

        /// dwReserved (4 bytes): Reserved; MUST be set to zero. ANSI PST file format only.
        if type.isUnicode {
            self.dwReserved = nil
        } else {
            self.dwReserved = try dataStream.read(endianess: .littleEndian)
        }

        /// rgbReserved2 (3 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST MUST initialize this value to zero.<11>
        self.rgbReserved2 = (try dataStream.read(), try dataStream.read(), try dataStream.read())

        /// bReserved (1 byte): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST file MUST initialize this value to zero.<12>
        self.bReserved = try dataStream.read()

        /// rgbReserved3 (32 bytes): Implementations SHOULD ignore this value and SHOULD NOT modify it.
        /// Creators of a new PST MUST initialize this value to zero.<13>
        self.rgbReserved3 = try dataStream.readBytes(count: 32)
    }

    public var debugDescription: String {
        var s = "HEADER\n"
        s += "- dwMagic: \(dwMagic.hexString)\n"
        s += "- dwCRCPartial: \(dwCRCPartial.hexString)\n"
        s += "- wMagicClient: \(wMagicClient.hexString)\n"
        s += "- wVer: \(wVer.hexString)\n"
        s += "- wVerClient: \(wVerClient.hexString)\n"
        s += "- bPlatformCreate: \(bPlatformCreate.hexString)\n"
        s += "- bPlatformAccess: \(bPlatformAccess.hexString)\n"
        s += "- dwReserved1: \(dwReserved1.hexString)\n"
        s += "- dwReserved2: \(dwReserved2.hexString)\n"

        if type.isUnicode {
            s += "- bidUnused: \(bidUnused!)\n"
        }

        if !type.isUnicode {
            s += "- bidNextB: \(bidNextB)\n"
        }

        s += "- bidNextP: \(bidNextP)\n"

        s += "- dwUnique: \(dwUnique.hexString)\n"

        for kvp in rgnid.enumerated() {
            s += "- rgnid[\(kvp.offset)] \(kvp.element)\n"
        }

        if type.isUnicode {
            s += "- bidUnused: \(qwUnused!.hexString)\n"
        }

        s += "\(root)"

        if type.isUnicode {
            s += "- dwAlign: \(dwAlign!.hexString)\n"
        }

        s += "- rgbFM: \(rgbFM.hexString)\n"
        s += "- rgbFP: \(rgbFP.hexString)\n"
        s += "- bSentinel: \(bSentinel.hexString)\n"
        s += "- bCryptMethod: \(bCryptMethod)\n"
        s += "- rgbReserved: \(rgbReserved.hexString)\n"

        if type.isUnicode {
            s += "- bidNextB: \(bidNextB)\n"
        }

        if type.isUnicode {
            s += "- dwCRCFull: \(dwCRCFull!.hexString)\n"
        }

        if !type.isUnicode {
            s += "- ullReserved: \(ullReserved!.hexString)\n"
        }

        if !type.isUnicode {
            s += "- dwReserved: \(dwReserved!.hexString)\n"
        }

        s += "- rgbReserved2: \(rgbReserved2.0.hexString), \(rgbReserved2.1.hexString), \(rgbReserved2.2.hexString)\n"
        s += "- bReserved: \(bReserved.hexString)\n"
        s += "- rgbReserved3: \(rgbReserved3.hexString)\n"

        return s
    }
}
