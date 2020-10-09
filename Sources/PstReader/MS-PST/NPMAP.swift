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
    
    public init(ndb: NDB) throws {
        let propertyContext = try LTP.readPropertyContext(ndb: ndb, nid: NID.SpecialInternal.nameToIdMap)

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
        guard let stringStream = try propertyContext.properties.getProperty(id: PstPropertyId.tagNameidStreamString.rawValue) as? Data else {
            throw PstReadError.missingProperty(property: .tagNameidStreamString)
        }
        
        var stringDataStream = DataStream(data: stringStream)
        var entryDataStream = DataStream(data: entryStream)
        let entriesCount = entryDataStream.count / 8
        
        
        var dictionary = [NamedProperty: UInt16]()
        dictionary.reserveCapacity(entriesCount)
        for _ in 0..<entriesCount {
            let nameid = try NAMEID(dataStream: &entryDataStream)
    
            let guid: UUID
            switch nameid.wGuid {
            case 1:
                /// Always use the PS_MAPI property set, as specified in [MS-OXPROPS] section 1.3.2. No GUID is stored in
                /// the GUID stream.
                guid = UUID(uuidString: "00020328-0000-0000-C000-000000000046")!
            case 2:
                /// Always use the PS_PUBLIC_STRINGS property set, as specified in [MS-OXPROPS] section 1.3.2. No
                /// GUID is stored in the GUID stream.
                guid = UUID(uuidString: "00020329-0000-0000-C000-000000000046")!
            default:
                /// Use Value minus 3 as the index of the GUID into the GUID stream. For example, if the GUID index is 5,
                /// the third GUID (5 minus 3, resulting in a zero-based index of 2) is used as the GUID for the name
                /// property being derived.
                let index = nameid.wGuid >= 3 ? nameid.wGuid - 3 : nameid.wGuid
                guid = try getGuid(index: Int(index))
            }

            switch nameid.propertyKind {
            case .stringNamed:
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

                let property = NamedProperty(guid: guid, name: name)
                dictionary[property] = nameid.wPropIdx
            case .numericalNamed:
                let property = NamedProperty(guid: guid, lid: nameid.dwPropertyID)
                dictionary[property] = nameid.wPropIdx
            }
        }
        
        self.dictionary = dictionary
    }
}
