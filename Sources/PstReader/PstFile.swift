//
//  PstFile.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import Foundation
import MAPI

public class PstFile {
    private var ndb: NDB
    
    public convenience init(data: Data) throws {
        var dataStream = DataStream(data)
        try self.init(dataStream: &dataStream)
    }
    
    public init(dataStream: inout DataStream) throws {
        self.ndb = try NDB(dataStream: &dataStream)
    }

    internal lazy var namedProperties: NPMAP? = {
        return try? NPMAP(ndb: ndb)
    }()
    
    public lazy var rootFolder: Folder? = {
        return try? getFolder(nid: NID.SpecialInternal.rootFolder)
    }()
    
    public lazy var messageStore: MessageStore? = {
        guard let propertyContext = try? LTP.PropertyContext(ndb: ndb, nid: NID.SpecialInternal.messageStore) else {
            return nil
        }

        return MessageStore(properties: propertyContext.properties, file: self)
    }()
    
    public func getFolder(nid: NID) throws -> Folder {
        let propertyContext = try LTP.PropertyContext(ndb: ndb, nid: nid)
        var folder = Folder(nid: nid, properties: propertyContext.properties, file: self)
        
        let table = try LTP.TableContext(ndb: ndb, nid: NID(type: .hierachyTable, nid: nid))
        for tableRow in table.bTreeOnHeap.bthList {
            if tableRow.dwRowID.type != .normalFolder {
                continue
            }
            
            let child = try getFolder(nid: tableRow.dwRowID)
            folder.children.append(child)
        }
        
        folder.children.sort { ($0.displayName ?? "") < ($1.displayName ?? "") }
        return folder
    }
    
    public struct MessageStore: MessageStorageInternal, CustomStringConvertible {
        internal let properties: PropertiesReader
        internal let file: PstFile
        
        internal init(properties: PropertiesReader, file: PstFile) {
            self.properties = properties
            self.file = file
        }
        
        public var description: String {
            return propertiesString(properties: try! properties.getAllProperties(), namedProperties: file.namedProperties?.properties)
        }
    }
    
    public struct Folder: MessageStorageInternal, CustomStringConvertible {
        internal let nid: NID
        internal let properties: PropertiesReader
        internal let file: PstFile
        
        public private(set) var hasDetails: Bool = false
        public internal(set) var children: [Folder] = []
        
        internal init(nid: NID, properties: PropertiesReader, file: PstFile) {
            self.nid = nid
            self.properties = properties
            self.file = file
        }
        
        public func getMessages() throws -> [Message] {
            guard let contentCount = contentCount, contentCount > 0 else {
                return []
            }
            
            var table = try LTP.TableContext(ndb: file.ndb, nid: NID(type: .contentsTable, nid: nid))
            return table.rows
                .map { Message(folder: self, nid: $0.nid, properties: $0.properties) }
        }
        
        public func getAssociatedContents() throws -> [Message] {
            var table = try LTP.TableContext(ndb: file.ndb, nid: NID(type: .assocContentsTable, nid: nid))
            return table.rows
                .map { Message(folder: self, nid: $0.nid, properties: $0.properties) }
        }
        
        public func getFolderDetails() throws -> Folder {
            if hasDetails {
                return self
            }

            let propertyContext = try LTP.PropertyContext(ndb: file.ndb, nid: nid)
            var folder = Folder(nid: nid, properties: propertyContext.properties, file: file)
            folder.hasDetails = true
            return folder
        }
        
        public subscript(child: String) -> Folder? {
            return children.first { $0.displayName == child }
        }

        public var description: String {
            func dumpFolder(folder: Folder, level: Int) -> String {
                var s = propertiesString(properties: try! properties.getAllProperties(), namedProperties: file.namedProperties?.properties) + "\n"
                
                for child in folder.children {
                    s += dumpFolder(folder: child, level: level + 1)
                }
                
                for message in try! folder.getMessages() {
                    s += try! message.getMessageDetails().description
                }
                
                for content in try! folder.getAssociatedContents() {
                    s += try! content.getMessageDetails().description
                }

                return s
            }
            
            return dumpFolder(folder: self, level: 0)
        }
    }
    
    public struct Message: MessageStorageInternal, CustomStringConvertible {
        public let folder: Folder
        internal let nid: NID
        internal let properties: PropertiesReader
        internal var file: PstFile {
            return folder.file
        }
        
        public private(set) var hasDetails: Bool = false
        
        public private(set) var recipients: [Recipient] = []
        public private(set) var attachments: [Attachment] = []
        
        internal init(folder: Folder, nid: NID, properties: PropertiesReader) {
            self.folder = folder
            self.nid = nid
            self.properties = properties
        }
        
        public func getMessageDetails() throws -> Message {
            if hasDetails {
                return self
            }
            
            let propertyContext = try LTP.PropertyContext(ndb: file.ndb, nid: nid)
            var message = Message(folder: folder, nid: nid, properties: propertyContext.properties)
            message.hasDetails = true

            guard let subNodeTree = propertyContext.subNodeTree else {
                return message
            }
            
            /// [MS-PST] 2.4.5.3 Recipient Table
            /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
            /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
            /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
            /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
            if let _ = subNodeTree.lookup(key: UInt64(NID.SpecialInternal.recipientTable.rawValue)) {
                /// [MS-PST] 2.4.5.3.2 Message Object Recipient Tables
                /// Recipient Tables in actual Message objects contain all the columns in the recipient table template,
                /// plus a number of extra properties about its Recipients. Recipient properties are specified in [MSOXPROPS].
                var recipientTableContext = try LTP.TableContext(ndb: file.ndb, nid: NID.SpecialInternal.recipientTable, subNodeTree: subNodeTree)
                message.recipients.reserveCapacity(recipientTableContext.rows.count)
                for row in recipientTableContext.rows {
                    let recipient = Recipient(message: message, properties: row.properties)
                    message.recipients.append(recipient)
                }
            }
            
            /// [MS-PST] 2.4.6 Attachment Objects
            /// An Attachment object is an arbitrary binary object that can be associated with (that is, attached to)
            /// a Message object. As illustrated in the diagram in section 2.4.6.3, Attachment objects are stored in
            /// the subnode of a Message object node, and are therefore only accessible through the Message object
            /// node.
            /// A Message object keeps track of its Attachment objects using an optional Attachment Table in its
            /// subnode. The Attachment Table is said to be optional because it only exists if a Message object has at
            /// least one Attachment object. The presence of Attachment objects is indicated in
            /// PidTagMessageFlags property in the Message object. The presence of Attachment objects is
            /// indicated by the MSGFLAG_HASATTACH (0x10) bit set to "1" in PidTagMessageFlags. If Attachment
            /// objects are present, then the Attachment Table can be accessed by scanning the subnode BTree of the
            /// Message object subnode to locate a subnode whose NID is NID_ATTACHMENT_TABLE. Each Message
            /// object MUST have at most one Attachment Table.
            /// While the Attachment Table lists all the Attachment objects of a Message object, The actual
            /// Attachment objects are stored in separate subnodes in the Message object (see the diagram in section
            /// 2.4.6.3). Attachment object subnodes are easily identified by having an NID_TYPE of
            /// NID_TYPE_ATTACHMENT. Each Attachment object subnode contains a PC with all the properties of the
            /// Attachment object, including a property that contains the actual binary data of the Attachment object.
            /// The number of Attachment object subnodes MUST match the number of rows in the Attachment Table.
            if let messageFlags = message.messageFlags, messageFlags.contains(.hasAttachment) {
                guard let _ = subNodeTree.lookup(key: UInt64(NID.SpecialInternal.attachmentTable.rawValue)) else {
                    throw PstReadError.noSuchNode(nid: NID.SpecialInternal.attachmentTable.rawValue)
                }
                
                /// [MS-PST] 2.4.6.1 Attachment Table
                /// The Attachment Table is a standard TC structure where each of its rows maps to an Attachment
                /// object. Each row contains sufficient metadata to identify or display a representation of the
                /// Attachment object, but the full Attachment object data is stored in a separate subnode. The
                /// Attachment table is optional, and can be absent from Message objects that do not contain any
                /// Attachment objects.
                if var attachmentTableContext = try? LTP.TableContext(ndb: file.ndb, nid: NID.SpecialInternal.attachmentTable, subNodeTree: subNodeTree) {
                    message.attachments.reserveCapacity(attachmentTableContext.rows.count)
                    
                    /// [MS-PST] 2.4.6.1.2 Message Object Attachment Tables
                    /// Attachment Tables in actual Message objects contain all the columns in the attachment table
                    /// template, plus a number of extra properties about its Attachment object. Attachment object
                    /// properties are specified in [MS-OXCMSG] and [MS-OXPROPS].
                    for row in attachmentTableContext.rows {
                        /// [MS-PST] 2.4.6.1.3 Locating Attachment Object Nodes from the Attachment Table
                        /// Each row in the Attachment Table maps to an Attachment object subnode in the same way that a
                        /// Folder object contents table maps its rows to Message object nodes (see section 2.4.4.5.2). The
                        /// Attachment Table uses the RowIndex in the TC to map rows to Attachment object subnodes. In
                        /// particular, each dwRowID value contains the subnode NID of the Attachment object subnode that
                        /// corresponds to the row specified by dwRowIndex.
                        let attachment = Attachment(message: message, nid: row.nid, subNodeTree: subNodeTree, properties: row.properties)
                        message.attachments.append(attachment)
                    }
                }
            }

            return message
        }
        
        public var description: String {
            var s = "--- Message ---\n"
            s += propertiesString(properties: try! properties.getAllProperties(), namedProperties: file.namedProperties?.properties)
            for (offset, recipient) in recipients.enumerated() {
                s += "\n--- Recipient[\(offset)] ---\n"
                s += recipient.description
            }
            
            for (offset, attachment) in attachments.enumerated() {
                s += "\n--- Attachment[\(offset)] ---\n"
                s += try! attachment.getAttachmentDetails().description
            }
            
            return s + "\n"
        }
    }
    
    public struct Recipient: MessageStorageInternal, CustomStringConvertible {
        public let message: Message
        internal let properties: PropertiesReader
        internal var file: PstFile {
            return message.folder.file
        }
        
        internal init(message: Message, properties: PropertiesReader) {
            self.message = message
            self.properties = properties
        }
        
        public var description: String {
            return propertiesString(properties: try! properties.getAllProperties(), namedProperties: file.namedProperties?.properties)
        }
    }
    
    public struct Attachment: MessageStorageInternal, CustomStringConvertible {
        public let message: Message
        internal let nid: NID
        internal let subNodeTree: BTree<Node>
        internal let properties: PropertiesReader
        internal var file: PstFile {
            return message.folder.file
        }
        
        public private(set) var hasDetails: Bool = false
        
        internal init(message: Message, nid: NID, subNodeTree: BTree<Node>, properties: PropertiesReader) {
            self.message = message
            self.nid = nid
            self.subNodeTree = subNodeTree
            self.properties = properties
        }
        
        public func getAttachmentDetails() throws -> Attachment {
            if hasDetails {
                return self
            }

            /// [MS-PST] 2.4.6.2 Attachment Object PC
            /// An Attachment object PC is a subnode with an NID_TYPE of NID_TYPE_ATTACHMENT, which
            /// contains all the information about an Attachment object. Because of the size of most Attachment
            /// objects being quite large, the binary data of the Attachment objects are stored in the subnode of the
            /// Attachment object node (which is itself a subnode of the Message object node), and often, a data
            /// tree is used to store the binary content. The number of Attachment object subnodes in a Message
            /// object MUST equal the number of rows in the Attachment Table.
            let propertyContext = try LTP.PropertyContext(ndb: file.ndb, nid: nid, subNodeTree: subNodeTree)
            var attachment = Attachment(message: message, nid: nid, subNodeTree: subNodeTree, properties: propertyContext.properties)
            attachment.hasDetails = true
            return attachment
        }
        
        public var description: String {
            return propertiesString(properties: try! properties.getAllProperties(), namedProperties: file.namedProperties?.properties)
        }
    }
}
