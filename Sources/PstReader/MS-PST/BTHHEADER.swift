//
//  BTHHEADER.swift
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
/// [MS-PST] 2.3.2.1 BTHHEADER
/// The BTHHEADER contains the BTH metadata, which instructs the reader how to access the other
/// objects of the BTH structure.
internal struct BTHHEADER: CustomDebugStringConvertible {
    public let bType: ClientSignature
    public let cbKey: UInt8
    public let cbEnt: UInt8
    public let bIdxLevels: UInt8
    public let hidRoot: HID

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// bType (1 byte): MUST be bTypeBTH.
        let bTypeRaw: UInt8 = try dataStream.read()
        guard let bType = ClientSignature(rawValue: bTypeRaw), bType == .bth else {
            throw PstReadError.invalidBtype(btype: bTypeRaw)
        }
        
        self.bType = bType
        
        // cbKey (1 byte): Size of the BTree Key value, in bytes. This value MUST be set to 2, 4, 8, or 16.
        let cbKey: UInt8 = try dataStream.read()
        if cbKey != 2 && cbKey != 4 && cbKey != 8 && cbKey != 16 {
            throw PstReadError.invalidCbKey(cbKey: cbKey)
        }
        
        self.cbKey = cbKey
        
        /// cbEnt (1 byte): Size of the data value, in bytes. This MUST be greater than zero and less than or
        /// equal to 32.
        let cbEnt: UInt8 = try dataStream.read()
        if cbEnt == 0 || cbEnt > 32 {
            throw PstReadError.invalidCbEnt(cbEnt: cbEnt)
        }
        
        self.cbEnt = cbEnt
        
        /// bIdxLevels (1 byte): Index depth. This number indicates how many levels of intermediate indices
        /// exist in the BTH. Note that this number is zero-based, meaning that a value of zero actually
        /// means that the BTH has one level of indices. If this value is greater than zero, then its value
        /// indicates how many intermediate index levels are present.
        self.bIdxLevels = try dataStream.read()
        
        /// hidRoot (4 bytes): This is the HID that points to the BTH entries for this BTHHEADER. The data
        /// consists of an array of BTH records. This value is set to zero if the BTH is empty.
        self.hidRoot = try HID(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "BTHHEADER\n"
        s += "- bType: \(bType)\n"
        s += "- cbKey: \(cbKey.hexString)\n"
        s += "- cbEnt: \(cbEnt.hexString)\n"
        s += "- bIdxLevels: \(bIdxLevels.hexString)\n"
        s += "- hidRoot: \(hidRoot)\n"
        return s
    }
}
