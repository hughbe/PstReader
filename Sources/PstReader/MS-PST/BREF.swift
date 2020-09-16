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
    public let isUnicode: Bool
    public let bid: BID
    public let ib: IB

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// bid (Unicode: 64 bits; ANSI: 32 bits): A BID structure, as specified in section 2.2.2.2.
        self.bid = try BID(dataStream: &dataStream, isUnicode: isUnicode)

        /// ib (Unicode: 64 bits; ANSI: 32 bits): An IB structure, as specified in section 2.2.2.3.
        self.ib = try IB(dataStream: &dataStream, isUnicode: isUnicode)
    }

    public var debugDescription: String {
        var s = "BREF\n"
        s += "- bid: \(bid)\n"
        s += "- ib: \(ib)\n"
        return s
    }
}
