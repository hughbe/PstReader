//
//  BREF.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.4 BREF
/// The BREF is a record that maps a BID to its absolute file offset location.
internal struct BREF: CustomDebugStringConvertible {
    public let type: PstFileType
    public let bid: BID
    public let ib: IB

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        /// bid (Unicode: 64 bits; ANSI: 32 bits): A BID structure, as specified in section 2.2.2.2.
        self.bid = try BID(dataStream: &dataStream, type: type)

        /// ib (Unicode: 64 bits; ANSI: 32 bits): An IB structure, as specified in section 2.2.2.3.
        self.ib = try IB(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "BREF\n"
        s += "- bid: \(bid)\n"
        s += "- ib: \(ib)\n"
        return s
    }
}
