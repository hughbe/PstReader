//
//  IB.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.3 IB (Byte Index)
/// The IB (Byte Index) is used to represent an absolute offset within the PST file with respect to the
/// beginning of the file. The IB is a simple unsigned integer value and is 64 bits in Unicode versions and
/// 32 bits in ANSI versions.
internal struct IB: CustomStringConvertible {
    public let type: PstFileType
    public var rawValue: UInt64
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        self.type = type

        if type.isUnicode {
            self.rawValue = try dataStream.read(endianess: .littleEndian)
        } else {
            self.rawValue = UInt64(try dataStream.read(endianess: .littleEndian) as UInt32)
        }
    }
    
    public var description: String {
        if type.isUnicode {
            return rawValue.hexString
        } else {
            return UInt32(rawValue).hexString
        }
    }
}
