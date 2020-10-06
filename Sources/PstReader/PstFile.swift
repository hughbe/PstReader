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
    private let ndb: NDB
    private var ltp: LTP
    
    public convenience init(data: Data) throws {
        var dataStream = DataStream(data: data)
        try self.init(dataStream: &dataStream)
    }
    
    public init(dataStream: inout DataStream) throws {
        self.ndb = try NDB(dataStream: &dataStream)
        self.ltp = LTP(ndb: ndb)
    }

    internal lazy var namedProperties: NPMAP? = {
        return try? NPMAP(ltp: &ltp)
    }()
    
    public lazy var rootFolder: Folder? = {
        return try? getFolder(nid: NID.SpecialInternal.rootFolder)
    }()
    
    public lazy var messageStore: MessageStore? = {
        guard let properties = try? ltp.readProperties(nid: NID.SpecialInternal.messageStore) else {
            return nil
        }

        return MessageStore(properties: properties, file: self)
    }()
    
    public func getFolder(nid: NID) throws -> Folder {
        let properties = try ltp.readProperties(nid: nid)
        var folder = Folder(nid: nid, properties: properties, file: self)
        
        for tableRow in try ltp.readTableRowIds(nid: NID(type: .hierachyTable, nid: nid)) {
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
        
        return try ltp.readTable(nid: NID(type: .contentsTable, nid: folder.nid)).map { Message(folder: folder, properties: $0, file: self) }
    }
    
    public func getAssociatedContents(folder: Folder) throws -> [[UInt16: Any?]] {
        return try ltp.readTable(nid: NID(type: .assocContentsTable, nid: folder.nid))
    }
    
    public struct MessageStore: MessageStorageInternal {
        internal let properties: [UInt16: Any?]
        internal let file: PstFile
        
        internal init(properties: [UInt16: Any?], file: PstFile) {
            self.properties = properties
            self.file = file
        }
    }
    
    public struct Message: MessageStorageInternal {
        internal let folder: Folder
        internal let properties: [UInt16: Any?]
        internal let file: PstFile
        
        internal init(folder: Folder, properties: [UInt16: Any?], file: PstFile) {
            self.folder = folder
            self.properties = properties
            self.file = file
        }
        
        internal func dump() {
            MAPI.dump(properties: properties)
        }
    }
    
    public struct Folder: MessageStorageInternal {
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
        
        public func dump() {
            func dumpFolder(folder: Folder, level: Int) {
                MAPI.dump(properties: properties)
                print("\(String(repeating: "\t", count: level)) Name: \(folder.displayName!)")
                print("\(String(repeating: "\t", count: level)) Content Count: \(folder.contentCount!)")
                print("\(String(repeating: "\t", count: level)) Content Unread Count: \(folder.contentUnreadCount!)")
                for child in folder.children {
                    dumpFolder(folder: child, level: level + 1)
                }
                
                for message in try! file.getMessages(folder: folder) {
                    message.dump()
                }
                
                for contents in try! file.getAssociatedContents(folder: folder) {
                    MAPI.dump(properties: contents)
                }
                
                print()
            }
            
            dumpFolder(folder: self, level: 0)
        }
    }
}
