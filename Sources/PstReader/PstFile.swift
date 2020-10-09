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
        var dataStream = DataStream(data: data)
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
        guard let propertyContext = try? LTP.readPropertyContext(ndb: ndb, nid: NID.SpecialInternal.messageStore) else {
            return nil
        }

        return MessageStore(properties: propertyContext.properties, file: self)
    }()
    
    public func getFolder(nid: NID) throws -> Folder {
        let propertyContext = try LTP.readPropertyContext(ndb: ndb, nid: nid)
        var folder = Folder(nid: nid, properties: propertyContext.properties, file: self)
        
        for tableRow in try LTP.readTableRowIds(ndb: ndb, nid: NID(type: .hierachyTable, nid: nid)) {
            if tableRow.type != .normalFolder {
                continue
            }
            
            let child = try getFolder(nid: tableRow)
            folder.children.append(child)
        }
        
        folder.children.sort { ($0.displayName ?? "") < ($1.displayName ?? "") }
        return folder
    }
    
    public func getMessages(folder: Folder) throws -> [Message] {
        guard let contentCount = folder.contentCount, contentCount > 0 else {
            return []
        }
        
        return try LTP
            .readTable(ndb: ndb, nid: NID(type: .contentsTable, nid: folder.nid))
            .rows
            .map { Message(folder: folder, nid: $0.nid, properties: $0.properties, file: self) }
    }
    
    public func getAssociatedContents(folder: Folder) throws -> [[UInt16: Any?]] {
        return try LTP
            .readTable(ndb: ndb, nid: NID(type: .assocContentsTable, nid: folder.nid))
            .rows
            .map { $0.properties }
    }
    
    public func getMessageDetails(message: Message) throws -> Message {
        let propertyContext = try LTP.readPropertyContext(ndb: ndb, nid: message.nid)
        let message = Message(folder: message.folder, nid: message.nid, properties: propertyContext.properties, file: self)

        /*
        let t = try ltp.readTable(nid: NID(type: .recipientTable, nid: message.nid))
        if t.count > 0 {
            fatalError("N!!")
        }
         */
        
        return message
    }
    
    public struct MessageStore: MessageStorageInternal, CustomStringConvertible {
        internal let properties: [UInt16: Any?]
        internal let file: PstFile
        
        internal init(properties: [UInt16: Any?], file: PstFile) {
            self.properties = properties
            self.file = file
        }
        
        public var description: String {
            return propertiesString(properties: properties, namedProperties: file.namedProperties?.dictionary)
        }
    }
    
    public struct Folder: MessageStorageInternal, CustomStringConvertible {
        internal let nid: NID
        internal let properties: [UInt16: Any?]
        internal let file: PstFile
        public internal(set) var children: [Folder] = []
        
        internal init(nid: NID, properties: [UInt16: Any?], file: PstFile) {
            self.nid = nid
            self.properties = properties
            self.file = file
        }
        
        public subscript(child: String) -> Folder? {
            return children.first { $0.displayName == child }
        }
        
        public var description: String {
            func dumpFolder(folder: Folder, level: Int) -> String {
                var s = propertiesString(properties: properties, namedProperties: file.namedProperties?.dictionary) + "\n"
                s += "\(String(repeating: "\t", count: level)) Name: \(folder.displayName!)\n"
                s += "\(String(repeating: "\t", count: level)) Content Count: \(folder.contentCount!)\n"
                s += "\(String(repeating: "\t", count: level)) Content Unread Count: \(folder.contentUnreadCount!)\n"
                for child in folder.children {
                    s += dumpFolder(folder: child, level: level + 1)
                }
                
                for message in try! file.getMessages(folder: folder) {
                    s += try! file.getMessageDetails(message: message).description
                }
                
                for contents in try! file.getAssociatedContents(folder: folder) {
                    s += propertiesString(properties: contents, namedProperties: file.namedProperties?.dictionary)
                }

                return s
            }
            
            return dumpFolder(folder: self, level: 0)
        }
    }
    
    public struct Message: MessageStorageInternal, CustomStringConvertible {
        internal let folder: Folder
        internal let nid: NID
        internal let properties: [UInt16: Any?]
        internal let file: PstFile
        
        internal init(folder: Folder, nid: NID, properties: [UInt16: Any?], file: PstFile) {
            self.folder = folder
            self.nid = nid
            self.properties = properties
            self.file = file
        }
        
        public var description: String {
            return propertiesString(properties: properties, namedProperties: file.namedProperties?.dictionary)
        }
    }
}
