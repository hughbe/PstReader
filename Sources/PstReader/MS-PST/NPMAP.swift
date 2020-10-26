//
//  NPMAP.swift
//  
//
//  Created by Hugh Bellamy on 29/09/2020.
//

import DataStream
import Foundation
import MAPI

/// [MS-PST] 2.4.7 Named Property Lookup Map
/// The mapping between NPIDs and property names is done using a special Name-to-ID-Map in the PST,
/// with a special NID of NID_NAME_TO_ID_MAP (0x61). There is one Name-to-ID-Map per PST. From an
/// implementation point of view, the Name-to-ID-Map is a standard PC with some special properties.
/// Specifically, the properties in the PC do not refer to real property identifiers, but instead point to
/// specific data sections of the Name-to-ID-Map.
/// A named property is identified by a (GUID, identifier) value pair, otherwise known as the property
/// name. The identifier can be a string or a 16-bit numerical value. The GUID value identifies the
/// property set to which the property name is associated. Well-known property names and a list of
/// property set GUIDs are specified in [MS-OXPROPS].
/// The Name-to-ID-Map (NPMAP) consists of several components: an Entry Stream, a GUID Stream, a
/// String Stream, and a hash table to expedite searching. The following are the data structures used for
/// the NPMAP.
internal struct NPMAP {
    public private(set) var dictionary: [NamedProperty: UInt16]
    public private(set) var properties: [UInt16: NamedProperty]
    
    public init(ndb: NDB) throws {
        let propertyContext = try LTP.PropertyContext(ndb: ndb, nid: NID.SpecialInternal.nameToIdMap)

        /// [MS-PST] 2.4.7.2 GUID Stream
        /// The GUID Stream is a flat array of 16-byte GUID values that contains the GUIDs associated with all the property sets used in all the named properties in the PST.
        /// The Entry Stream is stored as a single property in the PC with the property tag PidTagNameidStreamGuid.
        /// For each NAMEID record, the wGuid field is used to locate the GUID that is associated with the named property. Because each GUID represents a property set
        /// that can contain many related properties, it is therefore quite common to have multiple NAMEID records referring to the same GUID.
        guard let guidStream = try propertyContext.properties.getProperty(id: PstPropertyId.tagNameidStreamGuid.rawValue) as? Data else {
            throw PstReadError.missingProperty(property: .tagNameidStreamGuid)
        }
        
        var guidDataStream = DataStream(data: guidStream)
        func getGuid(index: Int) throws -> UUID {
            let position = index * MemoryLayout<UUID>.size
            if position >= guidDataStream.count {
                throw MAPIError.corrupted
            }

            guidDataStream.position = position
            return try guidDataStream.readGUID(endianess: .littleEndian)
        }

        /// [MS-PST] 2.4.7.3 Entry Stream
        /// The Entry Stream is a flat array of NAMEID records that represent all the named properties in the PST. The Entry Stream is stored as a single property in the PC
        /// with the property tag PidTagNameidStreamEntry.
        guard let entryStream = try propertyContext.properties.getProperty(id: PstPropertyId.tagNameidStreamEntry.rawValue) as? Data else {
            throw PstReadError.missingProperty(property: .tagNameidStreamEntry)
        }
    
        /// [MS-PST] 2.4.7.4 The String Stream
        /// The String Stream is a packed list of strings that is used for all the named properties in the PST. The String Stream is stored as a single property in the PC
        /// with the property tag PidTagNameidStreamString.
        /// Note: although technically this is required, it is missing from older pst files that don't have any string named properties
        let stringDataStream: DataStream?
        if let stringStream = try propertyContext.properties.getProperty(id: PstPropertyId.tagNameidStreamString.rawValue) as? Data {
            stringDataStream = DataStream(data: stringStream)
        } else {
            stringDataStream = nil
        }
        
        var entryDataStream = DataStream(data: entryStream)
        let entriesCount = entryDataStream.count / 8

        var dictionary = [NamedProperty: UInt16]()
        dictionary.reserveCapacity(entriesCount)
        var properties = [UInt16: NamedProperty]()
        properties.reserveCapacity(entriesCount)
        for _ in 0..<entriesCount {
            let nameid = try NAMEID(dataStream: &entryDataStream)
    
            let guid: UUID
            switch nameid.wGuid {
            case 0:
                /// 0x0000 NAMEID_GUID_NONE No GUID (N=1).
                guid = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
            case 1:
                /// 0x0001 NAMEID_GUID_MAPI The GUID is PS_MAPI ([MS-OXPROPS] section 1.3.2).
                guid = CommonlyUsedPropertySet.PS_MAPI
            case 2:
                /// 0x0002 NAMEID_GUID_PUBLIC_STRINGS The GUID is PS_PUBLIC_STRINGS ([MSOXPROPS] section 1.3.2).
                guid = CommonlyUsedPropertySet.PS_PUBLIC_STRINGS
            default:
                /// 0x0003 N/A GUID is found at the (N-3) * 16 byte offset in the GUID Stream.
                guid = try getGuid(index: Int(nameid.wGuid - 3))
            }

            let property: NamedProperty
            switch nameid.propertyKind {
            case .stringNamed:
                guard var stringDataStream = stringDataStream else {
                    throw PstReadError.missingProperty(property: .tagNameidStreamString)
                }

                stringDataStream.position = Int(nameid.dwPropertyID)
                
                /// Name Length (4 bytes): The length of the following Name field in bytes.
                let nameLengthInBytes = try stringDataStream.read(endianess: .littleEndian) as UInt32
                
                /// Name (variable): A Unicode string that is the name of the property. A new entry MUST always start
                /// on a 4 byte boundary; therefore, if the size of the Name field is not an exact multiple of 4, and
                /// another Name field entry occurs after it, null characters MUST be appended to the stream after it
                /// until the 4-byte boundary is reached. The Name Length field for the next entry will then start at
                /// the beginning of the next 4-byte boundary.
                guard let name = try stringDataStream.readString(count: Int(nameLengthInBytes), encoding: .utf16LittleEndian) else {
                    continue
                }

                property = NamedProperty(guid: guid, name: name)
            case .numericalNamed:
                property = NamedProperty(guid: guid, lid: nameid.dwPropertyID)
            }

            dictionary[property] = nameid.wPropIdx
            properties[nameid.wPropIdx] = property
        }
        
        self.dictionary = dictionary
        self.properties = properties
    }
}
