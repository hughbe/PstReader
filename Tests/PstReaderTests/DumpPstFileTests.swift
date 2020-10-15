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
    
    func boolAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! Bool
        if actual {
            return "XCTAssertTrue(\(accessor).\(name)!)\n"
        } else {
            return "XCTAssertFalse(\(accessor).\(name)!)\n"
        }
    }
    func escapeString(string: String) -> String {
        let escaped = string
        var s = ""
        for char in escaped {
            if char == "\u{00}" {
                s += "\\u{00}"
            } else if char == "\u{01}" {
                s += "\\u{01}"
            } else if char == "\"" {
                s += "\\\""
            } else if char == "\\" {
                s += "\\\\"
            } else if char.isLetter || char.isNumber || char.isSymbol || char == " " || char.isPunctuation || char == "\t" {
                s.append(char)
            } else{
                fatalError("NYI")
            }
        }
        
        s = s.replacingOccurrences(of: "\r", with: "\\r")
             .replacingOccurrences(of: "\n", with: "\\n")
        return "\"\(s)\""
    }
    func stringAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! String
        return "XCTAssertEqual(\(escapeString(string: actual)), \(accessor).\(name)!)\n"
    }
    func multipleStringAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! [String]

        var s = ""

        s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
        if actual.count > 0 {
            for (offset, value) in actual.enumerated() {
                s += "XCTAssertEqual(\(escapeString(string: value)), \(accessor).\(name)![\(offset)])\n"
            }
        }

        return s
    }
    func guidAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! UUID
        return "XCTAssertEqual(UUID(uuidString: \"\(actual)\"), \(accessor).\(name)!)\n"
    }
    func int16Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
        let actual = value! as! UInt16
        if hexString {
            return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
        }

        return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
    }
    func int32Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
        let actual = value! as! UInt32

        if hexString {
            return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
        }

        return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
    }
    func int64Assert(value: Any?, accessor: String, name: String, hexString: Bool = false) -> String {
        let actual = value! as! UInt64
        if hexString {
            return "XCTAssertEqual(\(actual.hexString), \(accessor).\(name)!)\n"
        }

        return "XCTAssertEqual(\(actual), \(accessor).\(name)!)\n"
    }
    func dataAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! Data
        return "XCTAssertEqual(\(actual.hexString), [UInt8](\(accessor).\(name)!))\n"
    }
    func multipleDataAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! [Data]

        var s = ""

        s += "XCTAssertEqual(\(actual.count), \(accessor).\(name)!.count)\n"
        if actual.count > 0 {
            for (offset, value) in actual.enumerated() {
                s += "XCTAssertEqual(\(value.hexString), [UInt8](\(accessor).\(name)![\(offset)]))\n"
            }
        }

        return s
    }
    func dateAssert(value: Any?, accessor: String, name: String) -> String {
        let actual = value! as! Date
        return "XCTAssertEqual(\(actual.timeIntervalSince1970), \(accessor).\(name)!.timeIntervalSince1970)\n"
    }
    func xidAssert(value: Any?, accessor: String, name: String) -> String {
        var dataStream = DataStream(data: value as! Data)
        let actual = try! XID(dataStream: &dataStream, size: dataStream.count)

        var s = ""

        s += "XCTAssertEqual(UUID(uuidString: \"\(actual.namespaceGuid)\"), \(accessor).\(name)!.namespaceGuid)\n"
        s += "XCTAssertEqual(\(actual.localId.hexString), \(accessor).\(name)!.localId)\n"

        return s
    }
    func enumAssert<T>(value: Any?, accessor: String, name: String, caseNames: [(T, String)]) -> String where T: RawRepresentable, T.RawValue: Equatable {
        guard let actual = T(rawValue: value as! T.RawValue) else {
            return "XCTAssertNil(\(accessor).\(name))\n"
        }

        let caseName = caseNames.first(where: { $0.0 == actual })!.1
        return "XCTAssertEqual(\(caseName), \(accessor).\(name)!)\n"
    }
    func optionSetAssert<T>(value: Any?, accessor: String, name: String, type: T.Type, caseNames: [(T.Element, String)]) -> String where T: OptionSet, T.RawValue: FixedWidthInteger {
        let actual = T(rawValue: value as! T.RawValue)!

        var strings: [String] = []
        for enumCase in caseNames {
            if actual.contains(enumCase.0) {
                strings.append(enumCase.1)
            }
        }

        let caseNames = "[\(strings.joined(separator: ", "))]"
        return "XCTAssertEqual(\(caseNames), \(accessor).\(name))\n"
    }
    func predecessorChangeListAssert(value: Any?, accessor: String, name: String) -> String {
        var dataStream = DataStream(data: value as! Data)
        let actual = try! PredecessorChangeList(dataStream: &dataStream)
        var s = ""

        s += "XCTAssertEqual(\(actual.values.count), \(accessor).\(name)!.values.count)\n"

        if actual.values.count > 0 {
            for (offset, value) in actual.values.enumerated() {
                s += "XCTAssertEqual(UUID(uuidString: \"\(value.namespaceGuid)\"), \(accessor).\(name)!.values[\(offset)].namespaceGuid)\n"
                s += "XCTAssertEqual(\(value.localId.hexString), \(accessor).\(name)!.values[\(offset)].localId)\n"
            }
        }

        return s
    }
    func entryIdAssert(value: Any?, accessor: String, name: String) -> String {
        var dataStream = DataStream(data: value as! Data)
        let actual = try! getEntryID(dataStream: &dataStream)

        if let oneOffEntryId = actual as? OneOffEntryID {
            var s = ""

            s += "XCTAssertEqual(\(oneOffEntryId.flags.hexString), (\(accessor).\(name) as? OneOffEntryID)!.flags)\n"
            s += "XCTAssertEqual(UUID(uuidString: \"\(oneOffEntryId.providerUid)\"), (\(accessor).\(name) as? OneOffEntryID)!.providerUid)\n"
            s += "XCTAssertEqual(\(oneOffEntryId.version.hexString), (\(accessor).\(name) as? OneOffEntryID)!.version)\n"
            s += "XCTAssertEqual(\(oneOffEntryId.entryFlags.stringRepresentation(cases: OneOffEntryFlags.caseNames)), (\(accessor).\(name) as? OneOffEntryID)!.entryFlags)\n"
            s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.displayName)), (\(accessor).\(name) as? OneOffEntryID)!.displayName)\n"
            s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.addressType)), (\(accessor).\(name) as? OneOffEntryID)!.addressType)\n"
            s += "XCTAssertEqual(\(escapeString(string: oneOffEntryId.emailAddress)), (\(accessor).\(name) as? OneOffEntryID)!.emailAddress)\n"

            return s
        } else if let addressBookEntryID = actual as? AddressBookEntryID {
            var s = ""

            s += "XCTAssertEqual(\(addressBookEntryID.flags.hexString), (\(accessor).\(name) as? AddressBookEntryID)!.flags)\n"
            s += "XCTAssertEqual(UUID(uuidString: \"\(addressBookEntryID.providerUid)\"), (\(accessor).\(name) as? AddressBookEntryID)!.providerUid)\n"
            s += "XCTAssertEqual(\(addressBookEntryID.version.hexString), (\(accessor).\(name) as? AddressBookEntryID)!.version)\n"
            s += "XCTAssertEqual(\(addressBookEntryID.type.stringRepresentation(cases: AddressBookEntryType.caseNames)), (\(accessor).\(name) as? AddressBookEntryID)!.type)\n"
            s += "XCTAssertEqual(\(escapeString(string: addressBookEntryID.x500DN)), (\(accessor).\(name) as? AddressBookEntryID)!.x500DN)\n"

            return s
        }
        
        fatalError("NYI: \(type(of: actual))")
    }
    func conversationIndexAssert(value: Any?, accessor: String, name: String) -> String {
        var dataStream = DataStream(data: value as! Data)
        let actual = try! ConversationIndex(dataStream: &dataStream)

        var s = ""

        s += "XCTAssertEqual(\(actual.header.reserved.hexString), \(accessor).\(name)!.header.reserved)\n"
        s += "XCTAssertEqual(\(actual.header.currentFileTime.0.hexString), \(accessor).\(name)!.header.currentFileTime.0)\n"
        s += "XCTAssertEqual(\(actual.header.currentFileTime.1.hexString), \(accessor).\(name)!.header.currentFileTime.1)\n"
        s += "XCTAssertEqual(\(actual.header.currentFileTime.2.hexString), \(accessor).\(name)!.header.currentFileTime.2)\n"
        s += "XCTAssertEqual(\(actual.header.currentFileTime.3.hexString), \(accessor).\(name)!.header.currentFileTime.3)\n"
        s += "XCTAssertEqual(\(actual.header.currentFileTime.4.hexString), \(accessor).\(name)!.header.currentFileTime.4)\n"
        s += "XCTAssertEqual(UUID(uuidString: \"\(actual.header.guid)\"), \(accessor).\(name)!.header.guid)\n"
        s += "XCTAssertEqual(\(actual.responseLevels.count), \(accessor).\(name)!.responseLevels.count)\n"

        if actual.responseLevels.count > 0 {
            for (offset, responseLevel) in actual.responseLevels.enumerated() {
                s += "XCTAssertEqual(\(responseLevel.dcAndDeltaTime.hexString), \(accessor).\(name)!.responseLevels[\(offset)].dcAndDeltaTime)\n"
                s += "XCTAssertEqual(\(responseLevel.random.hexString), \(accessor).\(name)!.responseLevels[\(offset)].random)\n"
            }
        }

        return s
    }
    func unknownAssert(value: Any?, accessor: String, name: String) -> String {
        let fullName = "getProperty(id: .\(name))"
        guard let value = value else {
            return "XCTAssertNil(\(accessor).\(fullName))"
        }

        if type(of: value) == String.self {
            return stringAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as String?)")
        } else if type(of: value) == Bool.self {
            return boolAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Bool?)")
        } else if type(of: value) == UInt16.self {
            return int16Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt16?)")
        } else if type(of: value) == UInt32.self {
            return int32Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt32?)")
        } else if type(of: value) == UInt64.self {
            return int64Assert(value: value, accessor: "(\(accessor)", name: "\(fullName) as UInt64?)")
        } else if type(of: value) == Data.self {
            return dataAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Data?)")
        } else if type(of: value) == Date.self {
            return dateAssert(value: value, accessor: "(\(accessor)", name: "\(fullName) as Date?)")
        }

        fatalError("NYI: \(type(of: value))")
    }

    func dumpProperties(accessor: String, properties: PropertiesReader) -> String {
        var s = ""

        for prop in try! properties.getAllProperties() {
            switch prop.key {
            case PstPropertyId.tagDisplayName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "displayName")
            case PstPropertyId.tagSubfolders.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "subfolders")
            case PstPropertyId.tagContentCount.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "contentCount")
            case PstPropertyId.tagContentUnreadCount.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "contentUnreadCount")
            case PstPropertyId.tagSearchKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "searchKey")
            case PropertyId.unknown0x7CF9.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7CF9")
            case PropertyId.tagAttributeReadOnly.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "attributeReadOnly")
            case PropertyId.PR_NTSD_MODIFICATION_TIME.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_NTSD_MODIFICATION_TIME")
            case PropertyId.unknown0x123A.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x123A")
            case PropertyId.tagLastModificationTime.rawValue:
                s += dateAssert(value: prop.value, accessor: accessor, name: "lastModificationTime")
            case PropertyId.tagAssociatedContentCount.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "associatedContentCount")
            case PropertyId.tagChangeKey.rawValue:
                s += xidAssert(value: prop.value, accessor: accessor, name: "changeKey")
            case PropertyId.tagCreationTime.rawValue:
                s += dateAssert(value: prop.value, accessor: accessor, name: "creationTime")
            case PropertyId.tagInternetArticleNumber.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagInternetArticleNumber")
            case PropertyId.tagComment.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "comment")
            case PropertyId.tagHierRev.rawValue:
                s += dateAssert(value: prop.value, accessor: accessor, name: "hierRev")
            case PropertyId.PR_SECURE_ORIGINATION.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_SECURE_ORIGINATION")
            case PropertyId.unknown0x7C0E.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0E")
            case PropertyId.tagAttributeHidden.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "attributeHidden")
            case PropertyId.unknown0x7C0F.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0F")
            case PropertyId.tagMessageSize.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "messageSize", hexString: true)
            case PropertyId.unknown0x7CF8.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7CF8")
            case PropertyId.tagContainerClass.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "containerClass")
            case PropertyId.tagDisplayType.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "displayType", caseNames: DisplayType.caseNames)
            case PropertyId.tagPredecessorChangeList.rawValue:
                s += predecessorChangeListAssert(value: prop.value, accessor: accessor, name: "predecessorChangeList")
            case PropertyId.tagRetentionFlags.rawValue:
                s += optionSetAssert(value: prop.value, accessor: accessor, name: "retentionFlags", type: RetentionFlags.self, caseNames: RetentionFlags.caseNames)
            case PropertyId.unknown0x68CB.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x68CB")
            case PropertyId.tagAttributeSystem.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagAttributeSystem")
            case PropertyId.PR_DESIGN_IN_PROGRESS.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_DESIGN_IN_PROGRESS")
            case PropertyId.unknown0x7C0F.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7C0F")
            case PropertyId.unknown0x36F6.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F6")
            case PropertyId.unknown0x365D.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x365D")
            case PropertyId.unknown0x35FF.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35FF")
            case PropertyId.unknown0x35EE.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35EE")
            case PstPropertyId.tagPstHiddenCount.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "pstHiddenCount")
            case PstPropertyId.tagPstHiddenUnread.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "pstHiddenUnread")
            case PropertyId.unknown0x35EF.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35EF")
            case PropertyId.unknown0x35FD.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35FD")
            case PropertyId.tagAdditionalRenEntryIdsEx.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "additionalRenEntryIdsEx")
            case PropertyId.unknown0x36F0.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36F0")
            case PropertyId.unknown0x35E9.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x35E9")
            case PropertyId.tagIpmDraftsEntryId.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "ipmDraftsEntryId")
            case PropertyId.PR_FROM_I_HAVE.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_FROM_I_HAVE")
            case PropertyId.tagAdditionalRenEntryIds.rawValue:
                s += multipleDataAssert(value: prop.value, accessor: accessor, name: "additionalRenEntryIds")
            case PropertyId.unknown0x3646.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3646")
            case PropertyId.tagConversationId.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "conversationId")
            case PropertyId.tagClientSubmitTime.rawValue:
                s += dateAssert(value: prop.value, accessor: accessor, name: "clientSubmitTime")
            case PropertyId.tagMessageToMe.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "messageToMe")
            case PropertyId.tagConversationTopic.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "conversationTopic")
            case PropertyId.tagMessageStatus.rawValue:
                s += optionSetAssert(value: prop.value, accessor: accessor, name: "messageStatus", type: MessageStatus.self, caseNames: MessageStatus.caseNames)
            case PropertyId.tagSensitivity.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "sensitivity", caseNames: MessageSensitivity.caseNames)
            case PropertyId.tagImportance.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "importance", caseNames: MessageImportance.caseNames)
            case PropertyId.tagLtpRowId.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "ltpRowId", hexString: true)
            case PropertyId.tagMessageClass.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "messageClass")
            case PropertyId.tagSubject.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "subject")
            case PropertyId.tagMessageCcMe.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "messageCcMe")
            case PropertyId.tagDisplayTo.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "displayTo")
            case PropertyId.tagDisplayCc.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "displayCc")
            case PropertyId.tagDisplayBcc.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "displayBcc")
            case PropertyId.tagConversationIndex.rawValue:
                s += conversationIndexAssert(value: prop.value, accessor: accessor, name: "conversationIndex")
            case PropertyId.tagLtpRowVer.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "ltpRowVer")
            case PropertyId.tagSentRepresentingName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingName")
            case PropertyId.tagMessageFlags.rawValue:
                s += optionSetAssert(value: prop.value, accessor: accessor, name: "messageFlags", type: MessageFlags.self, caseNames: MessageFlags.caseNames)
            case PropertyId.tagMessageDeliveryTime.rawValue:
                s += dateAssert(value: prop.value, accessor: accessor, name: "messageDeliveryTime")
            case PropertyId.tagParentSourceKey.rawValue:
                s += xidAssert(value: prop.value, accessor: accessor, name: "parentSourceKey")
            case PropertyId.unknown0x36DE.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36DE")
            case PropertyId.tagSourceKey.rawValue:
                s += xidAssert(value: prop.value, accessor: accessor, name: "sourceKey")
            case PropertyId.unknown0x0F00.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F00")
            case PropertyId.tagSecurityDescriptor.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSecurityDescriptor")
            case PropertyId.tagResolveMethod.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "resolveMethod", caseNames: ResolveMethod.caseNames)
            case PropertyId.unknown0x3668.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3668")
            case PropertyId.tagReceivedRepresentingAddressType.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingAddressType")
            case PropertyId.tagMessageRecipientMe.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "messageRecipientMe")
            case PropertyId.unknown0x1213.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x1213")
            case PropertyId.tagMessageLocaleId.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "messageLocaleId")
            case PropertyId.tagReceivedByAddressType.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByAddressType")
            case PropertyId.tagReceivedByName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByName")
            case PropertyId.unknown0x5037.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5037")
            case PropertyId.tagReceivedRepresentingSearchKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingSearchKey")
            case PropertyId.unknown0x3666.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3666")
            case PropertyId.tagSentRepresentingSmtpAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingSmtpAddress")
            case PropertyId.tagSentRepresentingAddressType.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingAddressType")
            case PropertyId.tagSenderEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "senderEntryId")
            case PropertyId.tagCreatorSimpleDisplayName.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagCreatorSimpleDisplayName")
            case PropertyId.tagBodyHtml.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "bodyHtml")
            case PropertyId.tagLastModifierName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "lastModifierName")
            case PropertyId.tagBodyContentId.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "bodyContentId")
            case PropertyId.tagAddressBookObjectDistinguishedName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "addressBookObjectDistinguishedName")
            case PropertyId.unknown0x0E2F.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E2F")
            case PropertyId.unknown0x4025.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4025")
            case PropertyId.tagTransportMessageHeaders.rawValue:
                s += "XCTAssertNotNil(\(accessor).\(name).transportMessageHeaders)\n"
            case PropertyId.unknown0x0F02.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F02")
            case PropertyId.unknown0x0E4C.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E4C")
            case PropertyId.tagSenderAddressType.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderAddressType")
            case PropertyId.tagSenderName.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderName")
            case PropertyId.tagSenderSmtpAddress.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderSmtpAddress")
            case PropertyId.tagInternetMessageId.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagInternetMessageId")
            case PropertyId.unknown0x3014.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3014")
            case PropertyId.tagAddressBookExtensionAttribute3.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "addressBookExtensionAttribute3")
            case PropertyId.tagContentFilterPhishingConfidenceLevel.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagContentFilterPhishingConfidenceLevel")
            case PropertyId.tagParentDisplay.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagParentDisplay")
            case PropertyId.tagLastModifierEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "lastModifierEntryId")
            case PropertyId.tagCreatorAddressType.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagCreatorAddressType")
            case PropertyId.tagNonReceiptNotificationRequested.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "nonReceiptNotificationRequested")
            case PropertyId.tagLastModifierSimpleDisplayName.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagLastModifierSimpleDisplayName")
            case PropertyId.unknown0x4024.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4024")
            case PropertyId.tagReceivedBySearchKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "receivedBySearchKey")
            case PropertyId.tagConversationIndexTracking.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "conversationIndexTracking")
            case PropertyId.tagSenderEmailAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "senderEmailAddress")
            case PropertyId.tagSentRepresentingEmailAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEmailAddress")
            case PropertyId.unknown0x5D0A.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0A")
            case PropertyId.tagReceivedRepresentingSmtpAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingSmtpAddress")
            case PropertyId.tagSenderSearchKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "senderSearchKey")
            case PropertyId.tagReceivedRepresentingEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingEntryId")
            case PropertyId.tagSenderSimpleDisplayName.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSenderSimpleDisplayName")
            case PropertyId.tagAddressBookPublicDelegates.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "addressBookPublicDelegates")
            case PropertyId.unknown0x365A.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x365A")
            case PropertyId.tagCreatorEmailAddress.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagCreatorEmailAddress")
            case PropertyId.tagReceivedRepresentingName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingName")
            case PropertyId.unknown0x4034.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4034")
            case PropertyId.PR_LAST_MODIFIER_SID.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_LAST_MODIFIER_SID")
            case PropertyId.tagMessageCodepage.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "messageCodepage")
            case PropertyId.modifierFlag.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "modifierFlag")
            case PropertyId.tagReceivedByEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "receivedByEntryId")
            case PstPropertyId.tagPstBodyPrefix.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "pstBodyPrefix")
            case PropertyId.tagReceivedRepresentingEmailAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedRepresentingEmailAddress")
            case PropertyId.unknown0x0F0A.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F0A")
            case PropertyId.tagReadReceiptRequested.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "readReceiptRequested")
            case PropertyId.unknown0x120B.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x120B")
            case PropertyId.tagReceivedByEmailAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedByEmailAddress")
            case PropertyId.unknown0x36FA.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x36FA")
            case PropertyId.tagBody.rawValue:
                if prop.value is String {
                    s += stringAssert(value: prop.value, accessor: accessor, name: "body")
                } else {
                    s += dataAssert(value: prop.value, accessor: accessor, name: "nameidBucketBase")
                }
            case PropertyId.tagSentRepresentingSimpleDisplayName.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagSentRepresentingSimpleDisplayName")
            case PropertyId.unknown0x0F03.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0F03")
            case PropertyId.unknown0x0ECD.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0ECD")
            case PropertyId.unknown0x3663.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x3663")
            case PropertyId.tagPriority.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "priority", caseNames: MessagePriority.caseNames)
            case PropertyId.tagSentRepresentingSearchKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "sentRepresentingSearchKey")
            case PropertyId.tagNativeBody.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "nativeBody", caseNames: MessageNativeBody.caseNames)
            case PropertyId.tagSentRepresentingEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEntryId")
            case PropertyId.tagInternetCodepage.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "internetCodepage")
            case PropertyId.tagReceivedBySmtpAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "receivedBySmtpAddress")
            case PropertyId.unknown0x5D0B.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0B")
            case PropertyId.unknown0x4035.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x4035")
            case PropertyId.tagSendRichInfo.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "sendRichInfo")
            case PropertyId.tagAddressType.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "addressType")
            case PropertyId.tagRecordKey.rawValue:
                s += dataAssert(value: prop.value, accessor: accessor, name: "recordKey")
            case PropertyId.tagRecipientEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "recipientEntryId")
            case PropertyId.tagRecipientFlags.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "recipientFlags", caseNames: RecipientFlags.caseNames)
            case PropertyId.tagEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "entryId")
            case PropertyId.tagTransmittableDisplayName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "transmittableDisplayName")
            case PropertyId.tagObjectType.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "objectType", caseNames: ObjectType.caseNames)
            case PropertyId.tagResponsibility.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "responsibility")
            case PropertyId.tagRecipientType.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "recipientType", caseNames: RecipientType.caseNames)
            case PropertyId.tagSmtpAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "smtpAddress")
            case PropertyId.tagEmailAddress.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "emailAddress")
            case PropertyId.tagMessageEditorFormat.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "messageEditorFormat", caseNames: MessageEditorFormat.caseNames)
            case PropertyId.unknown0x0E4B.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x0E4B")
            case PropertyId.tagIconIndex.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "iconIndex")
            case PropertyId.tagSentRepresentingEntryId.rawValue:
                s += entryIdAssert(value: prop.value, accessor: accessor, name: "sentRepresentingEntryId")
            case PropertyId.unknown0x5D0B.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x5D0B")
            case PropertyId.tagOriginatorDeliveryReportRequested.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "originatorDeliveryReportRequested")
            case PropertyId.creatorFlag.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "creatorFlag")
            case PropertyId.tagDeleteAfterSubmit.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "deleteAfterSubmit")
            case PropertyId.tagInternetMailOverrideFormat.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "internetMailOverrideFormat", hexString: true)
            case PropertyId.tagRead.rawValue:
                s += boolAssert(value: prop.value, accessor: accessor, name: "read")
            case PropertyId.unknown0x7D0E.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "unknown0x7D0E")
            case PropertyId.PR_CREATOR_SID.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "PR_CREATOR_SID")
            case PropertyId.tagAlternateRecipientAllowed.rawValue:
                if prop.value is Bool {
                    s += boolAssert(value: prop.value, accessor: accessor, name: "alternateRecipientAllowed")
                } else {
                    s += unknownAssert(value: prop.value, accessor: accessor, name: "tagNameidStreamGuid")
                }
            case PropertyId.tagRecipientOrder.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "recipientOrder")
            case PropertyId.tagRecipientTrackStatus.rawValue:
                s += enumAssert(value: prop.value, accessor: accessor, name: "recipientTrackStatus", caseNames: ResponseStatus.caseNames)
            case PropertyId.tagRecipientDisplayName.rawValue:
                s += stringAssert(value: prop.value, accessor: accessor, name: "recipientDisplayName")
            case PropertyId.tagSendInternetEncoding.rawValue:
                s += int32Assert(value: prop.value, accessor: accessor, name: "sendInternetEncoding")
            case PropertyId.tagRecipientResourceState.rawValue:
                s += unknownAssert(value: prop.value, accessor: accessor, name: "tagRecipientResourceState")
            default:
                if prop.key >= 0x8000 {
                    // TODO: namedProperties
                    continue
                }

                if let propId = PstPropertyId(rawValue: prop.key) {
                    print("UNKNOWN!!: \(propId), value: \(String(describing: prop.value))")
                } else if let propId = PropertyId(rawValue: prop.key) {
                    print("UNKNOWN!!: \(propId), value: \(String(describing: prop.value))")
                } else if prop.key < 0x8000 {
                    fatalError("UNKNOWN \(prop.key.hexString), value: \(String(describing: prop.value))")
                }
            }
        }

        s += "\n"
        return s
    }

    func dumpAttachment(accessor: String, attachment: PstFile.Attachment) -> String {
        var s = ""

        s += dumpProperties(accessor: accessor, properties: attachment.properties)
        
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

        s += dumpProperties(accessor: accessor, properties: recipient.properties)

        return s
    }

    func dumpMessage(accessor: String, message: PstFile.Message) -> String {
        var s = ""

        s += dumpProperties(accessor: accessor, properties: message.properties)

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

        s += dumpProperties(accessor: accessor, properties: folder.properties)

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
            let data = try getData(name: "backup")
            let pst = try PstFile(data: data)
            dumpFile(pst: pst)
        }
    }

    private func getData(name: String) throws -> Data {
        let url = URL(forResource: name, withExtension: "pst")
        return try Data(contentsOf: url)
    }

}
