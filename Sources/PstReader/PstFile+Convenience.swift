//
//  PstFile+Convenience.swift
//
//
//  Convenience extensions for common email-viewer use cases.
//  These wrap the underlying MAPI properties from SwiftMAPI's MessageStorage protocol
//  into a discoverable, grouped API.
//

import Foundation
import MAPI

// MARK: - Message Convenience

extension PstFile.Message {
    /// The email subject line.
    public var subjectText: String? { subject }

    /// Sender's display name (e.g. "John Doe").
    public var senderDisplayName: String? { senderName }

    /// Sender's email address (e.g. "john@example.com").
    public var senderAddress: String? { senderEmailAddress }

    /// Combined sender string: "Name <email>" or just the available part.
    public var senderDisplayString: String? {
        if let name = senderName, let email = senderEmailAddress {
            return "\(name) <\(email)>"
        }
        return senderName ?? senderEmailAddress
    }

    /// When the message was delivered.
    public var date: Date? { messageDeliveryTime }

    /// Plain text body content.
    public var bodyText: String? { body }

    /// HTML body content as a string (decoded from the raw Data).
    public var bodyHtmlString: String? {
        guard let data = bodyHtml else { return nil }
        return String(data: data, encoding: .utf8) ?? String(data: data, encoding: .utf16)
    }

    /// Whether this message has file attachments.
    public var hasFileAttachments: Bool { hasAttachments ?? false }

    /// Number of attachments currently loaded into this message
    /// (requires `getMessageDetails()` to have been called).
    public var loadedAttachmentCount: Int { attachments.count }

    /// To recipients display string.
    public var toRecipients: String? { displayTo }

    /// CC recipients display string.
    public var ccRecipients: String? { displayCc }

    /// BCC recipients display string.
    public var bccRecipients: String? { displayBcc }

    /// Message size in bytes.
    public var sizeInBytes: UInt32? { messageSize }
}

// MARK: - Folder Convenience

extension PstFile.Folder {
    /// The folder's display name.
    public var name: String? { displayName }

    /// Number of emails in this folder.
    public var emailCount: UInt32? { contentCount }

    /// Number of unread emails.
    public var unreadCount: UInt32? { contentUnreadCount }

    /// Whether this folder has subfolders.
    public var hasSubfolders: Bool { subfolders ?? false }
}

// MARK: - Attachment Convenience

extension PstFile.Attachment {
    /// The filename (prefers long filename, falls back to short 8.3 name).
    public var filename: String? { attachLongFilename ?? attachFilename }

    /// The attachment's binary data (requires `getAttachmentDetails()` to have been called).
    public var fileData: Data? { attachDataBinary }

    /// The attachment size in bytes.
    public var sizeInBytes: UInt32? { attachSize }

    /// The MIME type of the attachment (e.g. "application/pdf").
    public var mimeType: String? { attachMimeTag }
}

// MARK: - Recipient Convenience

extension PstFile.Recipient {
    /// The recipient's display name.
    public var name: String? { displayName }

    /// The recipient's email address.
    public var address: String? { emailAddress }

    /// The recipient type (To, CC, BCC).
    public var type: RecipientType? { recipientType }
}
