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

    func dumpAttachment(accessor: String, attachment: PstFile.Attachment) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! attachment.properties.getAllProperties(), namedProperties: attachment.file.namedProperties?.properties)
        
        if !attachment.hasDetails {
            s += "{\n"
            s += "let attachmentDetails = try \(accessor).getAttachmentDetails()"
            s += dumpAttachment(accessor: "attachmentDetails", attachment: try! attachment.getAttachmentDetails())
            s += "}\n"
        }

        return s
    }
    
    func dumpRecipient(accessor: String, recipient: PstFile.Recipient) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! recipient.properties.getAllProperties(), namedProperties: recipient.file.namedProperties?.properties)

        return s
    }

    func dumpMessage(accessor: String, message: PstFile.Message) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! message.properties.getAllProperties(), namedProperties: message.file.namedProperties?.properties)

        s += "XCTAssertEqual(\(message.attachments.count), \(accessor).attachments.count)\n"
        if message.attachments.count > 0 {
            for (offset, attachment) in message.attachments.enumerated() {
                s += dumpAttachment(accessor: "\(accessor).attachments[\(offset)]", attachment: attachment)
                s += "\n"
            }
        }
        
        s += "XCTAssertEqual(\(message.recipients.count), \(accessor).recipients.count)\n"
        if message.recipients.count > 0 {
            for (offset, recipient) in message.recipients.enumerated() {
                s += dumpRecipient(accessor: "\(accessor).recipients[\(offset)]", recipient: recipient)
                s += "\n"
            }
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

    func dumpFolder(accessor: String, folder: PstFile.Folder) -> String {
        var s = ""

        s += propertiesTestString(accessor: accessor, properties: try! folder.properties.getAllProperties(), namedProperties: folder.file.namedProperties?.properties)

        s += "do {\n"
        let messages = try! folder.getMessages()
        s += "let messages = try \(accessor).getMessages()\n"
        s += "XCTAssertEqual(\(messages.count), messages.count)\n"

        if messages.count > 0 {
            for (offset, message) in messages.enumerated() {
                s += dumpMessage(accessor: "messages[\(offset)]", message: message)
            }
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

    func dumpFile(pst: PstFile) {
        var s = "XCTAssertNotNil(pst.rootFolder)\n"
        
        s += dumpFolder(accessor: "pst.rootFolder!", folder: pst.rootFolder!)

        print(s)
    }

    func testDumper() throws {
        do {
            for name in [
                "simiden/pst2john/97_outlook_qwerty12345",
                "hughbe/pstreadertests@outlook.com.ost",
                "hughbe/pstreadertests@outlook.com.pst",
                "rjohnsondev/java-libpst/example-2013",
                "simiden/pst2john/2k_outlook_qwerty1234",
                "simiden/pst2john/97_outlook_pass12345",
                "simiden/pst2john/2003_compressable-encryption_quickbrownfox",
                "simiden/pst2john/2003_compressable-encryption_quickquick",
                "simiden/pst2john/2003_high-encryption_quickbrownfox3",
                "simiden/pst2john/2003_high-encryption_quickquick",
                "simiden/pst2john/2003_high-encryption_quickquick",
                "simiden/pst2john/2003_no-encryption_quickquick",
                "simiden/pst2john/2003_no-encryption_quickquick12",
                "simiden/pst2john/2003_outlook-high-encryption_cheechNchong",
                "simiden/pst2john/2007_default_a1sellers",
                "simiden/pst2john/2007_default_orxgnm",
                "simiden/pst2john/openwall",
                "simiden/pst2john/Outlook_enc",
                "simiden/pst2john/password",
                "aranetic/process-pst/flags_jane_doe",
                "aranetic/process-pst/flags_john_doe",
                "aranetic/process-pst/four_nesting_levels",
                "aranetic/process-pst/multiple_to_cc",
                "aranetic/process-pst/unsent_email",
                "ic4f/pluto/albert_meyers_000_1_1",
                "EDRM Enron Email Data Set/sample",
                "DFRWS 2009 Rodeo/DFRWS2009-Outlook-Email",
                "aspose-email/Aspose.Email-for-Java/destination",
                "aspose-email/Aspose.Email-for-Java/MapiNoteToPST_out",
                "aspose-email/Aspose.Email-for-Java/Outlook",
                "aspose-email/Aspose.Email-for-Java/passwordprotectedPST",
                "aspose-email/Aspose.Email-for-Java/PersonalStorage",
                "aspose-email/Aspose.Email-for-Java/sample",
                "aspose-email/Aspose.Email-for-Java/SampleContacts",
                "aspose-email/Aspose.Email-for-Java/source",
                "aspose-email/Aspose.Email-for-Java/Sub",
                "aspose-email/Aspose.Email-for-Java/Sub",
                "epfromer/pst-extractor/enron",
                "farnulfo/pst-exp/sample1",
                "farnulfo/pst-exp/sample2",
                "farnulfo/pst-exp/submessage",
                "farnulfo/pst-exp/test_ansi",
                "farnulfo/pst-exp/test_unicode",
                "hughbe/backup",
                "hughbe/backup_with_rules",
                "rjohnsondev/java-libpst/dist-list",
                "rjohnsondev/java-libpst/passworded",
                "rhasson/node-libpst/outlook",
                "tghanem/PST/user1@test.lab",
                "vlazar-/sis-pst/goran_fazer@hotmail.com",
            ] {
                let data = try getData(name: name)
                let pst = try PstFile(data: data)
                dumpFile(pst: pst)
            }
        }
    }
}
