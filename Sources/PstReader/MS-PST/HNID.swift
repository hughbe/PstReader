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
    public let rawValue: UInt32
    public let hidType: NIDType
    public let hid: HID
    public let nid: NID
    
    public init(dataStream: inout DataStream) throws {
        self.init(rawValue: try dataStream.read(endianess: .littleEndian))
    }
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
        
        /// nidType (5 bits): Identifies the type of the node represented by the NID. The following table
        /// specifies a list of values for nidType. However, it is worth noting that nidType has no meaning to
        /// the structures defined in the NDB Layer.
        let rawHidType = rawValue & 0b11111
        guard let hidType = NIDType(rawValue: rawHidType) else {
            fatalError("Unknown type \(rawHidType)")
        }
        
        self.hidType = hidType
        
        self.hid = HID(rawValue: rawValue)
        self.nid = NID(rawValue: rawValue)
    }
}
