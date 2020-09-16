//
//  NIDType.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

public enum NIDType: UInt32 {
    /// Heap node
    case hid = 0x00
    
    /// Internal node (section 2.4.1)
    case `internal` = 0x01
    
    /// Normal Folder object (PC)
    case normalFolder = 0x02
    
    /// Search Folder object (PC)
    case searchFolder = 0x03
    
    /// Normal Message object (PC)
    case normalMessage = 0x04
    
    /// Attachment object (PC)
    case attachment = 0x05
    
    /// Queue of changed objects for search Folder objects
    case searchUpdateQueue = 0x06
    
    /// Defines the search criteria for a search Folder object
    case searchCriteriaObject = 0x07
    
    /// Folder associated information (FAI) Message object (PC)
    case assocMessage = 0x08
    
    /// Internal, persisted view-related
    case contentsTableIndex = 0x0A
    
    /// Receive Folder object (Inbox)
    case receiveFolderTable = 0x0B
    
    /// Outbound queue (Outbox)
    case outgoingQueueTable = 0x0C
    
    /// Hierarchy table (TC)
    case hierachyTable = 0x0D
    
    /// Contents table (TC)
    case contentsTable = 0x0E
    
    /// FAI contents table (TC)
    case assocContentsTable = 0x0F
    
    /// Contents table (TC) of a search Folder object
    case searchContentsTable = 0x10
    
    /// Attachment table (TC)
    case attachmentTable = 0x11
    
    /// Recipient table (TC)
    case recipientTable = 0x12
    
    /// Internal, persisted view-related
    case searchTableIndex = 0x13

    /// LTP
    case ltp = 0x1F
}
