//
//  IntermediateBTH.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.3.2 BTree-on-Heap (BTH)
/// A BTree-on-Heap implements a classic BTree on a heap node. A BTH consists of several parts: A
/// header, the BTree records, and optional BTree data. The following diagram shows a high-level
/// schematic of a BTH.
/// The preceding diagram shows a BTH with two levels of indices. The top-level index (Key, HID) value
/// pairs actually point to heap items that contain the Level 1 Indices, which, in turn, point to heap items
/// that contain the leaf (Key, data) value pairs. Each of the six boxes in the diagram actually represents
/// six separate items allocated out of the same HN, as indicated by their associated HIDs.
/// [MS-PST] 2.3.2.2 Intermediate BTH (Index) Records
/// Index records do not contain actual data, but point to other index records or leaf records. The format
/// of the intermediate index record is as follows. The number of index records can be determined based
/// on the size of the heap allocation.
internal struct IntermediateBTH<T>: CustomDebugStringConvertible, BTH where T: FixedWidthInteger {
    public static var size: UInt16 {
        return UInt16(MemoryLayout<T>.size + 4)
    }

    public let key: T
    public let hidNextLevel: HID

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// key (variable): This is the key of the first record in the next level index record array. The size of the
        /// key is specified in the cbKey field in the corresponding BTHHEADER structure (section 2.3.2.1).
        /// The size and contents of the key are specific to the higher level structure that implements this
        /// BTH.
        self.key = try dataStream.read(endianess: .littleEndian)
        
        /// hidNextLevel (4 bytes): HID of the next level index record array. This contains the HID of the heap
        /// item that contains the next level index record array.
        self.hidNextLevel = try HID(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "IntermediateBTH\n"
        s += "- key: \(key.hexString)\n"
        s += "- hidNextLevel: \(hidNextLevel)\n"
        return s
    }
}
