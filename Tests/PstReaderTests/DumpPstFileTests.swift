//
//  DumpPstFileTests.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI
import XCTest
@testable import PstReader

final class DumpPstFileTests: XCTestCase {

    static func dumpAttachment(accessor: String, attachment: PstFile.Attachment) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! attachment.properties.getAllProperties(), namedProperties: attachment.file.namedProperties?.properties)
        
        if !attachment.hasDetails {
            s += "do {\n"
            s += "let attachmentDetails = try \(accessor).getAttachmentDetails()\n"
            s += dumpAttachment(accessor: "attachmentDetails", attachment: try! attachment.getAttachmentDetails())
            s += "}\n"
        }

        return s
    }
    
    static func dumpRecipient(accessor: String, recipient: PstFile.Recipient) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! recipient.properties.getAllProperties(), namedProperties: recipient.file.namedProperties?.properties)

        return s
    }

    static func dumpMessage(accessor: String, message: PstFile.Message) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! message.properties.getAllProperties(), namedProperties: message.file.namedProperties?.properties)

        s += "XCTAssertEqual(\(message.attachments.count), \(accessor).attachments.count)\n"
        for (offset, attachment) in message.attachments.enumerated() {
            s += dumpAttachment(accessor: "\(accessor).attachments[\(offset)]", attachment: attachment)
            s += "\n"
        }
        
        s += "XCTAssertEqual(\(message.recipients.count), \(accessor).recipients.count)\n"
        for (offset, recipient) in message.recipients.enumerated() {
            s += dumpRecipient(accessor: "\(accessor).recipients[\(offset)]", recipient: recipient)
            s += "\n"
        }

        s += "\n"
        
        if !message.hasDetails {
            s += "do {\n"
            s += "let messageDetails = try \(accessor).getMessageDetails()\n"
            s += dumpMessage(accessor: "messageDetails", message: try! message.getMessageDetails())
            s += "}\n"
        }
        
        return s
    }

    static func dumpFolder(accessor: String, folder: PstFile.Folder) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! folder.properties.getAllProperties(), namedProperties: folder.file.namedProperties?.properties)

        s += "do {\n"
        let associatedContents = try! folder.getAssociatedContents()
        s += "let associatedContents = try \(accessor).getAssociatedContents()\n"
        s += "XCTAssertEqual(\(associatedContents.count), associatedContents.count)\n"
        for (offset, associatedContent) in associatedContents.enumerated() {
            s += dumpMessage(accessor: "associatedContents[\(offset)]", message: associatedContent)
        }

        s += "}\n\n"

        s += "do {\n"
        let messages = try! folder.getMessages()
        s += "let messages = try \(accessor).getMessages()\n"
        s += "XCTAssertEqual(\(messages.count), messages.count)\n"
        for (offset, message) in messages.enumerated() {
            s += dumpMessage(accessor: "messages[\(offset)]", message: message)
        }
        s += "}\n\n"

        s += "XCTAssertEqual(\(folder.children.count), \(accessor).children.count)\n"
        if folder.children.count > 0 {
            for (offset, folder) in folder.children.enumerated() {
                s += dumpFolder(accessor: "\(accessor).children[\(offset)]", folder: folder)
            }
        }

        return s
    }

    static func dump(file: PstFile) {
        var s = "XCTAssertNotNil(pst.rootFolder)\n"
        
        s += dumpFolder(accessor: "pst.rootFolder!", folder: file.rootFolder!)

        print(s)
    }

    func testDumper() throws {
        do {
            for name in [
                /* joachimmetz/plaso */
                "nromanoff@stark-research-labs.com",
                "97_outlook_qwerty12345",
                
                /* hughbe */
                "pstreadertests@outlook.com.ost",
                "pstreadertests@outlook.com.pst",
                
                /* rjohnsondev/java-libpst */
                "example-2013",
    
                /* simiden/pst2john/ */
                "2k_outlook_qwerty1234",
                "97_outlook_pass12345",
                "2003_compressable-encryption_quickbrownfox",
                "2003_compressable-encryption_quickquick",
                "2003_high-encryption_quickbrownfox3",
                "2003_high-encryption_quickquick",
                "2003_high-encryption_quickquick",
                "2003_no-encryption_quickquick",
                "2003_no-encryption_quickquick12",
                "2003_outlook-high-encryption_cheechNchong",
                "2007_default_a1sellers",
                "2007_default_orxgnm",
                "openwall",
                "Outlook_enc",
                "password",
                
                /* aranetic/process-pst/ */
                "flags_jane_doe",
                "flags_john_doe",
                "four_nesting_levels",
                "multiple_to_cc",
                "unsent_email",
                
                /* ic4f/pluto */
                "albert_meyers_000_1_1",
                
                /* EDRM Enron Email Data Set */
                "EDRM Enron Email Data Set/sample",
                
                /* DFRWS 2009 Rodeo */
                "DFRWS2009-Outlook-Email",
                
                /* aspose-email/Aspose.Email-for-Java */
                "destination",
                "MapiNoteToPST_out",
                "Outlook",
                "passwordprotectedPST",
                "PersonalStorage",
                "sample",
                "SampleContacts",
                "source",
                "Sub",
                "Sub",
                
                /* epfromer/pst-extractor */
                "enron",
                
                /* farnulfo/pst-exp */
                "sample1",
                "sample2",
                "submessage",
                "test_ansi",
                "test_unicode",
                
                /* custom */
                "backup",
                "backup_with_rules",
                "dist-list",
                "passworded",
                
                /* rhasson/node-libpst */
                "outlook",
                
                /* tghanem/PST */
                "user1@test.lab",
                
                /* vlazar-/sis-pst */
                "goran_fazer@hotmail.com",
            ] {
                let data = try getData(name: name)
                let pst = try PstFile(data: data)
                DumpPstFileTests.dump(file: pst)
            }
        }
    }
}
