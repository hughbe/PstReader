//
//  OutlookPstFileTests.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import MAPI
import XCTest
@testable import PstReader

final class OutlookPstFileTests: XCTestCase {
    func testExample() throws {
        do {
            let data = try getData(name: "backup")
            let pst = try PstFile(data: data)
    
            XCTAssertNotNil(pst.rootFolder)
            XCTAssertEqual("", pst.rootFolder!.displayName)
            XCTAssertEqual(0, pst.rootFolder!.contentCount)
            XCTAssertEqual(0, pst.rootFolder!.contentUnreadCount)
            XCTAssertTrue(pst.rootFolder!.subfolders!)
            XCTAssertEqual(2, pst.rootFolder!.children.count)
            do {
                XCTAssertEqual("Search Root", pst.rootFolder!.children[0].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[0].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[0].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[0].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[0].children.count)

                XCTAssertEqual("Top of Outlook data file", pst.rootFolder!.children[1].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].contentUnreadCount)
                XCTAssertTrue(pst.rootFolder!.children[1].subfolders!)
                XCTAssertEqual(20, pst.rootFolder!.children[1].children.count)

                XCTAssertEqual("Archive", pst.rootFolder!.children[1].children[0].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[0].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[0].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[0].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[0].children.count)

                XCTAssertEqual("Calendar", pst.rootFolder!.children[1].children[1].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[1].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[1].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[1].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[1].children.count)

                XCTAssertEqual("Contacts", pst.rootFolder!.children[1].children[2].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].contentUnreadCount)
                XCTAssertTrue(pst.rootFolder!.children[1].children[2].subfolders!)
                XCTAssertEqual(2, pst.rootFolder!.children[1].children[2].children.count)
                
                do {
                    XCTAssertEqual("GAL Contacts", pst.rootFolder!.children[1].children[2].children[0].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[0].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[0].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[2].children[0].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[0].children.count)
                    
                    XCTAssertEqual("Recipient Cache", pst.rootFolder!.children[1].children[2].children[1].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[1].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[1].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[2].children[1].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[2].children[1].children.count)
                }

                XCTAssertEqual("Conversation Action Settings", pst.rootFolder!.children[1].children[3].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[3].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[3].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[3].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[3].children.count)

                XCTAssertEqual("Conversation History", pst.rootFolder!.children[1].children[4].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[4].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[4].contentUnreadCount)
                XCTAssertTrue(pst.rootFolder!.children[1].children[4].subfolders!)
                XCTAssertEqual(1, pst.rootFolder!.children[1].children[4].children.count)
                
                do {
                    XCTAssertEqual("Team Chat", pst.rootFolder!.children[1].children[4].children[0].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[4].children[0].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[4].children[0].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[4].children[0].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[4].children[0].children.count)
                }

                XCTAssertEqual("Deleted Items", pst.rootFolder!.children[1].children[5].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[5].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[5].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[5].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[5].children.count)

                XCTAssertEqual("Drafts", pst.rootFolder!.children[1].children[6].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[6].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[6].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[6].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[6].children.count)

                XCTAssertEqual("ExternalContacts", pst.rootFolder!.children[1].children[7].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[7].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[7].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[7].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[7].children.count)

                XCTAssertEqual("Files", pst.rootFolder!.children[1].children[8].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[8].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[8].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[8].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[8].children.count)

                XCTAssertEqual("Inbox", pst.rootFolder!.children[1].children[9].displayName)
                XCTAssertEqual(1, pst.rootFolder!.children[1].children[9].contentCount)
                XCTAssertEqual(1, pst.rootFolder!.children[1].children[9].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[9].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[9].children.count)

                XCTAssertEqual("Journal", pst.rootFolder!.children[1].children[10].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[10].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[10].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[10].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[10].children.count)

                XCTAssertEqual("Junk Email", pst.rootFolder!.children[1].children[11].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[11].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[11].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[11].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[11].children.count)

                XCTAssertEqual("Notes", pst.rootFolder!.children[1].children[12].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[12].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[12].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[12].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[12].children.count)

                XCTAssertEqual("Outbox", pst.rootFolder!.children[1].children[13].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[13].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[13].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[13].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[13].children.count)

                XCTAssertEqual("Quick Step Settings", pst.rootFolder!.children[1].children[14].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[14].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[14].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[14].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[14].children.count)

                XCTAssertEqual("RSS Feeds", pst.rootFolder!.children[1].children[15].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[15].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[15].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[15].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[15].children.count)

                XCTAssertEqual("Sent Items", pst.rootFolder!.children[1].children[16].displayName)
                XCTAssertEqual(1, pst.rootFolder!.children[1].children[16].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[16].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[16].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[16].children.count)

                XCTAssertEqual("Sync Issues", pst.rootFolder!.children[1].children[17].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].contentUnreadCount)
                XCTAssertTrue(pst.rootFolder!.children[1].children[17].subfolders!)
                XCTAssertEqual(3, pst.rootFolder!.children[1].children[17].children.count)
                
                do {
                    XCTAssertEqual("Conflicts", pst.rootFolder!.children[1].children[17].children[0].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[0].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[0].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[17].children[0].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[0].children.count)
                    
                    XCTAssertEqual("Local Failures", pst.rootFolder!.children[1].children[17].children[1].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[1].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[1].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[17].children[1].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[1].children.count)
                    
                    XCTAssertEqual("Server Failures", pst.rootFolder!.children[1].children[17].children[2].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[2].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[2].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[17].children[2].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[17].children[2].children.count)
                }

                XCTAssertEqual("Tasks", pst.rootFolder!.children[1].children[18].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[18].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[18].contentUnreadCount)
                XCTAssertFalse(pst.rootFolder!.children[1].children[18].subfolders!)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[18].children.count)

                XCTAssertEqual("Yammer Root", pst.rootFolder!.children[1].children[19].displayName)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].contentCount)
                XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].contentUnreadCount)
                XCTAssertTrue(pst.rootFolder!.children[1].children[19].subfolders!)
                XCTAssertEqual(3, pst.rootFolder!.children[1].children[19].children.count)
                
                do {
                    XCTAssertEqual("Feeds", pst.rootFolder!.children[1].children[19].children[0].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[0].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[0].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[19].children[0].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[0].children.count)
                    
                    XCTAssertEqual("Inbound", pst.rootFolder!.children[1].children[19].children[1].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[1].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[1].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[19].children[1].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[1].children.count)
                    
                    XCTAssertEqual("Outbound", pst.rootFolder!.children[1].children[19].children[2].displayName)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[2].contentCount)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[2].contentUnreadCount)
                    XCTAssertFalse(pst.rootFolder!.children[1].children[19].children[2].subfolders!)
                    XCTAssertEqual(0, pst.rootFolder!.children[1].children[19].children[2].children.count)
                }
                
                let inboxFolder = pst.rootFolder!["Top of Outlook data file"]!["Inbox"]!
                let messages = try pst.getMessages(folder: inboxFolder)
                XCTAssertEqual(1, messages.count)
                XCTAssertEqual(0x00000016, messages[0].ltpRowVer)
                XCTAssertEqual(22, messages[0].ltpRowId)
                XCTAssertEqual("Hugh Bellamy", messages[0].sentRepresentingName)
                XCTAssertEqual(1600247575.0, messages[0].clientSubmitTime?.timeIntervalSince1970)
                XCTAssertEqual(.normal, messages[0].sensitivity)
                XCTAssertEqual(0x0000B7A8, messages[0].messageSize)
                XCTAssertEqual(.normal, messages[0].importance)
                XCTAssertEqual("Success", messages[0].conversationTopic)
                XCTAssertEqual(1600247578.0, messages[0].messageDeliveryTime?.timeIntervalSince1970)
                XCTAssertEqual("IPM.Note", messages[0].messageClass)
                XCTAssertEqual("\u{01}\u{01}Success", messages[0].subject)
                XCTAssertEqual(Data([0x26, 0x5A, 0x36, 0xB5, 0x94, 0x08, 0x45, 0x06, 0xA9, 0xD0, 0xF3, 0x22, 0xFB, 0x30, 0x4B, 0xE7]), messages[0].conversationId)
                XCTAssertEqual([], messages[0].messageFlags)
                XCTAssertEqual([], messages[0].messageStatus)
                XCTAssertEqual(Data([0xF2, 0x2D, 0x19, 0x1D, 0xC4, 0xDB, 0x71, 0x45, 0x94, 0xF1, 0x8E, 0x02, 0x8B, 0x36, 0xFB, 0xC0]), messages[0].searchKey)
                XCTAssertEqual("Hugh Bellamy", messages[0].displayTo)
                XCTAssertTrue(messages[0].messageToMe!)
                XCTAssertFalse(messages[0].messageCcMe!)
                XCTAssertEqual(Data([0xF2, 0x2D, 0x19, 0x1D, 0xC4, 0xDB, 0x71, 0x45, 0x94, 0xF1, 0x8E, 0x02, 0x8B, 0x36, 0xFB, 0xC0]), messages[0].searchKey)
                XCTAssertEqual(1600247579.0, messages[0].lastModificationTime?.timeIntervalSince1970)
    
                XCTAssertEqual(Data([0x01, 0x00, 0x00, 0x00, 0x10, 0x7F, 0x6F, 0x20, 0x1A, 0x95, 0x0D, 0x45, 0x9D, 0x31, 0xE2, 0x5C, 0xD4, 0x07, 0xC0, 0x2F, 0x01, 0x00, 0x00, 0x00]), pst.messageStore!.replVersionHistory)
                XCTAssertEqual(Data([0x43, 0xEE, 0x6C, 0x66, 0xA7, 0x46, 0xEF, 0x44, 0x8E, 0xF7, 0xA3, 0xFB, 0x87, 0xFF, 0x25, 0xE6]), pst.messageStore!.recordKey)
                XCTAssertEqual(0, pst.messageStore!.ipmWastebasketEntryId!.rgbFlags)
                XCTAssertEqual(UUID(uuidString: "43EE6C66-A746-EF44-8EF7-A3FB87FF25E6"), pst.messageStore!.ipmWastebasketEntryId!.uid)
                XCTAssertEqual(0x00008062, pst.messageStore!.ipmWastebasketEntryId!.nid.rawValue)
                XCTAssertEqual("Deleted Items", try pst.getFolder(nid: pst.messageStore!.ipmWastebasketEntryId!.nid).displayName)
                XCTAssertEqual("Deleted Items folder", try pst.getFolder(nid: pst.messageStore!.ipmWastebasketEntryId!.nid).comment)
                XCTAssertEqual(0, pst.messageStore!.ipmSubTreeEntryId!.rgbFlags)
                XCTAssertEqual(UUID(uuidString: "43EE6C66-A746-EF44-8EF7-A3FB87FF25E6"), pst.messageStore!.ipmSubTreeEntryId!.uid)
                XCTAssertEqual("Top of Outlook data file", try pst.getFolder(nid: pst.messageStore!.ipmSubTreeEntryId!.nid).displayName)
                XCTAssertEqual([.ipmSubtreeValid, .ipmWasteBasketValid, .finderValid], pst.messageStore!.validFolderMask)
                XCTAssertEqual(0, pst.messageStore!.finderEntryId!.rgbFlags)
                XCTAssertEqual(UUID(uuidString: "43EE6C66-A746-EF44-8EF7-A3FB87FF25E6"), pst.messageStore!.finderEntryId!.uid)
                XCTAssertEqual("Search Root", try pst.getFolder(nid: pst.messageStore!.finderEntryId!.nid).displayName)
                XCTAssertEqual(0x000E0011, pst.messageStore!.latestPstEnsure)
                XCTAssertEqual(0x00000000, pst.messageStore!.pstPassword)
                XCTAssertTrue(pst.messageStore!.pstLrNoRestrictions!)
                XCTAssertEqual(0, pst.messageStore!.replFlags)
                XCTAssertEqual("Outlook Data File", pst.messageStore!.displayName)
                XCTAssertEqual(0x00189D47, pst.messageStore!.getProperty(id: .unknown0x66FC) as UInt32?)
            }
        }

        do {
            let data = try getData(name: "backup_with_rules")
            let pst = try PstFile(data: data)
            let inboxFolder = pst.rootFolder!["Top of Outlook data file"]!["Inbox"]!
            let associatedContents = try pst.getAssociatedContents(folder: inboxFolder)
            print(associatedContents)
        }
    }

    private func getData(name: String) throws -> Data {
        let url = URL(forResource: name, withExtension: "pst")
        return try Data(contentsOf: url)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
