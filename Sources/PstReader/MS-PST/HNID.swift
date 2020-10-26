//
//  NID.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 2.3.3 Property Context (PC)
/// The Property Context is built directly on top of a BTH. The existence of a PC is indicated at the HN
/// level, where bClientSig is set to bTypePC. Implementation-wise, the PC is simply a BTH with cbKey
/// set to 2 and cbEnt set to 6 (see section 2.3.3.3). The following section explains the layout of a PC
/// BTH record.
/// Each property is stored as an entry in the BTH. Accessing a specific property is just a matter of
/// searching the BTH for a key that matches the property identifier of the desired property, as the
/// following data structure illustrates.
/// [MS-PST] 2.3.3.2 HNID
/// An HNID is a 32-bit hybrid value that represents either an HID or an NID. The determination is made
/// by examining the hidType (or equivalently, nidType) value. The HNID refers to an HID if the
/// hidType is NID_TYPE_HID. Otherwise, the HNID refers to an NID.
/// An HNID that refers to an HID indicates that the item is stored in the data block. An HNID that refers
/// to an NID indicates that the item is stored in the subnode block, and the NID is the local NID under
/// the subnode where the raw data is located.
internal struct HNID {
    private let type: PstFileType
    public let wValue1: UInt16
    public let wValue2: UInt16
    public var rawValue: UInt32 {
        return (UInt32(wValue2) << 16) | UInt32(wValue1)
    }
    public var hidType: NIDType {
        return NIDType(rawValue: wValue1 & 0x001F) ?? .unknown
    }
    public var hid: HID {
        return try! HID(wValue1: wValue1, wValue2: wValue2, type: type)
    }
    public var nid: NID {
        return NID(rawValue: (UInt32(wValue2) << 16) | UInt32(wValue1))
    }
    
    public init(dataStream: inout DataStream, type: PstFileType) throws {
        let wValue1: UInt16 = try dataStream.read(endianess: .littleEndian)
        let wValue2: UInt16 = try dataStream.read(endianess: .littleEndian)
        self.init(wValue1: wValue1, wValue2: wValue2, type: type)
    }
    
    public init(wValue1: UInt16, wValue2: UInt16, type: PstFileType) {
        self.wValue1 = wValue1
        self.wValue2 = wValue2
        self.type = type
    }
}
