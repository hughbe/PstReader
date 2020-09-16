//
//  BID.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.2 BID (Block ID)
/// Every block allocated in the PST file is identified using the BID structure. This structure varies in size
/// according the format of the file. In the case of ANSI files, the structure is a 32-bit unsigned value,
/// while in Unicode files it is a 64-bit unsigned long. In addition, there are two types of BIDs:
/// 1. BIDs used in the context of Pages (section 2.2.2.7) use all of the bits of the structure (below)
/// and are incremented by 1.
/// 2. Block BIDs (section 2.2.2.8) reserve the two least significant bits for flags (see below). As a
/// result these increment by 4 each time a new one is assigned.
/// Shown as used by Blocks (section 2.2.2.8):
internal struct BID: CustomDebugStringConvertible {
    public let rawValue: UInt64
    public let isUnicode: Bool
    public let reserved: Bool
    public let `internal`: Bool
    public let bidIndex: UInt64

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        if isUnicode {
            let rawValue: UInt64 = try dataStream.read(endianess: .littleEndian)
            self.rawValue = rawValue

            /// A - r (1 bit): Reserved bit. Readers MUST ignore this bit and treat it as zero before looking up the
            /// BID from the BBT. Writers MUST<4> set this bit to zero.
            self.reserved = ((rawValue >> 63) & 0b1) != 0
            
            /// B - i (1 bit): MUST set to 1 when the block is "Internal", or zero when the block is not "Internal". An
            /// internal block is an intermediate block that, instead of containing actual data, contains metadata
            /// about how to locate other data blocks that contain the desired information. For more details about
            /// technical details regarding blocks, see section 2.2.2.8.
            self.`internal` = ((rawValue >> 62) & 0b1) != 0
            
            /// bidIndex (Unicode: 62 bits; ANSI: 30 bits): A monotonically increasing value that uniquely
            /// identifies the BID within the PST file. bidIndex values are assigned based on the bidNextB value in
            /// the HEADER structure (see section 2.2.2.6). The bidIndex increments by one each time a new BID
            /// is assigned.
            self.bidIndex = (rawValue & 0b11111111111111111111111111111111111111111111111111111111111111).littleEndian
        } else {
            let rawValue: UInt32 = try dataStream.read(endianess: .littleEndian)
            self.rawValue = UInt64(rawValue)

            /// A - r (1 bit): Reserved bit. Readers MUST ignore this bit and treat it as zero before looking up the
            /// BID from the BBT. Writers MUST<4> set this bit to zero.
            self.reserved = ((rawValue >> 31) & 0b1) != 0
            
            /// B - i (1 bit): MUST set to 1 when the block is "Internal", or zero when the block is not "Internal". An
            /// internal block is an intermediate block that, instead of containing actual data, contains metadata
            /// about how to locate other data blocks that contain the desired information. For more details about
            /// technical details regarding blocks, see section 2.2.2.8.
            self.`internal` = ((rawValue >> 30) & 0b1) != 0
            
            /// bidIndex (Unicode: 62 bits; ANSI: 30 bits): A monotonically increasing value that uniquely
            /// identifies the BID within the PST file. bidIndex values are assigned based on the bidNextB value in
            /// the HEADER structure (see section 2.2.2.6). The bidIndex increments by one each time a new BID
            /// is assigned.
            self.bidIndex = UInt64(rawValue & 0b111111111111111111111111111111)
        }
    }
    
    public var debugDescription: String {
        return "bidIndex: \(bidIndex); internal: \(`internal`); reserved: \(reserved)"
    }
}
