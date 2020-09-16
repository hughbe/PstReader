//
//  NID.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.1 NID (Node ID)
/// Nodes provide the primary abstraction used to reference data stored in the PST file that is not
/// interpreted by the NDB layer. Each node is identified using its NID. Each NID is unique within the
/// namespace in which it is used. Each node referenced by the NBT MUST have a unique NID. However,
/// two subnodes of two different nodes can have identical NIDs, but two subnodes of the same node
/// MUST have different NIDs.
internal struct NID {
    public let rawValue: UInt32
    public let type: NIDType
    public let nidIndex: UInt32
    
    public init(dataStream: inout DataStream) throws {
        self.init(rawValue: try dataStream.read(endianess: .littleEndian))
    }
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
        
        /// nidType (5 bits): Identifies the type of the node represented by the NID. The following table
        /// specifies a list of values for nidType. However, it is worth noting that nidType has no meaning to
        /// the structures defined in the NDB Layer.
        let rawType = rawValue & 0b11111
        //let rawType = (rawValue >> 27) & 0b11111
        guard let type = NIDType(rawValue: rawType) else {
            fatalError("Unknown type \(rawType)")
        }
        
        self.type = type
        
        /// nidIndex (27 bits): The identification portion of the NID.
        self.nidIndex = rawValue >> 5
        //self.nidIndex = rawValue & 0b111111111111111111111111111
    }
    
    public init(type: NIDType, nid: NID) {
        self.init(rawValue: (nid.rawValue & 0xffffffe0) | type.rawValue)
    }
    
    /// [MS-PST] 2.4.1 Special Internal NIDs
    /// This section focuses on a special NID_TYPE: NID_TYPE_INTERNAL (0x01). As specified in section
    /// 2.2.2.1, the nidType of an NID is ignored by the NDB Layer, and is left for the interpretation by
    /// higher level implementations.
    /// In the Messaging layer, nodes with various nidType values are also used to build related structures
    /// that collectively represent complex structures (for example, a Folder object is a composite object
    /// that consists of a PC and three TCs of various nidType values). In addition, the Messaging layer also
    /// uses NID_TYPE_INTERNAL to define special NIDs that have special functions.
    /// Because top-level NIDs are globally-unique within a PST, it follows that each instance of a special NID
    /// can only appear once in a PST. The following table lists all predefined internal NIDs.
    public struct SpecialInternal {
        /// Message store node (section 2.4.3).
        public static let messageStore = NID(rawValue: 0x21)
        
        /// Properties Map (section 2.4.7).
        public static let nameToIdMap = NID(rawValue: 0x61)
        
        /// Special template node for an empty Folder object.
        public static let normalFolderTemplate = NID(rawValue: 0xA1)
        
        /// Special template node for an empty search Folder object.
        public static let searchFolderTemplate = NID(rawValue: 0xC1)
        
        /// Root Mailbox Folder object of PST.
        public static let rootFolder = NID(rawValue: 0x122)
        
        /// Queue of Pending Search-related updates.
        public static let searchManagementQueue = NID(rawValue: 0x1E1)
        
        /// Folder object NIDs with active Search activity.
        public static let searchActivityList = NID(rawValue: 0x201)

        /// Reserved.
        public static let reserved1 = NID(rawValue: 0x241)
        
        /// Global list of all Folder objects that are referenced by any Folder object's Search Criteria.
        public static let searchDomainObject = NID(rawValue: 0x261)
        
        /// Search Gatherer Queue (section 2.4.8.5.1).
        public static let searchGathererQueue = NID(rawValue: 0x281)
        
        /// Search Gatherer Descriptor (section 2.4.8.5.2).
        public static let searchGathererDescriptor = NID(rawValue: 0x2A1)
        
        /// Reserved.
        public static let reserved2 = NID(rawValue: 0x2E1)
        
        /// Reserved.
        public static let reserved3 = NID(rawValue: 0x301)

        /// Search Gatherer Folder Queue (section 2.4.8.5.3).
        public static let searchGathererFolderQueue = NID(rawValue: 0x321)
    }
}
