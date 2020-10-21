//
//  BLOCKTRAILER.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.8 Blocks
/// Blocks are the fundamental units of data storage at the NDB layer. Blocks are assigned in sizes that
/// are multiples of 64 bytes and are aligned on 64-byte boundaries. The maximum size of any block is 8
/// kilobytes (8192 bytes).
/// Similar to pages, each block stores its metadata in a block trailer placed at the very end of the block
/// so that the end of the trailer is aligned with the end of the block.
/// Blocks generally fall into one of two categories: data blocks and subnode blocks. Data blocks are used
/// to store raw data, where subnode blocks are used to represent nodes contained within a node.
/// The storage capacity of each data block is the size of the data block (from 64 to 8192 bytes) minus
/// the size of the trailer block.
/// [MS-PST] 2.2.2.8.1 BLOCKTRAILER
internal struct BLOCKTRAILER: CustomDebugStringConvertible {
    private let type: PstFileType
    public let bb: UInt16
    public let wSig: UInt16
    public let dwCRC: UInt32
    public let bid: BID
    public let unknown1: UInt16?
    public let cbInflated: UInt16?
    public let unknown2: UInt32?

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        /// bb (2 bytes): The amount of data, in bytes, contained within the data section of the block. This value
        /// does not include the block trailer or any
        self.bb = try dataStream.read(endianess: .littleEndian)
        
        /// wSig (2 bytes): Block signature. See section 5.5 for the algorithm to calculate the block signature.
        self.wSig = try dataStream.read(endianess: .littleEndian)
        
        /// dwCRC (4 bytes): 32-bit CRC of the cb bytes of raw data, see section 5.3 for the algorithm to
        /// calculate the CRC. Note the locations of the dwCRC and bid are differs between the Unicode and
        /// ANSI version of this structure.
        self.dwCRC = try dataStream.read(endianess: .littleEndian)

        /// bid (Unicode: 8 bytes; ANSI 4 bytes): The BID (section 2.2.2.2) of the data block.
        self.bid = try BID(dataStream: &dataStream, type: type)
        
        if type == .unicode4K {
            self.unknown1 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.unknown1 = nil
        }
        
        if type == .unicode4K {
            self.cbInflated = try dataStream.read(endianess: .littleEndian)
        } else {
            self.cbInflated = nil
        }
        
        if type == .unicode4K {
            self.unknown2 = try dataStream.read(endianess: .littleEndian)
        } else {
            self.unknown2 = nil
        }
    }

    public var debugDescription: String {
        var s = "BLOCKTRAILER\n"
        s += "- bb: \(bb.hexString)\n"
        s += "- wSig: \(wSig.hexString)\n"
        s += "- dwCRC: \(dwCRC.hexString)\n"
        s += "- wSig: \(wSig.hexString)\n"
        if type == .unicode4K {
            s += "- unknown1: \(unknown1!.hexString)\n"
        }
        if type == .unicode4K {
            s += "- cbInflated: \(cbInflated!.hexString)\n"
        }
        if type == .unicode4K {
            s += "- unknown2: \(unknown2!.hexString)\n"
        }
        return s
    }
}
