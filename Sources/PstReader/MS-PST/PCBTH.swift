//
//  PCBTH.swift
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
/// [MS-PST] 2.3.3.3 PC BTH Record
internal struct PCBTH: BTH, CustomDebugStringConvertible {
    public static let size: UInt16 = 8
    public let wPropId: UInt16
    public let wPropType: PropertyType
    public let dwValueHnid: HNID

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// wPropId (2 bytes): Property ID, as specified in [MS-OXCDATA] section 2.9. This is the upper 16
        /// bits of the property tag value. This is a manifestation of the BTH record (section 2.3.2.3) and
        /// constitutes the key of this record.
        self.wPropId = try dataStream.read(endianess: .littleEndian)
        
        /// wPropType (2 bytes): Property type. This is the lower 16 bits of the property tag value, which
        /// identifies the type of data that is associated with the property. The complete list of property type
        /// values and their data sizes are specified in [MS-OXCDATA] section 2.11.1.
        let wPropTypeRaw: UInt16 = try dataStream.read(endianess: .littleEndian)
        if let wPropTypeRaw = PropertyType(rawValue: wPropTypeRaw) {
            self.wPropType = wPropTypeRaw
        } else {
            self.wPropType = .unknown
        }
        
        /// dwValueHnid (4 bytes): Depending on the data size of the property type indicated by wPropType
        /// and a few other factors, this field represents different values. The following table explains the
        /// value contained in dwValueHnid based on the different scenarios. In the event where the
        /// dwValueHnid value contains an HID or NID (section 2.3.3.2), the actual data is stored in the
        /// corresponding heap or subnode entry, respectively.
        /// Variable size?  | Fixed data size | NID_TYPE(dwValueHnid) == NID_TYPE_HID? | dwValueHnid
        /// ----------------------------------------------------------------------------------------
        /// N                                  | <= 4 bytes       | -                                      | Data Value
        ///                 | <4 bytes        | Y                                      | HID
        /// Y               | -               | Y                                      | HID (<= 3580 bytes)
        ///                 | -               | N                                      | NID (subnode, > 3580 bytes)
        self.dwValueHnid = try HNID(dataStream: &dataStream, type: type)
    }

    public var debugDescription: String {
        var s = "PCBTH\n"
        if let id = PropertyId(rawValue: wPropId) {
            s += "- wPropId: \(id)\n"
        } else {
            s += "- wPropId: \(wPropId.hexString)\n"
        }
        s += "- wPropType: \(wPropType)\n"
        s += "- dwValueHnid: \(dwValueHnid)"
        return s
    }
}
