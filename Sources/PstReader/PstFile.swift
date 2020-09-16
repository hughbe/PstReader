//
//  PstFile.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import Foundation

public struct PstFile {
    private let ndb: NDB
    private var ltp: LTP
    
    public init(data: Data) throws {
        var dataStream = DataStream(data: data)
        try self.init(dataStream: &dataStream)
        
        print(rootFolder)
    }
    
    public init(dataStream: inout DataStream) throws {
        self.ndb = try NDB(dataStream: &dataStream)
        self.ltp = LTP(ndb: ndb)
        
        func dumpFolder(folder: Folder, level: Int) {
            print("\(String(repeating: "\t", count: level)) Name: \(folder.displayName!)")
            print("\(String(repeating: "\t", count: level)) Content Count: \(folder.contentCount!)")
            print("\(String(repeating: "\t", count: level)) Content Unread Count: \(folder.contentUnreadCount!)")
            for child in folder.children {
                dumpFolder(folder: child, level: level + 1)
            }
            
            print()
        }

        let rootFolder = self.rootFolder!
        dumpFolder(folder: rootFolder, level: 0)
        
        let inboxMessages = try! getMessages(folder: rootFolder["Top of Outlook data file"]!["Inbox"]!)
        for message in inboxMessages {
            dump(properties: message.properties)
        }
    }
    
    public lazy var rootFolder: Folder? = {
        return try? getFolder(nid: NID.SpecialInternal.rootFolder)
    }()
    
    public mutating func getMessages(folder: Folder) throws -> [Message] {
        guard let contentCount = folder.contentCount, contentCount > 0 else {
            return []
        }
        
        return try ltp.readTable(nid: NID(type: .contentsTable, nid: folder.nid)).map { Message(folder: folder, properties: $0) }
    }
    
    private mutating func getFolder(nid: NID) throws -> Folder {
        let properties = try ltp.readProperties(nid: nid)
        var folder = Folder(nid: nid, properties: properties)
        
        for tableRow in try ltp.readTableRowIds(nid: NID(type: .hierachyTable, nid: nid)) {
            if tableRow.type != .normalFolder {
                continue
            }
            
            let child = try getFolder(nid: tableRow)
            folder.children.append(child)
        }
        
        return folder
    }
    
    public struct Message {
        internal var folder: Folder
        internal var properties: [UInt16: Any?]
        
        init(folder: Folder, properties: [UInt16: Any?]) {
            self.folder = folder
            self.properties = properties
        }
    }
    
    public struct Folder {
        internal var nid: NID
        internal var properties: [UInt16: Any?]
        public internal(set) var children: [Folder] = []
        
        init(nid: NID, properties: [UInt16: Any?]) {
            self.nid = nid
            self.properties = properties
        }
        
        public subscript(child: String) -> Folder? {
            return children.first { $0.displayName == child }
        }
        
        public var displayName: String? {
            return getProperty(id: .tagDisplayName)
        }
        
        public var contentCount: UInt32? {
            return getProperty(id: .tagContentCount)
        }
        
        public var contentUnreadCount: UInt32? {
            return getProperty(id: .tagContentUnreadCount)
        }
        
        public var subfolders: Bool? {
            return getProperty(id: .tagSubfolders)
        }
        
        public func getProperty<T>(id: UInt16) -> T? {
            return properties[id] as? T
        }
        
        func getProperty<T>(id: PropertyId) -> T? {
            return getProperty(id: id.rawValue)
        }
    }
}
