//
//  BTPAGE.swift
//
//
//  Created by Hugh Bellamy on 25/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 2.4.7.1 NAMEID
/// Each NAMEID record corresponds to a named property. The contents of the NAMEID record can be
/// interpreted in two ways, depending on the value of the N bit.
internal struct NAMEID: CustomDebugStringConvertible {
    public var dwPropertyID: UInt32
    public var wGuid: UInt16
    public var propertyKind: NamedProperty.Kind
    public var wPropIdx: UInt16
    
    public init(dataStream: inout DataStream) throws {
        /// dwPropertyID (4 bytes): If the N field is 1, this value is the byte offset into the String stream in which the string name of the
        /// property is stored. If the N field is 0, this value contains the value of numerical name.
        self.dwPropertyID = try dataStream.read(endianess: .littleEndian)
        
        /// N (1 bit): Named property identifier type. If this value is 1, the named property identifier is a string.
        /// If this value is 0, the named property identifier is a 16-bit numerical value.
        /// wGuid (15 bits): GUID index. If this value is 1 or 2, the named property's GUID is one of 2 wellknown GUIDs. If this value is greater than 2, this value is the index plus 3 into the GUID Stream
        /// where the GUID associated with this named property is located. The following table explains how
        /// the wGuid value works.
        /// wGuid Friendly name Description
        /// 0x0000 NAMEID_GUID_NONE No GUID (N=1).
        /// 0x0001 NAMEID_GUID_MAPI The GUID is PS_MAPI ([MS-OXPROPS] section
        /// 1.3.2).
        /// 0x0002 NAMEID_GUID_PUBLIC_STRINGS The GUID is PS_PUBLIC_STRINGS ([MSOXPROPS] section 1.3.2).
        /// 0x0003 N/A GUID is found at the (N-3) * 16 byte offset
        /// in the GUID Stream.
        let indexAndPropertyKindInformation = try dataStream.read(endianess: .littleEndian) as UInt16
        self.wGuid = (indexAndPropertyKindInformation >> 1) & 0b111111111111111

        let propertyType = indexAndPropertyKindInformation & 0b1
        self.propertyKind = propertyType == 1 ? .stringNamed : .numericalNamed

        /// wPropIdx (2 bytes): Property index. This is the ordinal number of the named property, which is
        /// used to calculate the NPID of this named property. The NPID of this named property is calculated by
        /// adding 0x8000 to wPropIndex.
        self.wPropIdx = try dataStream.read(endianess: .littleEndian)
    }

    public var debugDescription: String {
        var s = "NAMEID\n"
        s += "- dwPropertyID: \(dwPropertyID.hexString)\n"
        return s
    }
}
