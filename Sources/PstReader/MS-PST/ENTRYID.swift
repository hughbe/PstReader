//
//  ENTRYID.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream
import Foundation

/// [MS-PST] 2.4.3 Message Store
/// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
/// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
/// access and manage the PST contents.
/// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
/// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
/// 2.4.1). Any valid PST MUST have exactly one message store node.
/// [MS-PST] 2.4.3.2 Mapping between EntryID and NID
/// Objects in the message store are accessed externally using EntryIDs ([MS-OXCDATA] section 2.2),
/// where within the PST, objects are accessed using their respective NIDs. The following explains the
/// layout of the ENTRYID structure, which is used to map between an NID and its EntryID:
public struct ENTRYID {
    public var rgbFlags: UInt32
    public var uid: UUID
    public var nid: NID

    public init(dataStream: inout DataStream) throws {
        /// rgbFlags (4 bytes): Flags; each of these bytes MUST be initialized to zero.
        self.rgbFlags = try dataStream.read()
        
        /// uid (16 bytes): The provider UID of this PST, which is the value of the PidTagRecordKey property in the message store.
        /// If this property does not exist, the PST client MAY generate a new unique ID, or reject the PST as invalid.
        self.uid = try dataStream.read(type: UUID.self)
        
        /// nid (4 bytes): This is the corresponding NID of the underlying node that represents the object.
        /// The corresponding NID of an EntryID can be directly extracted from the EntryID structure. In addition,
        /// the NID_TYPE of the NID can be further verified to ensure that the type of node (for example,
        /// NID_TYPE_NORMAL_MESSAGE) actually matches the type of object being referenced. Also, as a
        /// further verification mechanism, implementations can compare the uid field against the
        /// PidTagRecordKey property in the message store to ensure the EntryID actually refers to an item in
        /// the current PST. This is particularly useful if the implementation supports opening more than one PST
        /// at a time.
        /// Conversely, the procedure for converting an NID to an EntryID simply involves constructing the
        /// ENTRYID structure from the NID and the PST Provider UID (PidTagRecordKey).
        self.nid = try NID(dataStream: &dataStream)

        assert(dataStream.remainingCount == 0)
    }
}
