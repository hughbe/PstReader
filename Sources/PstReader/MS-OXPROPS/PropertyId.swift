//
//  PropertyId.swift
//
//
//  Created by Hugh Bellamy on 27/09/2020.
//

public enum PropertyId: UInt16 {
    /// [MS-OXPROPS] 2.1042 PidTagTemplateData
    /// Canonical name: PidTagTemplateData
    /// Description: Describes the controls used in the template that is used to retrieve address book
    /// information.
    /// Property ID: 0x0001
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABKT] section 2.2.2
    /// Alternate names: PR_EMS_TEMPLATE_BLOB
    case tagTemplateData = 0x0001

    /// [MS-OXPROPS] 2.577 PidTagAlternateRecipientAllowed
    /// Canonical name: PidTagAlternateRecipientAllowed
    /// Description: Specifies whether the sender permits the message to be auto-forwarded.
    /// Property ID: 0x0002
    /// Data type: PtypBoolean, 0x000B
    /// Area: Address Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.36
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXODOC], [MS-OXTNEF]
    /// Alternate names: PR_ALTERNATE_RECIPIENT_ALLOWED, ptagAlternateRecipientAllowed
    case tagAlternateRecipientAllowed = 0x0002

    /// PidTagAcknowledgementMode
    /// Not documented in specification but known on internet
    /// Contains the identifier of the mode for message acknowledgment.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagacknowledgementmode-canonical-property
    case tagAcknowledgementMode = 0x0003

    /// [MS-OXPROPS] 2.613 PidTagAutoForwardComment
    /// Canonical name: PidTagAutoForwardComment
    /// Description: Contains text included in an automatically-generated message.
    /// Property ID: 0x0004
    /// Data type: PtypString, 0x001F
    /// Area: General Report Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.21
    /// Alternate names: PR_AUTO_FORWARD_COMMENT, PR_AUTO_FORWARD_COMMENT_A,
    /// PR_AUTO_FORWARD_COMMENT_W
    case tagAutoForwardComment = 0x0004

    /// [MS-OXPROPS] 2.614 PidTagAutoForwarded
    /// Canonical name: PidTagAutoForwarded
    /// Description: Indicates that a Message object has been automatically generated or automatically
    /// forwarded.
    /// Property ID: 0x0005
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Report Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.20
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_AUTO_FORWARDED, ptagAutoForwarded
    case tagAutoForwarded = 0x0005

    /// PidTagContentConfidentialityAlgorithmId
    /// Not documented in specification but known on internet
    /// Contains an identifier for the algorithm used to confirm message content confidentiality.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagcontentconfidentialityalgorithmid-canonical-property
    case tagContentConfidentialityAlgorithmId = 0x0006

    /// PidTagContentCorrelator
    /// Not documented in specification but known on internet
    /// Contains a value the message sender can use to match a report with the original message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentcorrelator-canonical-property
    case tagContentCorrelator = 0x0007

    /// PidTagContentIdentifier
    /// Not documented in specification but known on internet
    /// Contains a key value that enables the message recipient to identify its content.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentidentifier-canonical-property
    case tagContentIdentifier = 0x0008

    /// PidTagContentLength
    /// Not documented in specification but known on internet
    /// Contains a message length, in bytes, passed to a client application or service provider to determine if a message of that length can be delivered.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontentlength-canonical-property
    case tagContentLength = 0x0009

    /// PidTagConversationKey
    /// Not documented in specification but known on internet
    /// Contains the conversation key used in Microsoft Outlook only when locating IPM.MessageManager messages, such as the message that contains download history for a Post Office Protocol (POP3) account. This property has been deprecated in Microsoft Exchange Server.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversationkey-canonical-property
    case tagConversationKey = 0x000B

    /// PidTagConversionEits
    /// Not documented in specification but known on internet
    /// Contains the encoded information types (EITs) that are applied to a message in transit to describe conversions.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversioneits-canonical-property
    case tagConversionEits = 0x000C

    /// PidTagConversionWithLossProhibited
    /// Not documented in specification but known on internet
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from making message text conversions that lose information.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversionwithlossprohibited-canonical-property
    case tagConversionWithLossProhibited = 0x000D

    /// PidTagConvertedEits
    /// Not documented in specification but known on internet
    /// Contains an identifier for the types of text in a message after conversion.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconvertedeits-canonical-property
    case tagConvertedEits = 0x000E

    /// [MS-OXPROPS] 2.662 PidTagDeferredDeliveryTime
    /// Canonical name: PidTagDeferredDeliveryTime
    /// Description: Contains the date and time, in UTC, at which the sender prefers that the message be
    /// delivered.
    /// Property ID: 0x000F
    /// Data type: PtypTime, 0x0040
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.6
    /// Alternate names: PR_DEFERRED_DELIVERY_TIME, ptagDeferredDeliveryTime,
    /// http://schemas.microsoft.com/exchange/deferred-delivery-iso
    case tagDeferredDeliveryTime = 0x000F

    /// [MS-OXPROPS] 2.671 PidTagDeliverTime
    /// Canonical name: PidTagDeliverTime
    /// Description: Contains the delivery time for a delivery status notification, as specified [RFC3464], or a
    /// message disposition notification, as specified in [RFC3798].
    /// Property ID: 0x0010
    /// Data type: PtypTime, 0x0040
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.29
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_DELIVER_TIME, ptagDeliverTime
    case tagDeliverTime = 0x0010

    /// PidTagDiscardReason
    /// Not documented in specification but known on internet
    /// Contains a reason why a message transfer agent (MTA) has discarded a message.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagdiscardreason-canonical-property
    case tagDiscardReason = 0x0011

    /// PidTagDisclosureOfRecipients
    /// Not documented in specification but known on internet
    /// Contains TRUE if disclosure of recipients is allowed.
    /// https://docs.microsoft.com/en-ie/office/client-developer/outlook/mapi/pidtagdisclosureofrecipients-canonical-property
    case tagDisclosureOfRecipients = 0x0012

    /// PidTagDistributionListExpansionHistory
    /// Not documented in specification but known on internet
    /// Contains a history showing how a distribution list has been expanded during message transmission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdistributionlistexpansionhistory-canonical-property
    case tagDistributionListExpansionHistory = 0x0013

    /// PidTagDistributionListExpansionProhibited
    /// Not documented in specification but known on internet
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from expanding distribution lists.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdistributionlistexpansionprohibited-canonical-property
    case tagDistributionListExpansionProhibited = 0x0014

    /// [MS-OXPROPS] 2.689 PidTagExpiryTime
    /// Canonical name: PidTagExpiryTime
    /// Description: Contains the time, in UTC, after which a client wants to receive an expiry event if the
    /// message arrives late.
    /// Property ID: 0x0015
    /// Data type: PtypTime, 0x0040
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.3.7
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_EXPIRY_TIME, ptagExpiryTime, urn:schemas:httpmail:expiry-date,
    /// http://schemas.microsoft.com/exchange/expiry-date-iso
    case tagExpiryTime = 0x0015

    /// PidTagImplicitConversionProhibited
    /// Not documented in specification but known on internet
    /// Contains TRUE if a message transfer agent (MTA) is prohibited from making implicit message text conversions.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagimplicitconversionprohibited-canonical-property
    case tagImplicitConversionProhibited = 0x0016

    /// [MS-OXPROPS] 2.738 PidTagImportance
    /// Canonical name: PidTagImportance
    /// Description: Indicates the level of importance assigned by the end user to the Message object.
    /// Property ID: 0x0017
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.11
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXOCFG], [MS-OXODOC], [MS-OXOMSG], [MS-OXTNEF]
    /// Alternate names: PR_IMPORTANCE, ptagImportance, urn:schemas:httpmail:importance,
    /// http://schemas.microsoft.com/exchange/importance-long, http://schemas.microsoft.com/exchange/xpriority-long
    case tagImportance = 0x0017

    /// PidTagLatestDeliveryTime
    /// Not documented in specification but known on internet
    /// Contains the latest date and time when a message transfer agent (MTA) should deliver a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaglatestdeliverytime-canonical-property
    case tagLatestDeliveryTime = 0x0019

    /// [MS-OXPROPS] 2.787 PidTagMessageClass
    /// Canonical name: PidTagMessageClass
    /// Description: Denotes the specific type of the Message object.
    /// Property ID: 0x001A
    /// Data type: PtypString, 0x001F
    /// Area: Common Property set
    /// Defining reference: [MS-OXCMSG] section 2.2.1.3
    /// Consuming references: [MS-OXCFOLD], [MS-OXODLGT], [MS-OXCDATA], [MS-OXCFXICS], [MSOXBBODY], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXCROPS], [MS-OXOCAL], [MS-OXOCFG], [MSOXOCNTC], [MS-OXODOC], [MS-OXOJRNL], [MS-OXOMSG], [MS-OXONOTE], [MS-OXOPFFB], [MSOXOPOST], [MS-OXORMDR], [MS-OXORSS], [MS-OXORULE], [MS-OXOSFLD], [MS-OXOSMIME], [MSOXOSMMS], [MS-OXOSRCH], [MS-OXOTASK], [MS-OXOUM], [MS-OXSHARE], [MS-OXTNEF], [MSXWDCAL]
    /// Alternate names: PR_MESSAGE_CLASS, PR_MESSAGE_CLASS_A, ptagMessageClass,
    /// PR_MESSAGE_CLASS_W,
    /// http://schemas.microsoft.com/exchange/outlookmessageclasshttp://schemas.microsoft.com/exchange/outlookmessageclass
    case tagMessageClass = 0x001A

    /// PidTagMessageDeliveryId
    /// Not documented in specification but known on internet
    /// Contains a message transfer system (MTS) identifier for a message delivered to a client application.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagedeliveryid-canonical-property
    case tagMessageDeliveryId = 0x001B

    /// PidTagMessageSecurityLabel
    /// Not documented in specification but known on internet
    /// Contains a security label for a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagesecuritylabel-canonical-property
    case tagMessageSecurityLabel = 0x001E

    /// PidTagOriginalEits
    /// Not documented in specification but known on internet
    /// Contains a copy of the original encoded information types (EITs) for message text.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaleits-canonical-property
    case tagOriginalEits = 0x0021

    /// PidTagOriginatorCertificate
    /// Not documented in specification but known on internet
    /// Contains an ASN.1 certificate for the message originator.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatorcertificate-canonical-property
    case tagOriginatorCertificate = 0x0022

    /// [MS-OXPROPS] 2.845 PidTagOriginatorDeliveryReportRequested
    /// Canonical name: PidTagOriginatorDeliveryReportRequested
    /// Description: Indicates whether an email sender requests an email delivery receipt from the
    /// messaging system.
    /// Property ID: 0x0023
    /// Data type: PtypBoolean, 0x000B
    /// Area: MIME Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.20
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOTASK], [MSOXTNEF]
    /// Alternate names: PR_ORIGINATOR_DELIVERY_REPORT_REQUESTED,
    /// http://schemas.microsoft.com/exchange/deliveryreportrequested
    case tagOriginatorDeliveryReportRequested = 0x0023

    /// PidTagOriginatorReturnAddress
    /// Not documented in specification but known on internet
    /// Contains the binary-encoded return address of the message originator.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatorreturnaddress-canonical-property
    case tagOriginatorReturnAddress = 0x0024

    /// [MS-OXPROPS] 2.860 PidTagParentKey
    /// Canonical name: PidTagParentKey
    /// Description: Contains the search key that is used to correlate the original message and the reports
    /// about the original message.
    /// Property ID: 0x0025
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.18
    /// Alternate names: PR_PARENT_KEY, ptagParentKey
    case tagParentKey = 0x0025

    /// [MS-OXPROPS] 2.871 PidTagPriority
    /// Canonical name: PidTagPriority
    /// Description: Indicates the client's request for the priority with which the message is to be sent by the
    /// messaging system.
    /// Property ID: 0x0026
    /// Data type: PtypInteger32, 0x0003
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.12
    /// Consuming references: [MS-OXCFXICS], [MS-OXOPOST], [MS-OXOTASK], [MS-OXOCNTC], [MSOXCMAIL], [MS-OXORMMS], [MS-OXODOC], [MS-OXONOTE], [MS-OXOJRNL], [MS-XWDCAL]
    /// Alternate names: PR_PRIORITY, ptagPriority, urn:schemas:httpmail:priority,
    /// urn:schemas:httpmail:priority
    case tagPriority = 0x0026

    /// PidTagOriginCheck
    /// Not documented in specification but known on internet
    /// Contains a binary verification value that enables a delivery report recipient to verify the origin of the original message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagorigincheck-canonical-property
    case tagOriginCheck = 0x0027

    /// PidTagProofOfSubmissionRequested
    /// Not documented in specification but known on internet
    /// Contains an ASN.1 proof of submission value.
    /// https://docs.microsoft.com/en-nz/office/client-developer/outlook/mapi/pidtagproofofsubmissionrequested-canonical-property
    case tagProofOfSubmissionRequested = 0x0028

    /// [MS-OXPROPS] 2.883 PidTagReadReceiptRequested
    /// Canonical name: PidTagReadReceiptRequested
    /// Description: Specifies whether the email sender requests a read receipt from all recipients when
    /// this email message is read or opened.
    /// Property ID: 0x0029
    /// Data type: PtypBoolean, 0x000B
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.29
    /// Consuming references: [MS-OXCMAIL], [MS-OXODOC], [MS-OXOTASK], [MS-OXOJRNL], [MSOXOPOST], [MS-OXORMMS], [MS-OXOCNTC], [MS-OXONOTE]
    /// Alternate names: PR_READ_RECEIPT_REQUESTED, ptagReadReceiptRequested,
    /// http://schemas.microsoft.com/exchange/readreceiptrequested
    case tagReadReceiptRequested = 0x0029

    /// [MS-OXPROPS] 2.886 PidTagReceiptTime
    /// Canonical name: PidTagReceiptTime
    /// Description: Contains the sent time for a message disposition notification, as specified in [RFC3798].
    /// Property ID: 0x002A
    /// Data type: PtypTime, 0x0040
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.33
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_RECEIPT_TIME, ptagReceiptTime
    case tagReceiptTime = 0x0002A

    /// [MS-OXPROPS] 2.906 PidTagRecipientReassignmentProhibited
    /// Canonical name: PidTagRecipientReassignmentProhibited
    /// Description: Specifies whether adding additional or different recipients is prohibited for the email
    /// message when forwarding the email message.
    /// Property ID: 0x002B
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.42
    /// Alternate names: PR_RECIPIENT_REASSIGNMENT_PROHIBITED,
    /// ptagRecipientReassignmentProhibited
    case tagRecipientReassignmentProhibited = 0x002B

    /// PidTagRedirectionHistory
    /// Not documented in specification but known on internet
    /// Contains information about the route covered by a delivered message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagredirectionhistory-canonical-property
    case tagRedirectionHistory = 0x002C

    /// PidTagRelatedMessageIds
    /// Not documented in specification but known on internet
    /// Contains a list of identifiers for messages to which a message is related.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrelatedmessageids-canonical-property
    case tagRelatedMessageIds = 0x002D

    /// [MS-OXPROPS] 2.837 PidTagOriginalSensitivity
    /// Canonical name: PidTagOriginalSensitivity
    /// Description: Contains the sensitivity value of the original email message.
    /// Property ID: 0x002E
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.22
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: PR_ORIGINAL_SENSITIVITY, ptagOriginalSensitivity
    case tagOriginalSensitivity = 0x002E

    /// PidTagLanguages
    /// Not documented in specification but known on internet
    /// Contains an ASCII list of the languages that are incorporated in a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaglanguages-canonical-property
    case tagLanguages = 0x002F

    /// PidTagReplyTime
    /// Not documented in specification but known on internet
    /// Contains the deadline on a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreplytime-canonical-property
    case tagReplyTime = 0x0030

    /// [MS-OXPROPS] 2.926 PidTagReportTag
    /// Canonical name: PidTagReportTag
    /// Description: Contains the data that is used to correlate the report and the original message.
    /// Property ID: 0x0031
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.22
    /// Alternate names: PR_REPORT_TAG, ptagReportTag
    case tagReportTag = 0x0031

    /// [MS-OXPROPS] 2.928 PidTagReportTime
    //// Canonical name: PidTagReportTime
    //// Description: Indicates the last time that the contact list that is controlled by the
    //// PidTagJunkIncludeContacts property (section 2.758) was updated.
    //// Property ID: 0x0032
    //// Data type: PtypTime, 0x0040
    //// Area: MapiEnvelope Property set
    //// Defining reference: [MS-OXCSPAM] section 2.2.2.6
    //// Alternate names: PR_REPORT_TIME, ptagReportTime,
    //// http://schemas.microsoft.com/exchange/reporttime
    case tagReportTime = 0x0032

    /// PidTagReturnedMessageid
    /// Not documented in specification but known on internet
    /// Contains TRUE if the original message is being returned with a nonread report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreturnedmessageid-canonical-property
    case tagReturnedMessageId = 0x0033

    /// Not documented in specification but known on internet
    /// Message API (MAPI) definitions.pdf
    case tagSecurity = 0x0034

    /// PidTagIncompleteCopy
    /// Not documented in specification but known on internet
    /// Contains TRUE if this message is an incomplete copy of another message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagincompletecopy-canonical-property
    case tagIncompleteCopy = 0x0035

    /// [MS-OXPROPS] 2.1010 PidTagSensitivity
    /// Canonical name: PidTagSensitivity
    /// Description: Indicates the sender's assessment of the sensitivity of the Message object.
    /// Property ID: 0x0036
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.13
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOMSG], [MSOXTNEF], [MS-OXOCAL], [MS-OXODLGT], [MS-OXVCARD], [MS-OXWAVLS], [MS-XWDCAL], [MSOXOJRNL], [MS-OXOCNTC], [MS-OXONOTE], [MS-OXOPOST], [MS-OXORMMS]
    /// Alternate names: PR_SENSITIVITY, ptagSensitivity,
    /// http://schemas.microsoft.com/exchange/sensitivity-long,
    /// http://schemas.microsoft.com/exchange/sensitivity
    case tagSensitivity = 0x0036

    /// [MS-OXPROPS] 2.1033 PidTagSubject
    /// Canonical name: PidTagSubject
    /// Description: Contains the subject of the email message.
    /// Property ID: 0x0037
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.46
    /// Consuming references: [MS-OXCICAL], [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOCNTC], [MSOXOPFFB], [MS-OXTNEF], [MS-OXCDATA], [MS-OXCSPAM], [MS-OXCTABL], [MS-OXMSG], [MSOXOCFG], [MS-OXOJRNL], [MS-OXORULE], [MS-OXPSVAL], [MS-OXWAVLS], [MS-XWDCAL]
    /// Alternate names: PR_SUBJECT, PR_SUBJECT_A, ptagSubject, PR_SUBJECT_W,
    /// urn:schemas:httpmail:subject, http://schemas.microsoft.com/exchange/subject-utf8
    case tagSubject = 0x0037

    /// [MS-OXPROPS] 2.635 PidTagClientSubmitTime
    /// Canonical name: PidTagClientSubmitTime
    /// Description: Contains the current time, in UTC, when the email message is submitted.
    /// Property ID: 0x0039
    /// Data type: PtypTime, 0x0040
    /// Area: Message Time Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.3.11
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXODOC], [MSOXORSS], [MS-OXTNEF]
    /// Alternate names: PR_CLIENT_SUBMIT_TIME, urn:schemas:httpmail:date,
    /// http://schemas.microsoft.com/exchange/date-iso
    case tagClientSubmitTime = 0x0039

    /// [MS-OXPROPS 2.924 PidTagReportName
    /// Canonical name: PidTagReportName
    /// Description: Contains the display name for the entity (usually a server agent) that generated the
    /// report message.
    /// Property ID: 0x003A
    /// Data type: PtypString, 0x001F
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.20
    /// Alternate names: PR_REPORT_NAME, PR_REPORT_NAME_A, PR_REPORT_NAME_W
    case tagReportName = 0x003A

    /// [MS-OXPROPS] 2.1017 PidTagSentRepresentingSearchKey
    /// Canonical name: PidTagSentRepresentingSearchKey
    /// Description: Contains a binary-comparable key that represents the end user who is represented by
    /// the sending mailbox owner.
    /// Property ID: 0x003B
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.58
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCAL], [MS-OXOPOST], [MS-OXOTASK]
    /// Alternate names: PR_SENT_REPRESENTING_SEARCH_KEY, ptagSentRepresentingSearchKey
    case tagSentRepresentingSearchKey = 0x003B

    /// PidTagX400ContentType
    /// Not documented in specification but known on internet
    /// This property contains the content type for a submitted message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagx400contenttype-canonical-property
    case tagX400ContentType = 0x003C

    /// [MS-OXPROPS] 2.1034 PidTagSubjectPrefix
    /// Canonical name: PidTagSubjectPrefix
    /// Description: Contains the prefix for the subject of the message.
    /// Property ID: 0x003D
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.9
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXCPRPT], [MS-OXOCAL], [MSOXOCNTC], [MS-OXODLGT], [MS-OXONOTE], [MS-OXOPFFB], [MS-OXOPOST], [MS-OXORSS], [MSOXOSMMS], [MS-OXSHARE], [MS-OXTNEF]
    /// Alternate names: PR_SUBJECT_PREFIX, PR_SUBJECT_PREFIX_A, ptagSubjectPrefix,
    /// PR_SUBJECT_PREFIX_W
    case tagSubjectPrefix = 0x003D

    /// PidTagNonReceiptReason
    /// Not documented in specification but known on internet
    /// Contains reasons why a message was not received that forms part of a non-delivery report.
    /// https://docs.microsoft.com/en-nz/office/client-developer/outlook/mapi/pidtagnonreceiptreason-canonical-property
    case tagNonReceiptReason = 0x003E

    /// [MS-OXPROPS] 2.889 PidTagReceivedByEntryId
    /// Canonical name: PidTagReceivedByEntryId
    /// Description: Contains the address book EntryID of the mailbox receiving the Email object.
    /// Property ID: 0x003F
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.38
    /// Alternate names: PR_RECEIVED_BY_ENTRYID
    case tagReceivedByEntryId = 0x003F

    /// [MS-OXPROPS] 2.890 PidTagReceivedByName
    /// Canonical name: PidTagReceivedByName
    /// Description: Contains the email message receiver's display name.
    /// Property ID: 0x0040
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.39
    /// Alternate names: PR_RECEIVED_BY_NAME, PR_RECEIVED_BY_NAME_A,
    /// PR_RECEIVED_BY_NAME_W
    case tagReceivedByName = 0x0040

    /// [MS-OXPROPS] 2.1014 PidTagSentRepresentingEntryId
    /// Canonical name: PidTagSentRepresentingEntryId
    /// Description: Contains the identifier of the end user who is represented by the sending mailbox
    /// owner.
    /// Property ID: 0x0041
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.56
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOCAL], [MSOXODLGT], [MS-OXOPOST], [MS-OXOTASK], [MS-OXTNEF]
    /// Alternate names: PR_SENT_REPRESENTING_ENTRYID, ptagSentRepresentingEntryId
    case tagSentRepresentingEntryId = 0x0041

    /// [MS-OXPROPS] 2.1016 PidTagSentRepresentingName
    /// Canonical name: PidTagSentRepresentingName
    /// Description: Contains the display name for the end user who is represented by the sending
    /// mailbox owner.
    /// Property ID: 0x0042
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.57
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOCAL], [MS-OXOCFG], [MSOXODLGT], [MS-OXOPOST], [MS-OXORSS], [MS-OXTNEF]
    /// Alternate names: PR_SENT_REPRESENTING_NAME, PR_SENT_REPRESENTING_NAME_A,
    /// ptagSentRepresentingName, PR_SENT_REPRESENTING_NAME_W, urn:schemas:httpmail:fromname,
    /// http://schemas.microsoft.com/exchange/from-name-utf8
    case tagSentRepresentingName = 0x0042

    /// [MS-OXPROPS] 2.895 PidTagReceivedRepresentingEntryId
    /// Canonical name: PidTagReceivedRepresentingEntryId
    /// Description: Contains an address book EntryID that identifies the end user represented by the
    /// receiving mailbox owner.
    /// Property ID: 0x0043
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.25
    /// Alternate names: PR_RCVD_REPRESENTING_ENTRYID, ptagRcvdRepresentingEntryId
    case tagReceivedRepresentingEntryId = 0x0043

    /// [MS-OXPROPS] 2.896 PidTagReceivedRepresentingName
    /// Canonical name: PidTagReceivedRepresentingName
    /// Description: Contains the display name for the end user represented by the receiving mailbox
    /// owner.
    /// Property ID: 0x0044
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.26
    /// Alternate names: PR_RCVD_REPRESENTING_NAME, PR_RCVD_REPRESENTING_NAME_A,
    /// ptagRcvdRepresentingName, PR_RCVD_REPRESENTING_NAME_W
    case tagReceivedRepresentingName = 0x0044

    /// [MS-OXPROPS] 2.922 PidTagReportEntryId
    /// Canonical name: PidTagReportEntryId
    /// Description: Specifies an entry ID that identifies the application that generated a report message.
    /// Property ID: 0x0045
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.45
    /// Alternate names: PR_REPORT_ENTRYID, ptagReportEntryId
    case tagReportEntryId = 0x0045

    /// [MS-OXPROPS] 2.881 PidTagReadReceiptEntryId
    /// Canonical name: PidTagReadReceiptEntryId
    /// Description: Contains an address book EntryID.
    /// Property ID: 0x0046
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.26
    /// Alternate names: PR_READ_RECEIPT_ENTRYID, ptagReadReceiptEntryId
    case tagReadReceiptEntryId = 0x0046

    /// [MS-OXPROPS] 2.799 PidTagMessageSubmissionId
    /// Canonical name: PidTagMessageSubmissionId
    /// Description: Contains a message identifier assigned by a message transfer agent.
    /// Property ID: 0x0047
    /// Data type: PtypBinary, 0x0102
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.79
    /// Consuming references: [MS-OXTNEF]
    /// Alternate names: PR_MESSAGE_SUBMISSION_ID, ptagMessageSubmissionId
    case tagMessageSubmissionId = 0x0047

    /// PidTagProviderSubmitTime
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagprovidersubmittime-canonical-property
    case tagProviderSubmitTime = 0x0048

    /// [MS-OXPROPS] 2.843 PidTagOriginalSubject
    /// Canonical name: PidTagOriginalSubject
    /// Description: Specifies the subject of the original message.
    /// Property ID: 0x0049
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.16
    /// Alternate names: PR_ORIGINAL_SUBJECT, PR_ORIGINAL_SUBJECT_A, ptagOriginalSubject,
    /// PR_ORIGINAL_SUBJECT_W, http://schemas.microsoft.com/exchange/originalsubject,
    /// http://schemas.microsoft.com/mapi/original_subject
    case tagOriginalSubject = 0x0049

    /// [MS-OXPROPS] 2.830 PidTagOriginalMessageClass
    /// Canonical name: PidTagOriginalMessageClass
    /// Description: Designates the PidTagMessageClass property ([MS-OXCMSG] section 2.2.1.3) from
    /// the original message.
    /// Property ID: 0x004B
    /// Data type: PtypString, 0x001F
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.86
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_ORIG_MESSAGE_CLASS, PR_ORIG_MESSAGE_CLASS_A,
    /// PR_ORIG_MESSAGE_CLASS_W
    case tagOriginalMessageClass = 0x004B

    /// [MS-OXPROPS] 2.823 PidTagOriginalAuthorEntryId
    /// Canonical name: PidTagOriginalAuthorEntryId
    /// Description: Contains an address book EntryID structure ([MS-OXCDATA] section 2.2.5.2) and is
    /// defined in report messages to identify the user who sent the original message.
    /// Property ID: 0x004C
    /// Data type: PtypBinary, 0x0102
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.32
    /// Alternate names: PR_ORIGINAL_AUTHOR_ENTRYID
    case tagOriginalAuthorEntryId = 0x004C

    /// [MS-OXPROPS] 2.824 PidTagOriginalAuthorName
    /// Canonical name: PidTagOriginalAuthorName
    /// Description: Contains the display name of the sender of the original message referenced by a report
    /// message.
    /// Property ID: 0x004D
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.33
    /// Alternate names: PR_ORIGINAL_AUTHOR_NAME_W
    case tagOriginalAuthorName = 0x004D

    /// [MS-OXPROPS] 2.844 PidTagOriginalSubmitTime
    /// Canonical name: PidTagOriginalSubmitTime
    /// Description: Specifies the original email message's submission date and time, in UTC.
    /// Property ID: 0x004E
    /// Data type: PtypTime, 0x0040
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.17
    /// Alternate names: PR_ORIGINAL_SUBMIT_TIME, ptagOriginalSubmitTime,
    /// http://schemas.microsoft.com/exchange/originaldate,
    /// http://schemas.microsoft.com/mapi/original_submit_time
    case tagOriginalSubmitTime = 0x004E

    /// [MS-OXPROPS] 2.915 PidTagReplyRecipientEntries
    /// Canonical name: PidTagReplyRecipientEntries
    /// Description: Identifies a FlatEntryList structure ([MS-OXCDATA] section 2.3.3) of address book
    /// EntryIDs for recipients that are to receive a reply.
    /// Property ID: 0x004F
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.43
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_REPLY_RECIPIENT_ENTRIES, ptagReplyRecipientEntries,
    /// http://schemas.microsoft.com/exchange/reply-to-base64
    case tagReplyRecipientEntries = 0x004F

    /// [MS-OXPROPS] 2.916 PidTagReplyRecipientNames
    /// Canonical name: PidTagReplyRecipientNames
    /// Description: Contains a list of display names for recipients that are to receive a reply.
    /// Property ID: 0x0050
    /// Data type: PtypString, 0x001F
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.44
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_REPLY_RECIPIENT_NAMES, PR_REPLY_RECIPIENT_NAMES_A,
    /// ptagReplyRecipientNames, PR_REPLY_RECIPIENT_NAMES_W
    case tagReplyRecipientNames = 0x0050

    /// [MS-OXPROPS] 2.891 PidTagReceivedBySearchKey
    /// Canonical name: PidTagReceivedBySearchKey
    /// Description: Identifies an address book search key that contains a binary-comparable key that is
    /// used to identify correlated objects for a search.
    /// Property ID: 0x0051
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.40
    /// Alternate names: PR_RECEIVED_BY_SEARCH_KEY
    case tagReceivedBySearchKey = 0x0051

    /// [MS-OXPROPS] 2.897 PidTagReceivedRepresentingSearchKey
    /// Canonical name: PidTagReceivedRepresentingSearchKey
    /// Description: Identifies an address book search key that contains a binary-comparable key of the end
    /// user represented by the receiving mailbox owner.
    /// Property ID: 0x0052
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.27
    /// Alternate names: PR_RCVD_REPRESENTING_SEARCH_KEY, ptagRcvdRepresentingSearchKey
    case tagReceivedRepresentingSearchKey = 0x0052

    /// [MS-OXPROPS] 2.884 PidTagReadReceiptSearchKey
    /// Canonical name: PidTagReadReceiptSearchKey
    /// Description: Contains an address book search key.
    /// Property ID: 0x0053
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.28
    /// Alternate names: PR_READ_RECEIPT_SEARCH_KEY, ptagReadReceiptSearchKey
    case tagReadReceiptSearchKey = 0x0053

    /// [MS-OXPROPS] 2.925 PidTagReportSearchKey
    /// Canonical name: PidTagReportSearchKey
    /// Description: Contains an address book search key representing the entity (usually a server agent)
    /// that generated the report message.
    /// Property ID: 0x0054
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.21
    /// Alternate names: PR_REPORT_SEARCH_KEY, ptagReportSearchKey
    case tagReportSearchKey = 0x0054

    /// [MS-OXPROPS] 2.825 PidTagOriginalDeliveryTime
    /// Canonical name: PidTagOriginalDeliveryTime
    /// Description: Contains the delivery time, in UTC, from the original message.
    /// Property ID: 0x0055
    /// Data type: PtypTime, 0x0040
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.2
    /// Alternate names: PR_ORIGINAL_DELIVERY_TIME, ptagOriginalDeliveryTime
    case tagOriginalDeliveryTime = 0x0055

    /// PidTagOriginalAuthorSearchKey
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthorsearchkey-canonical-property
    case tagOriginalAuthorSearchKey = 0x0056

    /// [MS-OXPROPS] 2.800 PidTagMessageToMe
    /// Canonical name: PidTagMessageToMe
    /// Description: Indicates that the receiving mailbox owner is one of the primary recipients of this
    /// email message.
    /// Property ID: 0x0057
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.17
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_MESSAGE_TO_ME, ptagMessageToMe
    case tagMessageToMe = 0x0057

    /// [MS-OXPROPS] 2.786 PidTagMessageCcMe
    /// Canonical name: PidTagMessageCcMe
    /// Descripton: Indicates that the receiving mailbox owner is a carbon copy (Cc) recipient of this
    /// email message.
    /// Property ID: 0x0058
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.18
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_MESSAGE_CC_ME, ptagMessageCcMe
    case tagMessageCcMe = 0x0058

    /// [MS-OXPROPS] 2.794 PidTagMessageRecipientMe
    /// Canonical name: PidTagMessageRecipientMe
    /// Description: Indicates that the receiving mailbox owner is a primary or a carbon copy (Cc)
    /// recipient of this email message.
    /// Property ID: 0x0059
    /// Data type: PtypBoolean, 0x000B
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.19
    /// Consuming Reference: [MS-OXTNEF]
    /// Alternate names: PR_MESSAGE_RECIP_ME, ptagMessageRecipMe
    case tagMessageRecipientMe = 0x0059

    /// [MS-OXPROPS] 2.835 PidTagOriginalSenderName
    /// Canonical name: PidTagOriginalSenderName
    /// Description: Contains the value of the original message sender's PidTagSenderName property
    /// (section 2.1004), and is set on delivery report messages.
    /// Property ID: 0x005A
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.9
    /// Alternate names: PR_ORIGINAL_SENDER_NAME, PR_ORIGINAL_SENDER_NAME_A,
    /// ptagOriginalSenderName, PR_ORIGINAL_SENDER_NAME_W,
    /// http://schemas.microsoft.com/exchange/originalsendername
    case tagOriginalSenderName = 0x005A

    /// [MS-OXPROPS] 2.834 PidTagOriginalSenderEntryId
    /// Canonical name: PidTagOriginalSenderEntryId
    /// Description: Contains an address book EntryID that is set on delivery report messages.
    /// Property ID: 0x005B
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.8
    /// Alternate names: PR_ORIGINAL_SENDER_ENTRYID, ptagOriginalSenderEntryId
    case tagOriginalSenderEntryId = 0x005B

    /// [MS-OXPROPS] 2.836 PidTagOriginalSenderSearchKey
    /// Canonical name: PidTagOriginalSenderSearchKey
    /// Description: Contains an address book search key set on the original email message.
    /// Property ID: 0x005C
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.10
    /// Alternate names: PR_ORIGINAL_SENDER_SEARCH_KEY, ptagOriginalSenderSearchKey
    case tagOriginalSenderSearchKey = 0x005C

    /// [MS-OXPROPS] 2.841 PidTagOriginalSentRepresentingName
    /// Canonical name: PidTagOriginalSentRepresentingName
    /// Description: Contains the display name of the end user who is represented by the original email
    /// message sender.
    /// Property ID: 0x005D
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.14
    /// Alternate names: PR_ORIGINAL_SENT_REPRESENTING_NAME,
    /// PR_ORIGINAL_SENT_REPRESENTING_NAME_A, ptagOriginalSentRepresentingName,
    /// PR_ORIGINAL_SENT_REPRESENTING_NAME_W
    case tagOriginalSentRepresentingName = 0x005D

    /// [MS-OXPROPS] 2.840 PidTagOriginalSentRepresentingEntryId
    /// Canonical name: PidTagOriginalSentRepresentingEntryId
    /// Description: Identifies an address book EntryID that contains the entry identifier of the end user
    /// who is represented by the original message sender.
    /// Property ID: 0x005E
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.13
    /// Alternate names: PR_ORIGINAL_SENT_REPRESENTING_ENTRYID,
    /// ptagOriginalSentRepresentingEntryId
    case tagOriginalSentRepresentingEntryId = 0x005E

    /// [MS-OXPROPS] 2.842 PidTagOriginalSentRepresentingSearchKey
    /// Canonical name: PidTagOriginalSentRepresentingSearchKey
    /// Description: Identifies an address book search key that contains the SearchKey of the end user who
    /// is represented by the original message sender.
    /// Property ID: 0x005F
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.15
    /// Alternate names: PR_ORIGINAL_SENT_REPRESENTING_SEARCH_KEY,
    /// ptagOriginalSentRepresentingSearchKey
    case tagOriginalSentRepresentingSearchKey = 0x005F

    /// [MS-OXPROPS] 2.1025 PidTagStartDate
    /// Canonical name: PidTagStartDate
    /// Description: Contains the value of the PidLidAppointmentStartWhole property (section 2.29).
    /// Property ID: 0x0060
    /// Data type: PtypTime, 0x0040
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOCAL] section 2.2.1.30
    /// Consuming references: [MS-OXORMDR], [MS-OXTNEF], [MS-XWDCAL],
    /// Alternate names: PR_START_DATE, http://schemas.microsoft.com/mapi/start_date
    case tagStartDate = 0x0060

    /// [MS-OXPROPS] 2.682 PidTagEndDate
    /// Canonical name: PidTagEndDate
    /// Description: Contains the value of the PidLidAppointmentEndWhole property (section 2.14).
    /// Property ID: 0x0061
    /// Data type: PtypTime, 0x0040
    /// Area: MapiEnvelope Property set
    /// Defining reference: [MS-OXOCAL] section 2.2.1.31
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR], [MS-OXTNEF], [MS-XWDCAL]
    /// Alternate names: PR_END_DATE, http://schemas.microsoft.com/mapi/end_date
    case tagEndDate = 0x0061

    /// [MS-OXPROPS] 2.856 PidTagOwnerAppointmentId
    /// Canonical name: PidTagOwnerAppointmentId
    /// Description: Specifies a quasi-unique value among all of the Calendar objects in a user's mailbox.
    /// Property ID: 0x0062
    /// Data type: PtypInteger32, 0x0003
    /// Area: Appointment
    /// Defining reference:[MS-OXOCAL] section 2.2.1.29
    /// Consuming references: [MS-OXCICAL], [MS-OXTNEF], [MS-XWDCAL]
    /// Alternate names: PR_OWNER_APPT_ID, http://schemas.microsoft.com/mapi/owner_appt_id
    case tagOwnerAppointmentId = 0x0062

    /// [MS-OXPROPS] 2.930 PidTagResponseRequested
    /// Canonical name: PidTagResponseRequested
    /// Description: Indicates whether a response is requested to a Message object.
    /// Property ID: 0x0063
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiEnvelope Property set
    /// Defining reference: [MS-OXOMSG] section 2.2.1.46
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXOFLAG], [MSOXORMDR], [MS-OXTNEF], [MS-XWDCAL]
    /// Alternate names: PR_RESPONSE_REQUESTED, urn:schemas:calendar:responserequested,
    /// http://schemas.microsoft.com/mapi/response_requested
    case tagResponseRequested = 0x0063

    /// 2.1012 PidTagSentRepresentingAddressType
    /// Canonical name: PidTagSentRepresentingAddressType
    /// Description: Contains an email address type.
    /// Property ID: 0x0064
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.54
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXODLGT], [MS-OXOPOST], [MSOXOTASK], [MS-OXTNEF]
    /// Alternate names: PR_SENT_REPRESENTING_ADDRTYPE, PR_SENT_REPRESENTING_ADDRTYPE_A,
    /// ptagSentRepresentingAddrType, PR_SENT_REPRESENTING_ADDRTYPE_W
    case tagSentRepresentingAddressType = 0x0064

    /// [MS-OXPROPS] 2.1013 PidTagSentRepresentingEmailAddress
    /// Canonical name: PidTagSentRepresentingEmailAddress
    /// Description: Contains an email address for the end user who is represented by the sending mailbox
    /// owner.
    /// Property ID: 0x0065
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.55
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOTASK], [MS-OXTNEF]
    /// Alternate names: PR_SENT_REPRESENTING_EMAIL_ADDRESS,
    /// PR_SENT_REPRESENTING_EMAIL_ADDRESS_A, PR_SENT_REPRESENTING_EMAIL_ADDRESS_W
    case tagSentRepresentingEmailAddress = 0x0065

    /// [MS-OXPROPS] 2.832 PidTagOriginalSenderAddressType
    /// Canonical name: PidTagOriginalSenderAddressType
    /// Description: Contains the value of the original message sender's PidTagSenderAddressType
    /// property (section 2.1000).
    /// Property ID: 0x0066
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.6
    /// Alternate names: PR_ORIGINAL_SENDER_ADDRTYPE, PR_ORIGINAL_SENDER_ADDRTYPE_A,
    /// ptagOriginalSenderAddrType, PR_ORIGINAL_SENDER_ADDRTYPE_W
    case tagOriginalSenderAddressType = 0x0066

    /// [MS-OXPROPS] 2.833 PidTagOriginalSenderEmailAddress
    /// Canonical name: PidTagOriginalSenderEmailAddress
    /// Description: Contains the value of the original message sender's PidTagSenderEmailAddress
    /// property (section 2.1001).
    /// Property ID: 0x0067
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.7
    /// Alternate names: PR_ORIGINAL_SENDER_EMAIL_ADDRESS,
    /// PR_ORIGINAL_SENDER_EMAIL_ADDRESS_A, PR_ORIGINAL_SENDER_EMAIL_ADDRESS_W
    case tagOriginalSenderEmailAddress = 0x0067

    /// [MS-OXPROPS] 2.838 PidTagOriginalSentRepresentingAddressType
    /// Canonical name: PidTagOriginalSentRepresentingAddressType
    /// Description: Contains the address type of the end user who is represented by the original email
    /// message sender.
    /// Property ID: 0x0068
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.11
    /// Alternate names: PR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE,
    /// PR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_A, ptagOriginalSentRepresentingAddrType,
    /// PR_ORIGINAL_SENT_REPRESENTING_ADDRTYPE_W
    case tagOriginalSentRepresentingAddressType = 0x0068

    /// [MS-OXPROPS] 2.839 PidTagOriginalSentRepresentingEmailAddress
    /// Canonical name: PidTagOriginalSentRepresentingEmailAddress
    /// Description: Contains the email address of the end user who is represented by the original email
    /// message sender.
    /// Property ID: 0x0069
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.12
    /// Alternate names: PR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS,
    /// PR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_A,
    /// PR_ORIGINAL_SENT_REPRESENTING_EMAIL_ADDRESS_W
    case tagOriginalSentRepresentingEmailAddress = 0x0069

    /// [MS-OXPROPS] 2.652 PidTagConversationTopic
    /// Canonical name: PidTagConversationTopic
    /// Description: Contains an unchanging copy of the original subject.
    /// Property ID: 0x0070
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.5
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXOPOST], [MS-OXORMDR], [MS-OXORSS], [MS-OXTNEF], [MS-OXVCARD]
    /// Alternate names: PR_CONVERSATION_TOPIC, PR_CONVERSATION_TOPIC_A,
    /// ptagConversationTopic, PR_CONVERSATION_TOPIC_W, urn:schemas:httpmail:thread-topic
    case tagConversationTopic = 0x0070

    /// [MS-OXPROPS] 2.650 PidTagConversationIndex
    /// Canonical name: PidTagConversationIndex
    /// Description: Indicates the relative position of this message within a conversation thread.
    /// Property ID: 0x0071
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.3
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXOMSG], [MS-OXOPOST], [MS-OXTNEF], [MS-OXOCAL]
    /// Alternate names: PR_CONVERSATION_INDEX, ptagConversationIndex
    case tagConversationIndex = 0x0071

    /// [MS-OXPROPS] 2.826 PidTagOriginalDisplayBcc
    /// Canonical name: PidTagOriginalDisplayBcc
    /// Description: Contains the value of the PidTagDisplayBcc property (section 2.674) from the original
    /// message.
    /// Property ID: 0x0072
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.5
    /// Alternate names: PR_ORIGINAL_DISPLAY_BCC, PR_ORIGINAL_DISPLAY_BCC_A,
    /// ptagOriginalDisplayBcc, PR_ORIGINAL_DISPLAY_BCC_W,
    /// http://schemas.microsoft.com/exchange/originaldisplaybcc
    case tagOriginalDisplayBcc = 0x0072

    /// [MS-OXPROPS] 2.827 PidTagOriginalDisplayCc
    /// Canonical name: PidTagOriginalDisplayCc
    /// Description: Contains the value of the PidTagDisplayCc property(section 2.675) from the original
    /// message.
    /// Property ID: 0x0073
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.4
    /// Alternate names: PR_ORIGINAL_DISPLAY_CC, PR_ORIGINAL_DISPLAY_CC_A,
    /// ptagOriginalDisplayCc, PR_ORIGINAL_DISPLAY_CC_W,
    /// http://schemas.microsoft.com/exchange/originaldisplaycc,
    /// http://schemas.microsoft.com/mapi/original_display_cc
    case tagOriginalDisplayCc = 0x0073

    /// [MS-OXPROPS] 2.828 PidTagOriginalDisplayTo
    /// Canonical name: PidTagOriginalDisplayTo
    /// Description: Contains the value of the PidTagDisplayTo property (section 2.678) from the original
    /// message.
    /// Property ID: 0x0074
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.2.3
    /// Alternate names: PR_ORIGINAL_DISPLAY_TO, PR_ORIGINAL_DISPLAY_TO_A,
    /// ptagOriginalDisplayTo, PR_ORIGINAL_DISPLAY_TO_W,
    /// http://schemas.microsoft.com/exchange/originaldisplayto,
    /// http://schemas.microsoft.com/mapi/original_display_to
    case tagOriginalDisplayTo = 0x0074

    /// [MS-OXPROPS] 2.887 PidTagReceivedByAddressType
    /// Canonical name: PidTagReceivedByAddressType
    /// Description: Contains the email message receiver's email address type.
    /// Property ID: 0x0075
    /// Data type: PtypString, 0x001F
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXOMSG] section 2.2.1.36
    /// Alternate names: PR_RECEIVED_BY_ADDRTYPE, PR_RECEIVED_BY_ADDRTYPE_A,
    /// ptagReceivedByAddrType, PR_RECEIVED_BY_ADDRTYPE_W
    case tagReceivedByAddressType = 0x0075

    /// [MS-OXPROPS] 2.888 PidTagReceivedByEmailAddress
    /// Canonical name: PidTagReceivedByEmailAddress
    /// Description: Contains the email message receiver's email address.
    /// Property ID: 0x0076
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.37
    /// Alternate names: PR_RECEIVED_BY_EMAIL_ADDRESS, PR_RECEIVED_BY_EMAIL_ADDRESS_A,
    /// PR_RECEIVED_BY_EMAIL_ADDRESS_W
    case tagReceivedByEmailAddress = 0x0076

    /// [MS-OXPROPS] 2.893 PidTagReceivedRepresentingAddressType
    /// Canonical name: PidTagReceivedRepresentingAddressType
    /// Description: Contains the email address type for the end user represented by the receiving
    /// mailbox owner.
    /// Property ID: 0x0077
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.23
    /// Alternate names: PR_RCVD_REPRESENTING_ADDRTYPE, PR_RCVD_REPRESENTING_ADDRTYPE_A,
    /// ptagRcvdRepresentingAddrType, PR_RCVD_REPRESENTING_ADDRTYPE_W
    case tagReceivedRepresentingAddressType = 0x0077

    /// [MS-OXPROPS] 2.894 PidTagReceivedRepresentingEmailAddress
    /// Canonical name: PidTagReceivedRepresentingEmailAddress
    /// Description: Contains the email address for the end user represented by the receiving mailbox
    /// owner.
    /// Property ID: 0x0078
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.24
    /// Alternate names: PR_RCVD_REPRESENTING_EMAIL_ADDRESS,
    /// PR_RCVD_REPRESENTING_EMAIL_ADDRESS_A, PR_RCVD_REPRESENTING_EMAIL_ADDRESS_W
    case tagReceivedRepresentingEmailAddress = 0x0078

    /// PidTagOriginalAuthorAddressType
    /// Not documented in specification but known on internet
    /// Contains the address type of the author of the first version of a message, that is, the message before being forwarded or replied to.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthoraddresstype-canonical-property
    case tagOriginalAuthorAddressType = 0x0079

    /// PidTagOriginalAuthorEmailAddress
    /// Not documented in specification but known on internet
    /// Contains the email address of the author of the first version of a message, that is, the message before being forwarded or replied to.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalauthoremailaddress-canonical-property
    case tagOriginalAuthorEmailAddress = 0x007A

    /// PidTagOriginallyIntendedRecipAddrtype
    /// Not documented in specification but known on internet
    /// Contains the address type of the originally intended recipient of an autoforwarded message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipaddrtype-canonical-property
    case tagOriginallyIntendedRecipAddrtype = 0x007B

    /// PidTagOriginallyIntendedRecipEmailAddress
    /// Not documented in specification but known on internet
    /// Contains the address type of the originally intended recipient of an autoforwarded message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipemailaddress-canonical-property
    case tagOriginallyIntendedRecipEmailAddress = 0x007C

    /// [MS-OXPROPS] 2.1050 PidTagTransportMessageHeaders
    /// Canonical name: PidTagTransportMessageHeaders
    /// Description: Contains transport-specific message envelope information for email.
    /// Property ID: 0x007D
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.61
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL]
    /// Alternate names: PR_TRANSPORT_MESSAGE_HEADERS, PR_TRANSPORT_MESSAGE_HEADERS_A,
    /// PR_TRANSPORT_MESSAGE_HEADERS_W
    case tagTransportMessageHeaders = 0x007D

    /// [MS-OXPROPS] 2.1047 PidTagTnefCorrelationKey
    /// Canonical name: PidTagTnefCorrelationKey
    /// Description: Contains a value that correlates a Transport Neutral Encapsulation Format (TNEF)
    /// attachment with a message.
    /// Property ID: 0x007F
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiEnvelope
    /// Defining reference: [MS-OXCMSG] section 2.2.1.29
    /// Consuming reference: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXTNEF]
    /// Alternate names: PR_TNEF_CORRELATION_KEY
    case tagTnefCorrelationKey = 0x007F

    /// [MS-OXPROPS] 2.920 PidTagReportDisposition
    /// Canonical name: PidTagReportDisposition
    /// Description: Contains a string indicating whether the original message was displayed to the user or
    /// deleted (report messages only).
    /// Property ID: 0x0080
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.34
    /// Alternate names: PR_REPORT_DISPOSITION_W
    case tagReportDisposition = 0x0080

    /// [MS-OXPROPS] 2.921 PidTagReportDispositionMode
    /// Canonical name: PidTagReportDispositionMode
    /// Description: Contains a description of the action that a client has performed on behalf of a user
    /// (report messages only).
    /// Property ID: 0x0081
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.35
    /// Alternate names: PR_REPORT_DISPOSITION_MODE_W
    case tagReportDispositionMode = 0x0081

    /// PidTagReportOriginalSender
    /// Not documented in specification but known on internet
    /// Indicates the original sender of the message for messages that request receipts.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportoriginalsender-canonical-property
    case tagReportOriginalSender = 0x0082

    /// PidTagReportDispositionToNames
    /// Not documented in specification but known on internet
    /// Indicates the names of the report recipients for messages that request receipts.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportdispositiontonames-canonical-property
    case tagReportDispositionToNames = 0x0083

    /// PidTagReportDispositionToEmailAddresses
    /// Not documented in specification but known on internet
    /// Indicates email addresses of the report recipients for messages that request receipts.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportdispositiontoemailaddresses-canonical-property
    case tagReportDispositionToEmailAddresses = 0x0084

    /// PidTagReportDispositionOptions
    /// Not documented in specification but known on internet
    /// Maps to the MIME Disposition-Options header for messages that request receipts. The value of this property should be an empty string.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportdispositiontoemailaddresses-canonical-property
    case tagReportDispositionOptions = 0x0085

    case unknown0x0086 = 0x0086

    // case unknown0x0086 = 0x0086

    // case unknown0x0806 = 0x0806

    /// [MS-OXPROPS] 2.568 PidTagAddressBookRoomCapacity
    /// Canonical name: PidTagAddressBookRoomCapacity
    /// Description: Contains the maximum occupancy of the room.
    /// Property ID: 0x0807
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.9.1
    /// Alternate names: PR_EMS_AB_ROOM_CAPACITY
    case tagAddressBookRoomCapacity = 0x0807

    // case unknown0x0808 = 0x0808

    /// [MS-OXPROPS] 2.570 PidTagAddressBookRoomDescription
    /// Canonical name: PidTagAddressBookRoomDescription
    /// Description: Contains a description of the Resource object.
    /// Property ID: 0x0809
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.9.2
    /// Alternate names: PR_EMS_AB_ROOM_DESCRIPTION, PR_EMS_AB_ROOM_DESCRIPTION_A,
    /// PR_EMS_AB_ROOM_DESCRIPTION_W
    case tagAddressBookRoomDescription = 0x0809

    // case unknown0x080A = 0x080A

    // case unknown0x0BFF = 0x0BFF

    /// PidTagContentIntegrityCheck
    /// Not documented in specification but known on internet
    /// Contains an ASN.1 content integrity check value that allows a message sender to protect message content from disclosure to unauthorized recipients.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagexplicitconversion-canonical-property
    case tagContentIntegrityCheck = 0x0C00

    /// PidTagExplicitConversion
    /// Not documented in specification but known on internet
    /// Indicates that a message sender has requested a message content conversion for a particular recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagexplicitconversion-canonical-property
    case tagExplicitConversion = 0x0C01

    /// PidTagIpmReturnRequested
    /// Not documented in specification but known on internet
    /// Contains TRUE if this message should be returned with a report.
    /// https://docs.microsoft.com/en-nz/office/client-developer/outlook/mapi/pidtagipmreturnrequested-canonical-property
    case tagIpmReturnRequested = 0x0C02

    /// PidTagMessageToken
    /// Not documented in specification but known on internet
    /// Contains an ASN.1 security token for a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagetoken-canonical-property
    case tagMessageToken = 0x0C03

    /// [MS-OXPROPS] 2.809 PidTagNonDeliveryReportReasonCode
    /// Canonical name: PidTagNonDeliveryReportReasonCode
    /// Description: Contains an integer value that indicates a reason for delivery failure.
    /// Property ID: 0x0C04
    /// Data type: PtypInteger32, 0x0003
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.31
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_NDR_REASON_CODE, ptagNDRReasonCode
    case tagNonDeliveryReportReasonCode = 0x0C04

    /// [MS-OXPROPS] 2.808 PidTagNonDeliveryReportDiagCode
    /// Canonical name: PidTagNonDeliveryReportDiagCode
    /// Description: Contains the diagnostic code for a delivery status notification, as specified in [RFC3464].
    /// Property ID: 0x0C05
    /// Data type: PtypInteger32, 0x0003
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.30
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_NDR_DIAG_CODE, ptagNonDeliveryDiagCode
    case tagNonDeliveryReportDiagCode = 0x0C05

    /// [MS-OXPROPS] 2.811 PidTagNonReceiptNotificationRequested
    /// Canonical Name: PidTagNonReceiptNotificationRequested
    /// Description: Specifies whether the client sends a non-read receipt.
    /// Property ID: 0x0C06
    /// Data type: PtypBoolean, 0x000B
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.31
    /// Alternate names: PR_NON_RECEIPT_NOTIFICATION_REQUESTED
    case tagNonReceiptNotificationRequested = 0x0C06

    /// PidTagDeliveryPoint
    /// Not documented in specification but known on internet
    /// Specifies the nature of the functional entity by means of which a message was or would have been delivered to the recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdeliverypoint-canonical-property
    case tagDeliveryPoint = 0x0C07

    /// [MS-OXPROPS] 2.846 PidTagOriginatorNonDeliveryReportRequested
    /// Canonical name: PidTagOriginatorNonDeliveryReportRequested
    /// Description: Specifies whether an email sender requests suppression of nondelivery receipts.
    /// Property ID: 0x0C08
    /// Data type: PtypBoolean, 0x000B
    /// Area: MIME Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.21
    /// Alternate names: PR_ORIGINATOR_NON_DELIVERY_REPORT_REQUESTED
    case tagOriginatorNonDeliveryReportRequested = 0x0C08

    /// PidTagOriginatorRequestedAlternateRecipient
    /// Not documented in specification but known on internet
    /// Contains an entry identifier for an alternate recipient designated by the sender.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatorrequestedalternaterecipient-canonical-property
    case tagOriginatorRequestedAlternateRecipient = 0x0C09

    /// PidTagPhysicalRenditionAttributes
    /// Not documented in specification but known on internet
    /// Contains an ASN.1 object identifier that is used for rendering message attachments.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagphysicalrenditionattributes-canonical-property
    case tagPhysicalRenditionAttributes = 0x0C10

    /// PidTagProofOfDelivery
    /// Not documented in specification but known on internet
    /// This property contains an ASN.1 proof of delivery value.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofdelivery-canonical-property
    case tagProofOfDelivery = 0x0C11

    /// PidTagProofOfDeliveryRequested
    /// Not documented in specification but known on internet
    /// This property contains TRUE if a message sender requests proof of delivery for a particular recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofdeliveryrequested-canonical-property
    case tagProofOfDeliveryRequested = 0x0C12

    /// PidTagRecipientNumberForAdvice
    /// Not documented in specification but known on internet
    /// This property contains a message recipient's telephone number to call to advise of the physical delivery of a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrecipientnumberforadvice-canonical-property
    case tagRecipientNumberForAdvice = 0x0C13

    /// [MS-OXPROPS] 2.909 PidTagRecipientType
    /// Canonical name: PidTagRecipientType
    /// Description: Represents the recipient type of a recipient on the message.
    /// Property ID: 0x0C15
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiRecipient
    /// Defining reference: [MS-OXOMSG] section 2.2.3.1
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXORULE], [MSOXOSRCH], [MS-OXCMSG]
    /// Alternate names: PR_RECIPIENT_TYPE, ptagRecipientType
    case tagRecipientType = 0x0C15

    /// PidTagRegisteredMailType
    /// Not documented in specification but known on internet
    /// This property contains the type of registration used for physical delivery of a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagregisteredmailtype-canonical-property
    case tagRegisteredMailType = 0x0C16

    /// [MS-OXPROPS] 2.917 PidTagReplyRequested
    /// Canonical name: PidTagReplyRequested
    /// Description: Indicates whether a reply is requested to a Message object.
    /// Property ID: 0x0C17
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiRecipient
    /// Defining reference: [MS-OXOMSG] section 2.2.1.45
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXOFLAG], [MSOXOMSG], [MS-OXORMDR]
    /// Alternate names: PR_REPLY_REQUESTED, ptagReplyRequested
    case tagReplyRequested = 0x0C17

    /// PidTagRequestedDeliveryMethod
    /// Not documented in specification but known on internet
    /// This property contains a binary array of delivery methods (service providers), in the order of a message sender's preference.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrequesteddeliverymethod-canonical-property
    case tagRequestedDeliveryMethod = 0x0C18

    /// [MS-OXPROPS] 2.1002 PidTagSenderEntryId
    /// Canonical name: PidTagSenderEntryId
    /// Description: Identifies an address book EntryID that contains the address book EntryID of the
    /// sending mailbox owner.
    /// Property ID: 0x0C19
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.50
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOPOST], [MS-OXOTASK], [MSOXTNEF]
    /// Alternate names: PR_SENDER_ENTRYID, ptagSenderEntryId
    case tagSenderEntryId = 0x0C19

    /// [MS-OXPROPS] 2.1004 PidTagSenderName
    /// Canonical name: PidTagSenderName
    /// Description: Contains the display name of the sending mailbox owner.
    /// Property ID: 0x0C1A
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.51
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOCAL], [MSOXOPOST], [MS-OXOTASK], [MS-OXTNEF]
    /// Alternate names: PR_SENDER_NAME, PR_SENDER_NAME_A, ptagSenderName,
    /// PR_SENDER_NAME_W, urn:schemas:httpmail:sendername,
    /// http://schemas.microsoft.com/exchange/sender-name-utf8
    case tagSenderName = 0x0C1A

    /// [MS-OXPROPS] 2.1035 PidTagSupplementaryInfo
    /// Canonical name: PidTagSupplementaryInfo
    /// Description: Contains supplementary information about a delivery status notification, as specified in
    /// [RFC3464].
    /// Property ID: 0x0C1B
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.36
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_SUPPLEMENTARY_INFO, ptagSupplementaryInfo
    case tagSupplementaryInfo = 0x0C1B

    /// PidTagTypeOfX400User
    /// Not documented in specification but known on internet
    /// This property contains the type of a message recipient for use in a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagtypeofx400user-canonical-property
    case tagTypeOfX400User = 0x0C1C

    /// [MS-OXPROPS] 2.1005 PidTagSenderSearchKey
    /// Canonical name: PidTagSenderSearchKey
    /// Description: Identifies an address book search key.
    /// Property ID: 0x0C1D
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.52
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCAL], [MS-OXOPOST]
    /// Alternate names: PR_SENDER_SEARCH_KEY, ptagSenderSearchKey
    case tagSenderSearchKey = 0x0C1D

    /// [MS-OXPROPS] 2.1000 PidTagSenderAddressType
    /// Canonical name: PidTagSenderAddressType
    /// Description: Contains the email address type of the sending mailbox owner.
    /// Property ID: 0x0C1E
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.48
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOTASK], [MS-OXTNEF], [MSOXOPOST]
    /// Alternate names: PR_SENDER_ADDRTYPE, PR_SENDER_ADDRTYPE_A, ptagSenderAddrType,
    /// PR_SENDER_ADDRTYPE_W
    case tagSenderAddressType = 0x0C1E

    /// [MS-OXPROPS] 2.1001 PidTagSenderEmailAddress
    /// Canonical name: PidTagSenderEmailAddress
    /// Description: Contains the email address of the sending mailbox owner.
    /// Property ID: 0x0C1F
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.49
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCSPAM], [MS-OXORSS], [MSOXOTASK], [MS-OXPSVAL], [MS-OXTNEF]
    /// Alternate names: PR_SENDER_EMAIL_ADDRESS, PR_SENDER_EMAIL_ADDRESS_A,
    /// PR_SENDER_EMAIL_ADDRESS_W
    case tagSenderEmailAddress = 0x0C1F

    /// [MS-OXPROPS] 2.810 PidTagNonDeliveryReportStatusCode
    /// Canonical name: PidTagNonDeliveryReportStatusCode
    /// Description: Contains the value of the Status field for a delivery status notification, as specified in
    /// [RFC3464].
    /// Property ID: 0x0C20
    /// Data type: PtypInteger32, 0x0003
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.32
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_NDR_STATUS_CODE, ptagNDRStatusCode
    case tagNonDeliveryReportStatusCode = 0x0C20

    /// [MS-OXPROPS] 2.913 PidTagRemoteMessageTransferAgent
    /// Canonical name: PidTagRemoteMessageTransferAgent
    /// Description: Contains the value of the Remote-MTA field for a delivery status notification, as
    /// specified in [RFC3464].
    /// Property ID: 0x0C21
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.34
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: PR_DSN_REMOTE_MTA, ptagDsnRemoteMta
    case tagRemoteMessageTransferAgent = 0x0C21

    // case unknown0x0C22 = 0x0C22
    
    // case unknown0x0C23 = 0x0C23
    
    case unknown0x0C24 = 0x0C24

    case unknown0x0C25 = 0x0C25
    
    // case unknown0xC26 = 0x0C26

    // case unknown0x0E00 = 0x0E00

    /// [MS-OXPROPS] 2.668 PidTagDeleteAfterSubmit
    /// Canonical name: PidTagDeleteAfterSubmit
    /// Description: Indicates that the original message is to be deleted after it is sent.
    /// Property ID: 0x0E01
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXOMSG] section 2.2.3.8
    /// Consuming references: [MS-OXCICAL], [MS-OXCSTOR], [MS-OXODOC]
    /// Alternate names: PR_DELETE_AFTER_SUBMIT, ptagDeleteAfterSubmit
    case tagDeleteAfterSubmit = 0x0E01

    /// [MS-OXPROPS] 2.674 PidTagDisplayBcc
    /// Canonical name: PidTagDisplayBcc
    /// Description: Contains a list of blind carbon copy (Bcc) recipient display names.
    /// Property ID: 0x0E02
    /// Data type: PtypString, 0x001F
    /// Area: Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.7
    /// Consuming reference: [MS-OXCMSG]
    /// Alternate names: PR_DISPLAY_BCC,
    case tagDisplayBcc = 0x0E02

    /// [MS-OXPROPS] 2.675 PidTagDisplayCc
    /// Canonical name: PidTagDisplayCc
    /// Description: Contains a list of carbon copy (Cc) recipient display names.
    /// Property ID: 0x0E03
    /// Data type: PtypString, 0x001F
    /// Area: Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.8
    /// Consuming references: [MS-OXCMSG]
    /// Alternate names: PR_DISPLAY_CC, PR_DISPLAY_CC_A, ptagDisplayCc, PR_DISPLAY_CC_W,
    /// urn:schemas:httpmail:displaycc
    case tagDisplayCc = 0x0E03

    /// [MS-OXPROPS] 2.678 PidTagDisplayTo
    /// Canonical name: PidTagDisplayTo
    /// Description: Contains a list of the primary recipient display names, separated by semicolons,
    /// when an email message has primary recipients .
    /// Property ID: 0x0E04
    /// Data type: PtypString, 0x001F
    /// Area: Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.9
    /// Consuming references: [MS-OXCMSG]
    /// Alternate names: PR_DISPLAY_TO, PR_DISPLAY_TO_A, ptagDisplayTo, PR_DISPLAY_TO_W
    case tagDisplayTo = 0x0E04

    /// PidTagParentDisplay
    /// Not documented in specification - known on internet
    /// Contains the display name of the folder where a message was found during a search.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagparentdisplay-canonical-property
    case tagParentDisplay = 0x0E05

    /// [MS-OXPROPS] 2.789 PidTagMessageDeliveryTime
    /// Canonical name: PidTagMessageDeliveryTime
    /// Description: Specifies the time (in UTC) when the server received the message.
    /// Property ID: 0x0E06
    /// Data type: PtypTime, 0x0040
    /// Area: Message Time Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.3.9
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCTABL], [MS-OXOCFG], [MS-OXODOC], [MS-OXOFLAG], [MS-OXPROTO], [MS-OXTNEF], [MSOXORSS]
    /// Alternate names: PR_MESSAGE_DELIVERY_TIME, urn:schemas:httpmail:datereceived
    case tagMessageDeliveryTime = 0x0E06

    /// [MS-OXPROPS] 2.791 PidTagMessageFlags
    /// Canonical name: PidTagMessageFlags
    /// Description: Specifies the status of the Message object.
    /// Property ID: 0x0E07
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.6
    /// Consuming references: [MS-OXOMSG], [MS-OXTNEF] [MS-OXCDATA], [MS-OXCFXICS], [MSOXCICAL], [MS-OXCMAIL], [MS-OXORMDR], [MS-OXORSS], [MS-OXORULE], [MS-OXOSFLD], [MSOXOSMMS]
    /// Alternate names: PR_MESSAGE_FLAGS, ptagMessageFlags
    case tagMessageFlags = 0x0E07

    /// [MS-OXPROPS] 2.796 PidTagMessageSize
    /// Canonical name: PidTagMessageSize
    /// Description: Contains the size, in bytes, consumed by the Message object on the server.
    /// Property ID: 0x0E08
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.10
    /// Consuming references: [MS-OXCSTOR], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMSG], [MSOXOCFG], [MS-OXPFOAB]
    /// Alternate names: PR_MESSAGE_SIZE, ptagMessageSize
    /// [MS-OXPROPS] 2.797 PidTagMessageSizeExtended
    /// Canonical name: PidTagMessageSizeExtended
    /// Description: Specifies the 64-bit version of the PidTagMessageSize property (section 2.796).
    /// Property ID: 0x0E08
    /// Data type: PtypInteger64, 0x0014
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.11
    /// Consuming reference: [MS-OXCSTOR]
    /// Alternate names: PR_MESSAGE_SIZE_EXTENDED, ptagMessageSizeExtended
    case tagMessageSize = 0x0E08

    /// [MS-OXPROPS] 2.858 PidTagParentEntryId
    /// Canonical name: PidTagParentEntryId
    /// Description: Contains the EntryID of the folder where messages or subfolders reside.
    /// Property ID: 0x0E09
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.7
    /// Consuming references: [MS-OXCDATA], [MS-OXCSPAM], [MS-OXOSFLD], [MS-OXPFOAB]
    /// Alternate names: PR_PARENT_ENTRYID, ptagParentEntryId
    case tagParentEntryId = 0x0E09

    /// [MS-OXPROPS] 2.887 PidTagSentMailEntryId
    /// Canonical name: PidTagSentMailEntryId
    /// Property ID: 0x0E0A
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiNonTransmittable
    /// References: [MS-OXCICAL]
    /// Alternate names: PR_SENTMAIL_ENTRYID, ptagSentMailEntryId
    /// Removed from specification
    case tagSentMailEntryId = 0x0E0A

    /// PidTagCorrelate
    /// Not documented in specification but known on internet
    /// Contains TRUE if the sender of a message requests the correlation feature of the messaging system.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcorrelate-canonical-property
    case tagCorrelate = 0x0E0C

    /// [MS-OXPROPS] 2.518 PidTagCorrelateMtsid
    /// Canonical name: PidTagCorrelateMtsid
    /// Property ID: 0x0E0D
    /// Data type: PtypBinary, 0x0102
    /// Area: Exchange
    /// References: [MS-OXCMAIL]
    /// Alternate names: PR_CORRELATE_MTSID
    case tagCorrelateMtsid = 0x0E0D

    /// PidTagDiscreteValues
    /// Not documented in specification but known on internet
    /// Contains TRUE if a nondelivery report applies only to discrete members of a distribution list rather than the entire list.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdiscretevalues-canonical-property
    case tagDiscreteValues = 0x0E0E

    /// [MS-OXPROPS] 2.931 PidTagResponsibility
    /// Canonical name: PidTagResponsibility
    /// Description: Specifies whether another mail agent has ensured that the message will be delivered.
    /// Property ID: 0x0E0F
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXCMSG] section 2.2.1.37
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: PR_RESPONSIBILITY, ptagResponsibility
    case tagResponsibility = 0x0E0F

    /// PidTagSpoolerStatus
    /// Not documented in specification but known on internet
    /// Contains the status of the message based on information that is available to the MAPI spooler.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagspoolerstatus-canonical-property
    case tagSpoolerStatus = 0x0E10

    /// [MS-OXPROPS] 2.795 PidTagMessageRecipients
    /// Canonical name: PidTagMessageRecipients
    /// Description: Identifies all of the recipients of the current message.
    /// Property ID: 0x0E12
    /// Data type: PtypObject, 0x000D
    /// Area: Address Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.47
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCSPAM], [MS-OXTNEF]
    /// Alternate names: PR_MESSAGE_RECIPIENTS, ptagMessageRecipients
    case tagMessageRecipients = 0x0E12

    /// [MS-OXPROPS] 2.785 PidTagMessageAttachments
    /// Canonical name: PidTagMessageAttachments
    /// Description: Identifies all attachments to the current message.
    /// Property ID: 0x0E13
    /// Data type: PtypObject, 0x000D
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.52
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS]
    /// Alternate names: PR_MESSAGE_ATTACHMENTS, ptagMessageAttachments
    case tagMessageAttachments = 0x0E13

    /// PidTagSubmitFlags
    /// Not documented in specification but known on internet
    /// Contains a bitmask of flags indicating details about a message submission.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsubmitflags-canonical-property
    case tagSubmitFlags = 0x0E14

    /// PidTagRecipientStatus
    /// Not documented in specification but known on internet
    /// Contains a value that is used by the MAPI spooler in assigning delivery responsibility among transport providers.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrecipientstatus-canonical-property
    case tagRecipientStatus = 0x0E15

    /// PidTagTransportKey
    /// Not documented in specification but known on internet
    /// Contains a value used by the MAPI spooler to track the progress of an outbound message through the outgoing transport providers.
    /// https://docs.microsoft.com/en-ca/office/client-developer/outlook/mapi/pidtagtransportkey-canonical-property
    case tagTransportKey = 0x0E16

    /// [MS-OXPROPS] 2.798 PidTagMessageStatus
    /// Canonical name: PidTagMessageStatus
    /// Description: Specifies the status of a message in a contents table.
    /// Property ID: 0x0E17
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.8
    /// Consuming references: [MS-OXCFXICS]
    /// Alternate names: PR_MSG_STATUS, ptagMsgStatus
    case tagMessageStatus = 0x0E17

    /// PidTagMessageDownloadTime
    /// Not documented in specification but known on internet
    /// Contains the estimated time to download a message from a remote server to a local message store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmessagedownloadtime-canonical-property
    case tagMessageDownloadTime = 0x0E18

    /// Not documented in specification - known on internet
    case tagCreationVersion = 0x0E19

    /// Not documented in specification - known on internet
    case tagModifyVersion = 0x0E1A

    /// [MS-OXPROPS] 2.716 PidTagHasAttachments
    /// Canonical name: PidTagHasAttachments
    /// Description: Indicates whether the Message object contains at least one attachment.
    /// Property ID: 0x0E1B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Message Attachment Properties Property set
    /// Defining reference: [MS-OXCMSG] section 2.2.1.2
    /// Consuming references: [MS-OXCICAL], [MS-OXOCFG], [MS-XWDCAL]
    /// Alternate names: PR_HASATTACH, ptagHasAttach, urn:schemas:httpmail:hasattachment
    case tagHasAttachments = 0x0E1B

    /// PidTagBodyCrc
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagbodycrc-canonical-property
    case tagBodyCrc = 0x0E1C

    /// [MS-OXPROPS] 2.812 PidTagNormalizedSubject
    /// Canonical name: PidTagNormalizedSubject
    /// Description: Contains the normalized subject of the message.
    /// Property ID: 0x0E1D
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.10
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXCPRPT], [MSOXOCAL], [MS-OXOCFG], [MS-OXOCNTC], [MS-OXODLGT], [MS-OXOFLAG], [MS-OXOMSG], [MSOXONOTE], [MS-OXOPFFB], [MS-OXOPOST], [MS-OXORMDR], [MS-OXORSS], [MS-OXOSMMS], [MSOXSHARE], [MS-OXTNEF], [MS-OXVCARD], [MS-XWDCAL]
    /// Alternate names: PR_NORMALIZED_SUBJECT, PR_NORMALIZED_SUBJECT_A,
    /// ptagNormalizedSubject, PR_NORMALIZED_SUBJECT_W, urn:schemas:httpmail:normalizedsubject
    case tagNormalizedSubject = 0x0E1D

    // case unknown0x0E1E = 0x0E1E

    /// [MS-OXPROPS] 2.942 PidTagRtfInSync
    /// Canonical name: PidTagRtfInSync
    /// Description: Indicates whether the PidTagBody property (section 2.618) and the
    /// PidTagRtfCompressed property (section 2.941) contain the same text (ignoring formatting).
    /// Property ID: 0x0E1F
    /// Data type: PtypBoolean, 0x000B
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.5
    /// Consuming references: [MS-OXBBODY], [MS-OXCFXICS], [MS-OXOMSG], [MS-OXORMMS], [MSOXRTFEX]
    /// Alternate names: PR_RTF_IN_SYNC, ptagRTFInSync
    case tagRtfInSync = 0x0E1F

    /// [MS-OXPROPS] 2.608 PidTagAttachSize
    /// Canonical name: PidTagAttachSize
    /// Description: Contains the size, in bytes, consumed by the Attachment object on the server.
    /// Property ID: 0x0E20
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.5
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXORMDR]
    /// Alternate names: PR_ATTACH_SIZE, ptagAttachSize
    case tagAttachSize = 0x0E20

    /// [MS-OXPROPS] 2.603 PidTagAttachNumber
    /// Canonical name: PidTagAttachNumber
    /// Description: Identifies the Attachment object within its Message object.
    /// Property ID: 0x0E21
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.6
    /// Consuming references: [MS-OXCFXICS], [MS-OXCROPS], [MS-OXOCAL], [MS-OXRTFEX]
    /// Alternate names: PR_ATTACH_NUM, ptagAttachNum
    case tagAttachNumber = 0x0E21

    /// PidTagPreprocess
    /// Not documented in specification but known on internet
    /// Contains TRUE if the message requires preprocessing.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagpreprocess-canonical-property
    case tagPreprocess = 0x0E22

    /// PidTagInternetArticleNumber
    /// Not documented in specification but known on internet
    /// A number associated with an item in a message store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetarticlenumber-canonical-property
    case tagInternetArticleNumber = 0x0E23

    // case unknown0x0E24 = 0x0E24

    /// PidTagOriginatingMtaCertificate
    /// Not documented in specification but known on internet
    /// Contains an identifier for the message transfer agent (MTA) that originated the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatingmtacertificate-canonical-property
    case tagOriginatingMtaCertificate = 0x0E25

    /// PidTagProofOfSubmission
    /// Not documented in specification but known on internet
    /// This property contains TRUE if a message sender requests proof that the message transfer system has submitted a message for delivery to the originally intended recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagproofofsubmission-canonical-property
    case tagProofOfSubmission = 0x0E26

    // case unknown0x0E27 = 0x0E27

    /// [MS-OXPROPS] 2.869 PidTagPrimarySendAccount
    /// Canonical name: PidTagPrimarySendAccount
    /// Description: Specifies the first server that a client is to use to send the email with.
    /// Property ID: 0x0E28
    /// Data type: PtypString, 0x001F
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXOMSG] section 2.2.1.64
    /// Alternate names: PR_PRIMARY_SEND_ACCT
    case tagPrimarySendAccount = 0x0E28

    /// [MS-OXPROPS] 2.806 PidTagNextSendAcct
    /// Canonical name: PidTagNextSendAcct
    /// Description: Specifies the server that a client is currently attempting to use to send email.
    /// Property ID: 0x0E29
    /// Data type: PtypString, 0x001F
    /// Area: Outlook Application
    /// Defining reference: [MS-OXOMSG] section 2.2.1.65
    /// Consuming Reference: [MS-OXCICAL]
    /// Alternate names: PR_NEXT_SEND_ACCT
    case tagNextSendAcct = 0x0E29

    // case unknown0x0E2A = 0x0E2A

    /// [MS-OXPROPS] 2.1048 PidTagToDoItemFlags
    /// Canonical name: PidTagToDoItemFlags
    /// Description: Contains flags associated with objects.
    /// Property ID: 0x0E2B
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.6
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOSFLD]
    /// Alternate names: PR_TODO_ITEM_FLAGS, ptagToDoItemFlags
    case tagToDoItemFlags = 0x0E2B

    /// [MS-OXPROPS] 2.1038 PidTagSwappedToDoStore
    /// Canonical name: PidTagSwappedToDoStore
    /// Description: Contains the value of the PidTagStoreEntryId property (section 2.1028) of the
    /// message when the value of the PidTagSwappedToDoData property (section 2.1037) is set.
    /// Property ID: 0x0E2C
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.8
    /// Consuming reference: [MS-OXORMDR], [MS-OXOSFLD]
    /// Alternate names: PR_SWAPPED_TODO_STORE, ptagSwappedTodoStore
    case tagSwappedToDoStore = 0x0E2C

    /// [MS-OXPROPS] 2.1037 PidTagSwappedToDoData
    /// Canonical name: PidTagSwappedToDoData
    /// Description: Contains a secondary storage location for flags when sender flags or sender reminders
    /// are supported.
    /// Property ID: 0x0E2D
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.7
    /// Consuming reference: [MS-OXORMDR]
    /// Alternate names: PR_SWAPPED_TODO_DATA, ptagSwappedTodoData
    case tagSwappedToDoData = 0x0E2D

    // case unknown0x0E2E = 0x0E2E

    /// Not documented in specification - unknown
    case unknown0x0E2F = 0x0E2F
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// 0x0E30 PtypInteger32 PidTagReplItemid Replication Item ID. N
    case tagReplItemid = 0x0E30
    
    /// case unknown0x0E31 = 0x0E31
    
    /// case unknown0x0E32 = 0x0E32
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// 0x0E33 PtypInteger64 PidTagReplChangenum Replication Change Number. N
    /// 0x0E33 PtypInteger6 4 PidTagReplChangenum Replication change number Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    case tagReplChangenum = 0x0E33
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication Version History. N
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication version history Y
    case tagReplVersionHistory = 0x0E34
    
    case unknown0x0E35 = 0x0E35
    
    // case unknown0x0E36 = 0x0E36

    case unknown0x0E37 = 0x0E37
    
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// 0x0E38 PtypInteger32 PidTagReplFlags Replication flags. Y
    case tagReplFlags = 0x0E38
    
    // case unknown0x0E39 = 0x0E39
    
    // case unknown0x0E3A = 0x0E3A
    
    // case unknown0x0E3B = 0x0E3B
    
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E3C PtypBinary PidTagReplCopiedfromVersionhistory Replication version information Y
    case tagReplCopiedfromVersionHistory = 0x0E3C
    
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x0E3D PtypBinary PidTagReplCopiedfromItemid Replication item ID information Y
    case tagReplCopiedfromItemid = 0x0E3D
    
    // case unknown0x0E3E = 0x0E3E
    
    // case unknown0x0E3F = 0x0E3F

    // case unknown0x0E4A = 0x0E4A

    /// Not documented in specification - unknown
    case unknown0x0E4B = 0x0E4B

    /// Not documented in specification - unknown
    case unknown0x0E4C = 0x0E4C

    /// Not documented in specification - PR_SENDER_SID
    case PR_SENDER_SID = 0x0E4D

    /// Not documented in specification - PR_SENT_REPRESENTING_SID
    case PR_SENT_REPRESENTING_SID = 0x0E4E

    /// Not documented in specification - PR_ORIGINAL_SENDER_SID
    case PR_ORIGINAL_SENDER_SID = 0x0E4F
    
    /// Not documented in specification  - PR_ORIGINAL_SENT_REPRESENTING_SID
    case PR_ORIGINAL_SENT_REPRESENTING_SID = 0x0E50
    
    /// Not documented in specification - PR_READ_RECEIPT_SID
    case PR_READ_RECEIPT_SID = 0x0E51
    
    /// Not documented in specification - PR_REPORT_SID
    case PR_REPORT_SID = 0x0E52
    
    /// Not documented in specification - PR_ORIGINATOR_SID
    case PR_ORIGINATOR_SID = 0x0E53
    
    /// Not documented in specification - PR_REPORT_DESTINATION_SID
    case PR_REPORT_DESTINATION_SID = 0x0E54
    
    /// Not documented in specification - PR_ORIGINAL_AUTHOR_SID
    case PR_ORIGINAL_AUTHOR_SID = 0x0E55
    
    /// Not documented in specification - PR_RECEIVED_BY_SID
    case PR_RECEIVED_BY_SID = 0x0E56
    
    /// Not documented in specification - PR_RCVD_REPRESENTING_SID
    case PR_RCVD_REPRESENTING_SID = 0x0E57
    
    /// Not documented in specification - PR_CREATOR_SID
    case PR_CREATOR_SID = 0x0E58

    /// Not documented in specification - PR_LAST_MODIFIER_SID
    case PR_LAST_MODIFIER_SID = 0x0E59

    // case unknown0x0E5A = 0x0E5A
    
    /// Not documented in specification - PR_CATALOG
    case PR_CATALOG = 0x0E5B
    
    /// Not documented in specification - PR_CI_SEARCH_ENABLED
    case PR_CI_SEARCH_ENABLED = 0x0E5C
    
    /// Not documented in specification - PR_CI_NOTIFICATION_ENABLED
    case PR_CI_NOTIFICATION_ENABLED = 0x0E5D
    
    /// Not documented in specification - PR_MAX_INDICES
    case PR_MAX_INDICES = 0x0E5E
    
    /// Not documented in specification - PR_SOURCE_FID
    case PR_SOURCE_FID = 0x0E5F

    /// Not documented in specification - PR_URL_COMP_NAME_POSTFIX
    case PR_URL_COMP_NAME_POSTFIX = 0x0E61

    /// [MS-OXPROPS] 2.1184 PidTagUrlCompNameSet
    /// Canonical name: PidTagUrlCompNameSet
    /// Property ID: 0x0E62
    /// Data type: PtypBoolean, 0x000B
    /// Area: ID Properties
    /// References: [MS-OXCMSG]
    /// Alternate names: ptagURLCompNameSet
    /// Not documented in specification - removed
    case tagUrlCompNameSet = 0x0E62

    /// Not documented in specification - known on internet
    case tagSubfolderCt = 0x0E63

    /// Not documented in specification - known on internet
    case tagDeletedSubfolderCt = 0x0E64

    //// Not documented in specification - known on internet
    case unknown0x0E65 = 0x0E65

    //// Not documented in specification - known on internet
    case tagDeleteTime = 0x0E66

    /// Not documented in specification - known on internet
    case tagAgeLimit = 0x0E67

    /// Not documented in specification - PR_MAX_CACHED_VIEWS
    case PR_MAX_CACHED_VIEWS = 0x0E68

    /// [MS-OXPROPS] 2.878 PidTagRead
    /// Canonical name: PidTagRead
    /// Description: Indicates whether a message has been read.
    /// Property ID: 0x0E69
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiNonTransmittable Property set
    /// Defining reference: [MS-OXCMSG] section 2.2.1.53
    /// Consuming references: [MS-OXCICAL], [MS-OXCMAIL], [MS-OXCTABL], [MS-XWDCAL]
    /// Alternate names: PR_READ, ptagRead, urn:schemas:httpmail:read
    case tagRead = 0x0E69

    /// [MS-OXPROPS] 2.998 PidTagSecurityDescriptorAsXml
    /// Canonical name: PidTagSecurityDescriptorAsXml
    /// Description: Contains security attributes in XML.
    /// Property ID: 0x0E6A
    /// Data type: PtypString, 0x001F
    /// Area: Access Control Properties
    /// Defining reference: [MS-XWDVSEC] section 2.2.2
    /// Consuming reference: [MS-OXCPERM]
    /// Alternate names: PR_NT_SECURITY_DESCRIPTOR_AS_XML,
    /// PR_NT_SECURITY_DESCRIPTOR_AS_XML_A, PR_NT_SECURITY_DESCRIPTOR_AS_XML_W,
    /// http://schemas.microsoft.com/exchange/security/descriptor
    case tagSecurityDescriptorAsXml = 0x0E6A

    // case unknown0x0E6B = 0x0E6B

    // case unknown0x0E78 = 0x0E78

    /// [MS-OXPROPS] 2.1051 PidTagTrustSender
    /// Canonical name: PidTagTrustSender
    /// Description: Specifies whether the associated message was delivered through a trusted transport
    /// channel.
    /// Property ID: 0x0E79
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXCMSG] section 2.2.1.45
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMSG]
    /// Alternate names: PR_TRUST_SENDER, ptagTrustSender
    case tagTrustSender = 0x0E79

    // case unknown0x0E7A = 0x0E7A

    // case unknown0x0E82 = 0x0E82

    // case unknown0x0E83 = 0x0E83

    /// [MS-OXPROPS] 2.687 PidTagExchangeNTSecurityDescriptor
    /// Canonical name: PidTagExchangeNTSecurityDescriptor
    /// Description: Contains the calculated security descriptor for the item.
    /// Property ID: 0x0E84
    /// Data type: PtypBinary, 0x0102
    /// Area: Calendar Document
    /// Defining reference: [MS-XWDCAL] section 2.2.8.8
    /// Alternate names: http://schemas.microsoft.com/exchange/ntsecuritydescriptor,
    /// http://schemas.microsoft.com/exchange/ntsecuritydescriptor
    case tagExchangeNTSecurityDescriptor = 0x0E84

    // case unknown0x0E86 = 0x0E85

    // case unknown0x0E86 = 0x0E86

    // case unknown0x0E87 = 0x0E87

    // case unknown0x0E88 = 0x0E88

    // case unknown0x0E89 = 0x0E89

    // case unknown0x0E8A = 0x0E8A

    // case unknown0x0E8B = 0x0E8B

    // case unknown0x0E8C = 0x0E8C

    // case unknown0x0E8D = 0x0E8D

    // case unknown0x0E8E = 0x0E8E

    // case unknown0x0E8F = 0x0E8F

    // case unknown0x0E90 = 0x0E90

    // case unknown0x0E91 = 0x0E91

    // case unknown0x0E92 = 0x0E92

    // case unknown0x0E93 = 0x0E93

    // case unknown0x0E94 = 0x0E94

    // case unknown0x0E95 = 0x0E95

    // case unknown0x0E96 = 0x0E96

    // case unknown0x0E98 = 0x0E97

    // case unknown0x0E99 = 0x0E99

    /// [MS-OXPROPS] 2.692 PidTagExtendedRuleMessageActions
    /// Canonical name: PidTagExtendedRuleMessageActions
    /// Description: Contains action information about named properties used in the rule.
    /// Property ID: 0x0E99
    /// Data type: PtypBinary, 0x0102
    /// Area: Rules
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.9
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: PR_EXTENDED_RULE_MSG_ACTIONS
    case tagExtendedRuleMessageActions = 0x0E99

    /// [MS-OXPROPS] 2.693 PidTagExtendedRuleMessageCondition
    /// Canonical name: PidTagExtendedRuleMessageCondition
    /// Description: Contains condition information about named properties used in the rule.
    /// Property ID: 0x0E9A
    /// Data type: PtypBinary, 0x0102
    /// Area: Rules
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.10
    /// Consuming references: [MS-OXCPRPT], [MS-OXCSPAM]
    /// Alternate names: PR_EXTENDED_RULE_MSG_CONDITION
    case tagExtendedRuleMessageCondition = 0x0E9A

    /// [MS-OXPROPS] 2.694 PidTagExtendedRuleSizeLimit
    /// Canonical name: PidTagExtendedRuleSizeLimit
    /// Description: Contains the maximum size, in bytes, that the user is allowed to accumulate for a single
    /// extended rule.
    /// Property ID: 0x0E9B
    /// Data type: PtypInteger32, 0x0003
    /// Area: Rules
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.1
    /// Consuming Reference: [MS-OXORULE]
    /// Alternate names: PR_EXTENDED_RULE_SIZE_LIMIT
    case tagExtendedRuleSizeLimit = 0x0E9B

    /// PidTagTnefUnprocessedProps
    /// Not documented in specification but known on internet
    /// Serializes properties when filtering Transport Neutral Encapsulation Format (TNEF).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagtnefunprocessedprops-canonical-property
    case tagTnefUnprocessedProps = 0x0E9C

    /// Not documented in specification - unknown
    case unknown0x0E9D = 0x0E9D

    // case unknown0x0E9E = 0x0E9E

    // case unknown0x0ECC = 0x0ECC

    /// Not documented in specification - unknown
    case unknown0x0ECD = 0x0ECD

    // case unknown0x0ECE = 0x0ECE

    // case unknown0x0F01 = 0x0F01

    /// Not documented in specification - unknown
    case unknown0x0F02 = 0x0F02

    /// Not documented in specification - unknown
    case unknown0x0F03 = 0x0F03

    // case unknown0x0F04 = 0x0F04

    // case unknown0x0F09 = 0x0F09

    /// Not documented in specification - unknown
    case unknown0x0F0A = 0x0F0A

    // case unknown0x0F0B = 0x0F0B

    // case unknown0x0FF3 = 0x0FF3

    /// [MS-OXPROPS] 2.505 PidTagAccess
    /// Canonical name: PidTagAccess
    /// Description: Indicates the operations available to the client for the object.
    /// Property ID: 0x0FF4
    /// Data type: PtypInteger32, 0x0003
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.1
    /// Consuming references: [MS-OXCFXICS], [MS-OXCFOLD], [MS-OXCICAL], [MS-OXCMSG], [MSOXCPRPT], [MS-OXOJRNL]
    /// Alternate names: PR_ACCESS, ptagAccess
    case tagAccess = 0x0FF4

    /// [MS-OXPROPS] 2.940 PidTagRowType
    /// Canonical name: PidTagRowType
    /// Description: Identifies the type of the row.
    /// Property ID: 0x0FF5
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiNonTransmittable
    /// Defining reference: [MS-OXCTABL] section 2.2.1.3
    /// Alternate names: PR_ROW_TYPE, ptagRowType
    case tagRowType = 0x0FF5

    /// [MS-OXPROPS] 2.743 PidTagInstanceKey
    /// Canonical name: PidTagInstanceKey
    /// Description: Contains an object on an NSPI server.
    /// Property ID: 0x0FF6
    /// Data type: PtypBinary, 0x0102
    /// Area: Table Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.6
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMSG], [MS-OXNSPI], [MS-OXOABKT]
    /// Alternate names: PR_INSTANCE_KEY, ptagInstanceKey
    case tagInstanceKey = 0x0FF6

    /// [MS-OXPROPS] 2.507 PidTagAccessLevel
    /// Canonical name: PidTagAccessLevel
    /// Description: Indicates the client's access level to the object.
    /// Property ID: 0x0FF7
    /// Data type: PtypInteger32, 0x0003
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.2
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMSG]
    /// Alternate names: PR_ACCESS_LEVEL, ptagAccessLevel
    case tagAccessLevel = 0x0FF7

    /// [MS-OXPROPS] 2.780 PidTagMappingSignature
    /// Canonical name: PidTagMappingSignature
    /// Description: A 16-byte constant that is present on all Address Book objects, but is not present on
    /// objects in an offline address book.
    /// Property ID: 0x0FF8
    /// Data type: PtypBinary, 0x0102
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.32
    /// Consuming reference: [MS-OXNSPI]
    /// Alternate names: PR_MAPPING_SIGNATURE, ptagMappingSignature
    case tagMappingSignature = 0x0FF8

    /// [MS-OXPROPS] 2.910 PidTagRecordKey
    /// Canonical name: PidTagRecordKey
    /// Description: Contains a unique binary-comparable identifier for a specific object.
    /// Property ID: 0x0FF9
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.8
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOCFG], [MSOXOABK]
    /// Alternate names: PR_RECORD_KEY, ptagRecordKey
    case tagRecordKey = 0x0FF9

    /// PidTagStoreRecordKey
    /// Not documented in specification but known on internet
    /// Contains the unique binary-comparable identifier (record key) of the message store in which an object resides.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstorerecordkey-canonical-property
    case tagStoreRecordKey = 0x0FFA

    /// [MS-OXPROPS] 2.1028 PidTagStoreEntryId
    /// Canonical name: PidTagStoreEntryId
    /// Description: Contains the unique EntryID of the message store where an object resides.
    /// Property ID: 0x0FFB
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.44
    /// Consuming references: [MS-OXOFLAG], [MS-OXSHARE], [MS-OXOCFG]
    /// Alternate names: PR_STORE_ENTRYID, ptagStoreEntryId
    case tagStoreEntryId = 0x0FFB

    /// PidTagMiniIcon
    /// Not documented in specification but known on internet
    /// Contains a bitmap of a half-size icon for a form.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagminiicon-canonical-property
    case tagMiniIcon = 0x0FFC

    /// PidTagIcon
    /// Not documented in specification but known on internet
    /// Contains a bitmap of a full size icon for a form.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagicon-canonical-property
    case tagIcon = 0x0FFD

    /// [MS-OXPROPS] 2.813 PidTagObjectType
    /// Canonical name: PidTagObjectType
    /// Description: Indicates the type of Server object.
    /// Property ID: 0x0FFE
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.7
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXCMSG], [MSOXNSPI], [MS-OXOAB], [MS-OXOABK], [MS-OXOMSG], [MS-OXOSRCH]
    /// Alternate names: PR_OBJECT_TYPE, ptagObjectType
    case tagObjectType = 0x0FFE

    /// [MS-OXPROPS] 2.683 PidTagEntryId
    /// Canonical name: PidTagEntryId
    /// Description: Contains the information to identify many different types of messaging objects.
    /// Property ID: 0x0FFF
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCPERM] section 2.2.4
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCMSG], [MS-OXNSPI], [MS-OXOABK], [MS-OXOABKT], [MS-OXOCAL], [MS-OXOCFG], [MS-
    /// OXOCNTC], [MS-OXODLGT], [MS-OXOMSG], [MS-OXORULE], [MS-OXOSRCH], [MS-OXOTASK], [MSOXPFOAB], [MS-OXSHARE], [MS-OXWAVLS]
    /// Alternate names: PR_ENTRYID, ptagEntryId
    case tagEntryId = 0x0FFF

    /// [MS-OXPROPS] 2.618 PidTagBody
    /// Canonical name: PidTagBody
    /// Description: Contains message body text in plain text format.
    /// Property ID: 0x1000
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.1
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOMSG], [MS-OXORMMS], [MSOXRTFEX], [MS-OXBBODY], [MS-OXCDATA], [MS-OXCMAIL], [MS-OXONOTE], [MS-OXOSMMS], [MSOXPROTO], [MS-OXTNEF], [MS-XWDCAL], [MS-OXVCARD]
    /// Alternate names: PR_BODY, PR_BODY_A, ptagBody, PR_BODY_W,
    /// urn:schemas:httpmail:textdescription
    case tagBody = 0x1000

    /// PidTagReportText
    /// Not documented in specification but known on internet
    /// Contains optional text for a report generated by the messaging system.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreporttext-canonical-property
    case tagReportText = 0x1001

    /// PidTagOriginatorAndDistributionListExpansionHistory
    /// Not documented in specification but known on internet
    /// Contains information about a message originator and a distribution list expansion history.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginatoranddistributionlistexpansionhistory-canonical-property
    case tagOriginatorAndDistributionListExpansionHistory = 0x1002

    /// PidTagReportingDistributionListName
    /// Not documented in specification but known on internet
    /// Contains the display name of a distribution list where the messaging system delivers a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportingdistributionlistname-canonical-property
    case tagReportingDistributionListName = 0x1003

    /// PidTagReportingMessageTransferAgentCertificate
    /// Not documented in specification but known on internet
    /// Contains an identifier for the message transfer agent that generated a report.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagreportingmessagetransferagentcertificate-canonical-property
    case tagReportingMessageTransferAgentCertificate = 0x1004

    /// PidTagRtfSyncBodyCrc
    /// Not documented in specification but known on internet
    /// Contains the cyclical redundancy check (CRC) computed for the message text.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodycrc-canonical-property
    case tagRtfSyncBodyCrc = 0x1006

    /// PidTagRtfSyncBodyCount
    /// Not documented in specification but known on internet
    /// Contains a count of the significant characters of the message text.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodycount-canonical-property
    case tagRtfSyncBodyCount = 0x1007

    /// PidTagRtfSyncBodyTag
    /// Not documented in specification but known on internet
    /// Contains significant characters that appear at the beginning of the message text.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncbodytag-canonical-property
    case tagRtfSyncBodyTag = 0x1008

    /// [MS-OXPROPS] 2.941 PidTagRtfCompressed
    /// Canonical name: PidTagRtfCompressed
    /// Description: Contains message body text in compressed RTF format.
    /// Property ID: 0x1009
    /// Data type: PtypBinary, 0x0102
    /// Area: Email
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.4
    /// Consuming references: [MS-OXBBODY], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOCAL], [MSOXOCNTC], [MS-OXOJRNL], [MS-OXOMSG], [MS-OXORMMS], [MS-OXRTFCP], [MS-OXRTFEX], [MSOXTNEF]
    /// Alternate names: PR_RTF_COMPRESSED, ptagRTFCompressed
    case tagRtfCompressed = 0x1009

    /// PidTagRtfSyncPrefixCount
    /// Not documented in specification but known on internet
    /// Contains a count of the ignorable characters that appear before the significant characters of the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsyncprefixcount-canonical-property
    case tagRtfSyncPrefixCount = 0x1010

    /// PidTagRtfSyncTrailingCount
    /// Not documented in specification but known on internet
    /// Contains a count of the ignorable characters that appear after the significant characters of the message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrtfsynctrailingcount-canonical-property
    case tagRtfSyncTrailingCount = 0x1011

    /// PidTagOriginallyIntendedRecipEntryId
    /// Not documented in specification but known on internet
    /// Contains the entry identifier of the originally intended recipient of an auto-forwarded message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginallyintendedrecipentryid-canonical-property
    case tagOriginallyIntendedRecipEntryId = 0x1012

    /// [MS-OXPROPS] 2.621 PidTagBodyHtml
    /// Canonical name: PidTagBodyHtml
    /// Description: Contains the HTML body of the Message object.
    /// Property ID: 0x1013
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.3
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOMSG], [MS-OXORMMS], [MSOXRTFEX]
    /// Alternate names: PR_BODY_HTML, PR_BODY_HTML_A, ptagBodyHtml, PR_BODY_HTML_W
    /// [MS-OXPROPS] 2.733 PidTagHtml
    /// Canonical name: PidTagHtml
    /// Description: Contains message body text in HTML format.
    /// Property ID: 0x1013
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.9
    /// Consuming references: [MS-OXBBODY], [MS-OXCMAIL], [MS-OXOPOST], [MS-OXORMMS], [MSOXORSS], [MS-OXOSMMS]
    /// Alternate names: PR_HTML, ptagHtml
    case tagBodyHtml = 0x1013

    /// [MS-OXPROPS] 2.620 PidTagBodyContentLocation
    /// Canonical name: PidTagBodyContentLocation
    /// Description: Contains a globally unique Uniform Resource Identifier (URI) that serves as a label
    /// for the current message body.
    /// Property ID: 0x1014
    /// Data type: PtypString, 0x001F
    /// Area: MIME Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.8
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_BODY_CONTENT_LOCATION, PR_BODY_CONTENT_LOCATION_A,
    /// PR_BODY_CONTENT_LOCATION_W
    case tagBodyContentLocation = 0x1014

    /// [MS-OXPROPS] 2.619 PidTagBodyContentId
    /// Canonical name: PidTagBodyContentId
    /// Description: Contains a GUID that corresponds to the current message body.
    /// Property ID: 0x1015
    /// Data type: PtypString, 0x001F
    /// Area: Exchange
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.7
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_BODY_CONTENT_ID, PR_BODY_CONTENT_ID_A, PR_BODY_CONTENT_ID_W
    case tagBodyContentId = 0x1015

    /// [MS-OXPROPS] 2.805 PidTagNativeBody
    /// Canonical name: PidTagNativeBody
    /// Description: Indicates the best available format for storing the message body.
    /// Property ID: 0x1016
    /// Data type: PtypInteger32, 0x0003
    /// Area: BestBody
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.2
    /// Consuming Reference: [MS-OXBBODY]
    /// Alternate names: PR_NATIVE_BODY_INFO, ptagNativeBodyInfo
    case tagNativeBody = 0x1016

    // case unknown0x1017 = 0x1017

    // case unknown0x1018 = 0x1018

    // case unknown0x1019 = 0x1019

    // case unknown0x101A = 0x101A

    // case unknown0x101B = 0x101B

    // case unknown0x101C = 0x101C

    // case unknown0x101D = 0x101D

    // case unknown0x101E = 0x101E

    // case unknown0x101F = 0x101F

    // case unknown0x1020 = 0x1020

    // case unknown0x1021 = 0x1021

    // case unknown0x1022 = 0x1022

    // case unknown0x1023 = 0x1023

    // case unknown0x1024 = 0x1024

    // case unknown0x1025 = 0x1025

    // case unknown0x1026 = 0x1026

    // case unknown0x1027 = 0x1027

    // case unknown0x1028 = 0x1028

    // case unknown0x1029 = 0x1029

    // case unknown0x102A = 0x102A

    // case unknown0x102B = 0x102B

    // case unknown0x102C = 0x102C

    // case unknown0x102D = 0x102D

    // case unknown0x102E = 0x102E

    // case unknown0x102F = 0x102F

    /// PidTagInternetApproved
    /// Not documented in specification but known on internet
    /// Maps to the MIME Approved header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetapproved-canonical-property
    case tagInternetApproved = 0x1030

    /// PidTagInternetControl
    /// Not documented in specification but known on internet
    /// Maps to the MIME Control header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetcontrol-canonical-property
    case tagInternetControl = 0x1031

    /// PidTagInternetDistribution
    /// Not documented in specification but known on internet
    /// Maps to the MIME Distribution header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetdistribution-canonical-property
    case tagInternetDistribution = 0x1032

    /// PidTagInternetFollowupTo
    /// Not documented in specification but known on internet
    /// Maps to the MIME Followup-To header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetfollowupto-canonical-property
    case tagInternetFollowupTo = 0x1033

    /// PidTagInternetLines
    /// Not documented in specification but known on internet
    /// Maps to the MIME Lines header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetlines-canonical-property
    case tagInternetLines = 0x1034

    /// [MS-OXPROPS] 2.748 PidTagInternetMessageId
    /// Canonical name: PidTagInternetMessageId
    /// Description: Corresponds to the message-id field.
    /// Property ID: 0x1035
    /// Data type: PtypString, 0x001F
    /// Area: MIME Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.12
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXTNEF]
    /// Alternate names: PR_INTERNET_MESSAGE_ID, PR_INTERNET_MESSAGE_ID_A,
    /// PR_INTERNET_MESSAGE_ID_W
    case tagInternetMessageId = 0x1035

    // case unknown0x1036 = 0x1036

    /// PidTagInternetOrganization
    /// Not documented in specification but known on internet
    /// Maps to the MIME Organization header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetorganization-canonical-property
    case tagInternetOrganization = 0x1037

    /// PidTagInternetNntpPath
    /// Not documented in specification but known on internet
    /// Maps to the MIME Path header.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaginternetnntppath-canonical-property
    case tagInternetNntpPath = 0x1038

    /// [MS-OXPROPS] 2.749 PidTagInternetReferences
    /// Canonical name: PidTagInternetReferences
    /// Description: Contains a list of message IDs that specify the messages to which this reply is related.
    /// Property ID: 0x1039
    /// Data type: PtypString, 0x001F
    /// Area: MIME Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.26
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_INTERNET_REFERENCES, PR_INTERNET_REFERENCES_A,
    /// PR_INTERNET_REFERENCES_W
    case tagInternetReferences = 0x1039

    // case unknown0x1040 = 0x1040

    // case unknown0x1041 = 0x1041

    /// [MS-OXPROPS] 2.742 PidTagInReplyToId
    /// Canonical name: PidTagInReplyToId
    /// Description: Contains the value of the original message's PidTagInternetMessageId property
    /// (section 2.748) value.
    /// Property ID: 0x1042
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.13
    /// Consuming Reference: [MS-OXCMAIL]
    /// Alternate names: PR_IN_REPLY_TO_ID, PR_IN_REPLY_TO_ID_A, PR_IN_REPLY_TO_ID_W
    case tagInReplyToId = 0x1042

    /// [MS-OXPROPS] 2.769 PidTagListHelp
    /// Canonical name: PidTagListHelp
    /// Description: Contains a URI that provides detailed help information for the mailing list from which an
    /// email message was sent.
    /// Property ID: 0x1043
    /// Data type: PtypString, 0x001F
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.81
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_LIST_HELP, PR_LIST_HELP_A, PR_LIST_HELP_W
    case tagListHelp = 0x1043

    /// [MS-OXPROPS] 2.770 PidTagListSubscribe
    /// Canonical name: PidTagListSubscribe
    /// Description: Contains the URI that subscribes a recipient to a message’s associated mailing list.
    /// Property ID: 0x1044
    /// Data type: PtypString, 0x001F
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.82
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_LIST_SUBSCRIBE, PR_LIST_SUBSCRIBE_A, PR_LIST_SUBSCRIBE_W
    case tagListSubscribe = 0x1044

    /// [MS-OXPROPS] 2.771 PidTagListUnsubscribe
    /// Canonical name: PidTagListUnsubscribe
    /// Description: Contains the URI that unsubscribes a recipient from a message’s associated mailing
    /// list.
    /// Property ID: 0x1045
    /// Data type: PtypString, 0x001F
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.83
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_LIST_UNSUBSCRIBE, PR_LIST_UNSUBSCRIBE_A, PR_LIST_UNSUBSCRIBE_W
    case tagListUnsubscribe = 0x1045

    /// [MS-OXPROPS] 2.831 PidTagOriginalMessageId
    /// Canonical name: PidTagOriginalMessageId
    /// Description: Contains the message ID of the original message included in replies or resent messages.
    /// Property ID: 0x1046
    /// Data type: PtypString, 0x001F
    /// Area: Mail
    /// Defining reference: [MS-OXOMSG] section 2.2.1.85
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagOriginalInternetMessageID, OriginalMessageId
    case tagOriginalMessageId = 0x1046

    /// case unknown0x1047 = 0x1047

    /// [MS-OXPROPS] 2.737 PidTagIconIndex
    /// Canonical name: PidTagIconIndex
    /// Description: Specifies which icon is to be used by a user interface when displaying a group of
    /// Message objects.
    /// Property ID: 0x1080
    /// Data type: PtypInteger32, 0x0003
    /// Area: General Message Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.10
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOCNTC], [MSOXOJRNL], [MS-OXOMSG], [MS-OXONOTE], [MS-OXOPOST], [MS-OXOSMMS], [MS-OXOTASK], [MSOXTNEF]
    /// Alternate names: PR_ICON_INDEX, ptagIconIndex
    case tagIconIndex = 0x1080

    /// [MS-OXPROPS] 2.767 PidTagLastVerbExecuted
    /// Canonical name: PidTagLastVerbExecuted
    /// Description: Specifies the last verb executed for the message item to which it is related.
    /// Property ID: 0x1081
    /// Data type: PtypInteger32, 0x0003
    /// Area: History Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.14
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: PR_LAST_VERB_EXECUTED, ptagLastVerbExecuted
    case tagLastVerbExecuted = 0x1081

    /// [MS-OXPROPS] 2.768 PidTagLastVerbExecutionTime
    /// Canonical name: PidTagLastVerbExecutionTime
    /// Description: Contains the date and time, in UTC, during which the operation represented in the
    /// PidTagLastVerbExecuted property (section 2.767) took place.
    /// Property ID: 0x1082
    /// Data type: PtypTime, 0x0040
    /// Area: History Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.15
    /// Consuming Reference: [MS-OXCICAL]
    /// Alternate names: PR_LAST_VERB_EXECUTION_TIME, ptagLastVerbExecutionTime
    case tagLastVerbExecutionTime = 0x1082

    // case unknown0x1083 = 0x1083

    // case unknown0x1084 = 0x1084

    // case unknown0x1085 = 0x1085

    // case unknown0x1086 = 0x1086

    // case unknown0x1087 = 0x1087

    // case unknown0x1088 = 0x1088

    // case unknown0x1089 = 0x1089

    // case unknown0x108A = 0x108A

    // case unknown0x108B = 0x108B

    // case unknown0x108C = 0x108C

    // case unknown0x108D = 0x108D

    // case unknown0x108E = 0x108E

    // case unknown0x108F = 0x108F

    /// [MS-OXPROPS] 2.697 PidTagFlagStatus
    /// Canonical name: PidTagFlagStatus
    /// Description: Specifies the flag state of the Message object.
    /// Property ID: 0x1090
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.1
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOCFG], [MS-OXORMDR], [MSOXOSFLD]
    /// Alternate names: PR_FLAG_STATUS, ptagFlagStatus
    case tagFlagStatus = 0x1090

    /// PidTagFlagCompleteTime
    /// Not documented in specification but known on internet
    /// Specifies the date and time in Coordinated Universal Time (UTC) that the message object was flagged as completed.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagflagcompletetime-canonical-property
    case tagFlagCompleteTime = 0x1091

    case unknown0x1092 = 0x1092

    // case unknown0x1093 = 0x1093

    // case unknown0x1094 = 0x1094

    /// [MS-OXPROPS] 2.703 PidTagFollowupIcon
    /// Canonical name: PidTagFollowupIcon
    /// Description: Specifies the flag color of the Message object.
    /// Property ID: 0x1095
    /// Data type: PtypInteger32, 0x0003
    /// Area: RenMessageFolder
    /// Defining reference: [MS-OXOFLAG] section 2.2.1.2
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCFG], [MS-OXOSFLD]
    /// Alternate names: PR_FOLLOWUP_ICON, ptagFollowupIcon
    case tagFollowupIcon = 0x1095

    /// [MS-OXPROPS] 2.617 PidTagBlockStatus
    /// Canonical name: PidTagBlockStatus
    /// Description: Indicates the user's preference for viewing external content (such as links to images on
    /// an HTTP server) in the message body.
    /// Property ID: 0x1096
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.1
    /// Alternate names: PR_BLOCK_STATUS, ptagBlockStatus
    case tagBlockStatus = 0x1096

    /// PidTagItemTemporaryflags
    /// Not documented in specification but known on internet
    /// Contains a flag that indicates that a message has been read, but not marked as read.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagitemtemporaryflags-canonical-property
    case tagItemTemporaryflags = 0x1097

    /// PidTagConflictItems
    /// Not documented in specification but known on internet
    /// Contains one or more entry IDs of items that have been involved in an automatic conflict resolution.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconflictitems-canonical-property
    case tagConflictItems = 0x1098

    // case unknown0x1099 = 0x1099
    
    // case unknown0x10C2 = 0x10C2
    
    /// [MS-OXPROPS] 2.736 PidTagICalendarStartTime
    /// Canonical name: PidTagICalendarStartTime
    /// Description: Contains the date and time, in UTC, when the appointment or meeting starts.
    /// Property ID: 0x10C3
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar Property set
    /// Defining reference: [MS-XWDCAL] section 2.2.2.41
    /// Alternate names: urn:schemas:calendar:dtstart
    case tagICalendarStartTime = 0x10C3
    
    /// [MS-OXPROPS] 2.734 PidTagICalendarEndTime
    /// Canonical name: PidTagICalendarEndTime
    /// Description: Contains the date and time, in UTC, when an appointment or meeting ends.
    /// Property ID: 0x10C4
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference:[MS-XWDCAL] section 2.2.2.39
    /// Alternate names: urn:schemas:calendar:dtend
    case tagICalendarEndTime = 0x10C4
    
    /// [MS-XWDCAL] 2.630 PidTagCdoRecurrenceid
    /// Canonical name: PidTagCdoRecurrenceid
    /// Description: Identifies a specific instance of a recurring appointment.
    /// Property ID: 0x10C5
    /// Data type: PtypTime, 0x0040
    /// Area: Exchange
    /// Defining reference: [MS-XWDCAL] section 2.2.2.38
    /// Alternate names: PR_CDO_RECURRENCEID, urn:schemas:calendar:recurrenceid
    case tagCdoRecurrenceid = 0x10C5
    
    // case unknown0x10C6 = 0x10C6
    
    // case unknown0x10C87 = 0x10C7
    
    // case unknown0x10C8 = 0x10C8
    
    // case unknown0x10C89 = 0x10C9

    /// [MS-OXPROPS] 2.735 PidTagICalendarReminderNextTime
    /// Canonical name: PidTagICalendarReminderNextTime
    /// Description: Contains the date and time, in UTC, for the activation of the next reminder.
    /// Property ID: 0x10CA
    /// Data type: PtypTime, 0x0040
    /// Area: Calendar
    /// Defining reference: [MS-XWDCAL] section 2.2.2.40
    /// Alternate names: urn:schemas:calendar:remindernexttime
    case tagICalendarReminderNextTime = 0x10CA
    
    // case unknown0x10CB = 0x10CB
    
    // case unknown0x10F0 = 0x10F0
    
    /// Not documented in specification - known on internet
    case tagOwaUrl = 0x10F1
    
    /// Not documented in specification - known on internet
    case tagDisableFullFidelity = 0x10F2

    /// PidTagUrlComponentName
    /// The URL component name for a message.
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagurlcomponentname-canonical-property
    case tagUrlComponentName = 0x10F3

    /// [MS-OXPROPS] 2.611 PidTagAttributeHidden
    /// Canonical name: PidTagAttributeHidden
    /// Description: Specifies the hide or show status of a folder.
    /// Property ID: 0x10F4
    /// Data type: PtypBoolean, 0x000B
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.1
    /// Consuming references: [MS-OXOSFLD], [MS-OXTNEF], [MS-XWDCAL]
    /// Alternate names: PR_ATTR_HIDDEN, ptagAttrHidden, DAV:ishidden
    case tagAttributeHidden = 0x10F4

    /// Not documented in specification - removed
    case tagAttributeSystem = 0x10F5
    
    /// [MS-OXPROPS] 2.612 PidTagAttributeReadOnly
    /// Canonical name: PidTagAttributeReadOnly
    /// Description: Indicates whether an item can be modified or deleted.
    /// Property ID: 0x10F6
    /// Data type: PtypBoolean, 0x000B
    /// Area: Access Control Properties
    /// Defining reference: [MS-XWDCAL] section 2.2.1.8
    /// Consuming references: [MS-OXTNEF]
    /// Alternate names: PR_ATTR_READONLY, ptagAttrReadonly, DAV:isreadonly
    case tagAttributeReadOnly = 0x10F6
    
    // case unknown0x10F7 = 0x10F7

    // case unknown0x1206 = 0x1206
    
    case unknown0x1207 = 0x1207
    
    // case unknown0x1208 = 0x1208
    
    // case unknown0x1209 = 0x1209
    
    // case unknown0x120A = 0x120A

    case unknown0x120B = 0x120B
    
    // case unknown0x120B = 0x120B
    
    // case unknown0x1212 = 0x1212
    
    case unknown0x1213 = 0x1213
    
    // case unknown0x1214 = 0x1214

    /// [MS-OXPROPS] 2.939 PidTagRowid
    /// Canonical name: PidTagRowid
    /// Description: Contains a unique identifier for a recipient in a message's recipient table
    /// Property ID: 0x3000
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiCommon
    /// Defining reference: [MS-OXCMSG] section 2.2.1.38
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: PR_ROWID, ptagRowId
    case tagRowid = 0x3000

    /// [MS-OXPROPS] 2.676 PidTagDisplayName
    /// Canonical name: PidTagDisplayName
    /// Description: Contains the display name of the folder.
    /// Property ID: 0x3001
    /// Data type: PtypString, 0x001F
    /// Area: MapiCommon
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.5
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCMSG], [MS-OXCPRPT], [MS-OXCSTOR], [MS-OXMSG], [MS-OXNSPI], [MS-OXOAB], [MSOXOABK], [MS-OXOABKT], [MS-OXOCAL], [MS-OXOCNTC], [MS-OXODLGT], [MS-OXODOC], [MSOXOPFFB], [MS-OXORMDR], [MS-OXORMMS], [MS-OXORULE], [MS-OXOSMIME], [MS-OXOSRCH],
    /// [MS-OXSHARE], [MS-OXVCARD], [MS-XWDVSEC]
    /// Alternate names: PR_DISPLAY_NAME, PR_DISPLAY_NAME_A, ptagDisplayName,
    /// PR_DISPLAY_NAME_W, urn:schemas:contacts:cn
    case tagDisplayName = 0x3001

    /// [MS-OXPROPS] 2.576 PidTagAddressType
    /// Canonical name: PidTagAddressType
    /// Description: Contains the email address type of a Message object.
    /// Property ID: 0x3002
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.13
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCMSG], [MS-OXOCAL], [MS-OXCSTOR], [MS-OXNSPI], [MS-OXOABKT], [MS-OXOMSG], [MSOXORULE], [MS-OXOSRCH], [MS-OXPSVAL]
    /// Alternate names: PR_ADDRTYPE, PR_ADDRTYPE_A, ptagAddrType, PR_ADDRTYPE_W
    case tagAddressType = 0x3002

    /// [MS-OXPROPS] 2.681 PidTagEmailAddress
    /// Canonical name: PidTagEmailAddress
    /// Description: Contains the email address of a Message object.
    /// Property ID: 0x3003
    /// Data type: PtypString, 0x001F
    /// Area: MapiCommon
    /// Defining reference: [MS-OXOABK] section 2.2.3.14
    /// Consuming references: [MS-OXCDATA], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCMSG], [MS-OXCSPAM], [MS-OXNSPI], [MS-OXOAB], [MS-OXOABKT], [MS-OXODLGT], [MSOXOMSG], [MS-OXOPFFB], [MS-OXORULE], [MS-OXOSRCH], [MS-OXPSVAL]
    /// Alternate names: PR_EMAIL_ADDRESS, PR_EMAIL_ADDRESS_A, PR_EMAIL_ADDRESS_W
    case tagEmailAddress = 0x3003

    /// [MS-OXPROPS] 2.637 PidTagComment
    /// Canonical name: PidTagComment
    /// Description: Contains a comment about the purpose or content of the Address Book object.
    /// Property ID: 0x3004
    /// Data type: PtypString, 0x001F
    /// Area: Common
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.2
    /// Consuming references: [MS-OXOAB], [MS-OXOABK], [MS-OXCFXICS], [MS-OXCICAL], [MSOXCSTOR], [MS-XWDCAL]
    /// Alternate names: PR_COMMENT, PR_COMMENT_A, ptagComment, PR_COMMENT_W, DAV:comment,
    /// http://schemas.microsoft.com/exchange/summary-utf8
    case tagComment = 0x3004

    /// [MS-OXPROPS] 2.673 PidTagDepth
    /// Canonical name: PidTagDepth
    /// Description: Specifies the number of nested categories in which a given row is contained.
    /// Property ID: 0x3005
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiCommon
    /// Defining reference: [MS-OXCTABL] section 2.2.1.4
    /// Consuming references: [MS-OXNSPI], [MS-OXOABK], [MS-OXOABKT]
    /// Alternate names: PR_DEPTH, ptagDepth
    case tagDepth = 0x0305

    /// PidTagProviderDisplay
    /// Not documented in specification but known on internet
    /// Contains the vendor-defined display name for a service provider.
    /// https://docs.microsoft.com/en-US/office/client-developer/outlook/mapi/pidtagproviderdisplay-canonical-property
    case tagProviderDisplay = 0x0306

    /// [MS-OXPROPS] 2.654 PidTagCreationTime
    /// Canonical name: PidTagCreationTime
    /// Description: Contains the time, in UTC, that the object was created.
    /// Property ID: 0x3007
    /// Data type: PtypTime, 0x0040
    /// Area: Message Time Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.3
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MSOXCPRPT], [MS-OXOABK], [MS-OXOCFG], [MS-OXODOC], [MS-OXORMMS], [MS-OXTNEF]
    /// Alternate names: PR_CREATION_TIME, ptagCreationTime, DAV:creationdate
    case tagCreationTime = 0x3007

    /// [MS-OXPROPS] 2.764 PidTagLastModificationTime
    /// Canonical name: PidTagLastModificationTime
    /// Description: Contains the time, in UTC, of the last modification to the object.
    /// Property ID: 0x3008
    /// Data type: PtypTime, 0x0040
    /// Area: Message Time Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.2
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCPRPT], [MS-OXTNEF], [MSOXCICAL], [MS-OXCMAIL], [MS-OXCROPS], [MS-OXOABK], [MS-OXOCFG], [MS-OXORMDR], [MSOXORMMS], [MS-OXVCARD], [MS-XWDCAL]
    /// Alternate names: PR_LAST_MODIFICATION_TIME, ptagLastModificationTime,
    /// urn:schemas:calendar:lastmodifiedtime, DAV:getlastmodified
    case tagLastModificationTime = 0x3008

    /// PidTagResourceFlags
    /// Not documented in specification but known on internet
    /// Contains a bitmask of flags for message services and providers.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagresourceflags-canonical-property
    case tagResourceFlags = 0x0309

    // case unknown0x030A = 0x030A

    /// [MS-OXPROPS] 2.997 PidTagSearchKey
    /// Canonical name: PidTagSearchKey
    /// Description: Contains a unique binary-comparable key that identifies an object for a search.
    /// Property ID: 0x300B
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.9
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOCFG], [MSOXOABK], [MS-OXOJRNL], [MS-OXOMSG], [MS-OXOPOST], [MS-OXORULE], [MS-OXOTASK], [MSOXTNEF]
    /// Alternate names: PR_SEARCH_KEY, ptagSearchKey
    case tagSearchKey = 0x300B

    /// PidTagProviderUid
    /// Not documented in specification but known on internet
    /// Contains a MAPIUID structure of the service provider that is handling a message.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagprovideruid-canonical-property
    case tagProviderUid = 0x030C

    // case unknown0x030D = 0x030D

    // case unknown0x030E = 0x030E

    // case unknown0x030F = 0x030F

    /// [MS-OXPROPS] 2.1039 PidTagTargetEntryId
    /// Canonical name: PidTagTargetEntryId
    /// Description: Contains the message ID of a Message object being submitted for optimization ([MSOXOMSG] section 3.2.4.4).
    /// Property ID: 0x3010
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.76
    /// Consuming references: [MS-OXCFXICS], [MS-OXCRPC]
    /// Alternate names: PR_TARGET_ENTRYID, ptagTargetEntryId
    case tagTargetEntryId = 0x3010

    // case unknown0x3011 = 0x3011

    // case unknown0x3012 = 0x3012

    /// [MS-OXPROPS] 2.649 PidTagConversationId
    /// Canonical name: PidTagConversationId
    /// Description: Contains a computed value derived from other conversation-related properties.
    /// Property ID: 0x3013
    /// Data type: PtypBinary, 0x0102
    /// Area: Conversations
    /// Defining reference: [MS-OXOMSG] section 2.2.1.2
    /// Consuming references: [MS-OXOCFG]
    /// Alternate names: PR_CONVERSATION_ID
    case tagConversationId = 0x3013

    case unknown0x3014 = 0x3014

    // case unknown0x3015 = 0x3015

    /// [MS-OPROPS] 2.651 PidTagConversationIndexTracking
    /// Canonical name: PidTagConversationIndexTracking
    /// Description: Indicates whether the GUID portion of the PidTagConversationIndex property
    /// (section 2.650) is to be used to compute the PidTagConversationId property (section 2.649).
    /// Property ID: 0x3016
    /// Data type: PtypBoolean, 0x000B
    /// Area: Conversations
    /// Defining reference: [MS-OXOMSG] section 2.2.1.4
    /// Alternate names: PR_CONVERSATION_INDEX_TRACKING
    case tagConversationIndexTracking = 0x3016

    // case unknown0x3017 = 0x3017

    /// [MS-OXPROPS] 2.581 PidTagArchiveTag
    /// Canonical name: PidTagArchiveTag
    /// Description: Specifies the GUID of an archive tag.
    /// Property ID: 0x3018
    /// Data type: PtypBinary, 0x0102
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.1
    /// Alternate names: PR_ARCHIVE_TAG, ptagArchiveTag
    case tagArchiveTag = 0x3018

    /// [MS-OXPROPS] 2.863 PidTagPolicyTag
    /// Canonical name: PidTagPolicyTag
    /// Description: Specifies the GUID of a retention tag.
    /// Property ID: 0x3019
    /// Data type: PtypBinary, 0x0102
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.2
    /// Alternate names: PR_POLICY_TAG, ptagPolicyTag
    case tagPolicyTag = 0x3019

    /// [MS-OXPROPS] 2.934 PidTagRetentionPeriod
    /// Canonical name: PidTagRetentionPeriod
    /// Description: Specifies the number of days that a Message object can remain unarchived.
    /// Property ID: 0x301A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.3
    /// Alternate names: PR_RETENTION_PERIOD, ptagRetentionPeriod
    case tagRetentionPeriod = 0x301A

    /// [MS-OXPROPS] 2.1026 PidTagStartDateEtc
    /// Canonical name: PidTagStartDateEtc
    /// Description: Contains the default retention period, and the start date from which the age of a
    /// Message object is calculated.
    /// Property ID: 0x301B
    /// Data type: PtypBinary, 0x0102
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.4
    /// Alternate names: PR_START_DATE_ETC, ptagStartDateEtc
    case tagStartDateEtc = 0x301B

    /// [MS-OXPROPS] 2.932 PidTagRetentionDate
    /// Canonical name: PidTagRetentionDate
    /// Description: Specifies the date, in UTC, after which a Message object is expired by the server.
    /// Property ID: 0x301C
    /// Data type: PtypTime, 0x0040
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.5
    /// Alternate names: PR_RETENTION_DATE, ptagRetentionDate
    case tagRetentionDate = 0x301C

    /// [MS-OXPROPS] 2.933 PidTagRetentionFlags
    /// Canonical name: PidTagRetentionFlags
    /// Description: Contains flags that specify the status or nature of an item's retention tag or archive
    /// tag.
    /// Property ID: 0x301D
    /// Data type: PtypInteger32, 0x0003
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.6
    /// Alternate names: PR_RETENTION_FLAGS, ptagRetentionFlags
    case tagRetentionFlags = 0x301D

    /// [MS-OXPROPS] 2.580 PidTagArchivePeriod
    /// Canonical name: PidTagArchivePeriod
    /// Description: Specifies the number of days that a Message object can remain unarchived.
    /// Property ID: 0x301E
    /// Data type: PtypInteger32, 0x0003
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.7
    /// Alternate names: PR_ARCHIVE_PERIOD, ptagArchivePeriod
    case tagArchivePeriod = 0x301E

    /// [MS-OXPROPS] 2.579 PidTagArchiveDate
    /// Canonical name: PidTagArchiveDate
    /// Description: Specifies the date, in UTC, after which a Message object is archived by the server.
    /// Property ID: 0x301F
    /// Data type: PtypTime, 0x0040
    /// Area: Archive
    /// Defining reference: [MS-OXCMSG] section 2.2.1.58.8
    /// Alternate names: PR_ARCHIVE_DATE, ptagArchiveDate
    case tagArchiveDate = 0x301F

    // case unknown0x3020 = 0x3020

    // case unknown0x340C = 0x340C

    /// [MS-OXPROPS] 2.1030 PidTagStoreSupportMask
    /// Canonical name: PidTagStoreSupportMask
    /// Description: Indicates whether string properties within the .msg file are Unicode-encoded.
    /// Property ID: 0x340D
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXMSG] section 2.1.1.1
    /// Alternate names: PR_STORE_SUPPORT_MASK, ptagStoreSupportMask
    case tagStoreSupportMask = 0x340D

    /// [MS-OXPROPS] 2.1029 PidTagStoreState
    /// Canonical name: PidTagStoreState
    /// Description: Indicates whether a mailbox has any active Search folders.
    /// Property ID: 0x340E
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiMessageStore
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1
    /// Alternate names: PR_STORE_STATE
    case tagStoreState = 0x340E

    /// PidTagStoreUnicodeMask
    /// Not documented in specification but known on internet
    /// Contains a bitmask of flags that client applications should query to determine the characteristics of a message store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoreunicodemask-canonical-property
    case tagStoreUnicodeMask = 0x340F

    // case unknown0x3410 = 0x3410
    
    // case unknown0x35DE = 0x35DE
    
    /// PidTagValidFolderMask
    /// Not documented in specification but known on internet
    /// Contains a bitmask of flags that indicate the validity of the entry identifiers of the folders in a message store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagvalidfoldermask-canonical-property
    case tagValidFolderMask = 0x35DF
    
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E0 PtypBinary PidTagIpmSubTreeEntryId EntryID of the Root Mailbox Folder
    case tagIpmSubTreeEntryId = 0x35E0
    
    // case unknown0x35E1 = 0x35E1
    
    /// PidTagIpmOutboxEntryId
    /// Not documented in specification but known on internet
    /// Contains the entry identifier of the standard interpersonal message (IPM) Outbox folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmoutboxentryid-canonical-property
    case tagIpmOutboxEntryId = 0x35E2
    
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E3 PtypBinary PidTagIpmWastebasketEntryId EntryID of the Deleted Items Folder object
    /// PidTagIpmOutboxEntryId
    /// Not documented in specification but known on internet
    /// Contains the entry identifier of the standard interpersonal message (IPM) Deleted Items folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmwastebasketentryid-canonical-property
    case tagIpmWastebasketEntryId = 0x35E3
    
    /// PidTagIpmSentMailEntryId
    /// Contains the entry identifier of the standard interpersonal message (IPM) Sent Items folder.
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagipmwastebasketentryid-canonical-property
    case tagIpmSentMailEntryId = 0x35E4
    
    /// PidTagViewsEntryId
    /// Contains the entry identifier of the user-defined Views folder.
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagviewsentryid-canonical-property
    case tagViewsEntryId = 0x35E5
    
    /// PidTagCommonViewsEntryId
    /// Contains the entry identifier of the predefined common view folder.
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcommonviewsentryid-canonical-property
    case tagCommonViewsEntryId = 0x35E6
    
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x35E7 PtypBinary PidTagFinderEntryId EntryID of the search Folder object
    /// PidTagFinderEntryId
    /// Contains the entry identifier for the folder where search results are typically created.
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagfinderentryid-canonical-property
    case tagFinderEntryId = 0x35E7
    
    /// Not documented in specification - PR_IPM_INBOX_ENTRYID
    case PR_IPM_INBOX_ENTRYID = 0x35E8

    // case unknown0x35E9 = 0x35E9

    // case unknown0x35FF = 0x35FF

    /// [MS-OXPROPS] 2.644 PidTagContainerFlags
    /// Canonical name: PidTagContainerFlags
    /// Description: Contains a bitmask of flags that describe capabilities of an address book container.
    /// Property ID: 0x3600
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.2.1
    /// Consuming reference: [MS-OXNSPI]
    /// Alternate names: PR_CONTAINER_FLAGS
    case tagContainerFlags = 0x3600

    /// [MS-OXPROPS] 2.702 PidTagFolderType
    /// Canonical name: PidTagFolderType
    /// Description: Specifies the type of a folder that includes the Root folder, Generic folder, and Search
    /// folder.
    /// Property ID: 0x3601
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiContainer
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.7
    /// Consuming references: [MS-OXCICAL], [MS-OXOSRCH]
    /// Alternate names: PR_FOLDER_TYPE, ptagFolderType
    case tagFolderType = 0x3601

    /// [MS-OXPROPS] 2.646 PidTagContentCount
    /// Canonical name: PidTagContentCount
    /// Description: Specifies the number of rows under the header row.
    /// Property ID: 0x3602
    /// Data type: PtypInteger32, 0x0003
    /// Area: Folder Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.1
    /// Consuming references: [MS-OXCICAL], [MS-OXCSTOR], [MS-OXCTABL]
    /// Alternate names: PR_CONTENT_COUNT, ptagContentCount, DAV:visiblecount
    case tagContentCount = 0x3602

    /// [MS-OXPROPS] 2.648 PidTagContentUnreadCount
    /// Canonical name: PidTagContentUnreadCount
    /// Description: Specifies the number of rows under the header row that have the PidTagRead property
    /// (section 2.878) set to FALSE.
    /// Property ID: 0x3603
    /// Data type: PtypInteger32, 0x0003
    /// Area: Folder Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.2
    /// Consuming references: [MS-OXCTABL]
    /// Alternate names: PR_CONTENT_UNREAD, ptagContentUnread, urn:schemas:httpmail:unreadcount
    case tagContentUnreadCount = 0x3603

    /// PidTagCreateTemplates
    /// Not documented in specification but known on internet
    /// Contains an embedded table object that contains dialog box template entry identifiers.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcreatetemplates-canonical-property
    case tagCreateTemplates = 0x3604

    /// PidTagDetailsTable
    /// Not documented in specification but known on internet
    /// Contains an embedded display table object.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdetailstable-canonical-property
    case tagDetailsTable = 0x3605

    // case unknown0x3606 = 0x3606

    /// PidTagSearch
    /// Not documented in specification but known on internet
    /// Contains a container object that is used for advanced searches.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagsearch-canonical-property
    case tagSearch = 0x3607

    // case unknown0x3608 = 0x3608

    /// [MS-OXPROPS] 2.999 PidTagSelectable
    /// Canonical name: PidTagSelectable
    /// Description: This property is not set and, if set, is ignored.
    /// Property ID: 0x3609
    /// Data type: PtypBoolean, 0x000B
    /// Area: AB Container
    /// Defining reference: [MS-OXOABKT] section 2.2.1
    /// Alternate names: PR_SELECTABLE
    case tagSelectable = 0x3609

    /// [MS-OXPROPS] 2.1032 PidTagSubfolders
    /// Canonical name: PidTagSubfolders
    /// Description: Specifies whether a folder has subfolders.
    /// Property ID: 0x360A
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiContainer
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.12
    /// Alternate names: PR_SUBFOLDERS, ptagSubFolders, DAV:hassubs
    case tagSubfolders = 0x360A

    /// PidTagStatus
    /// Not documented in specification but known on internet
    /// Contains a 32-bit bitmask of flags that define folder status.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstatus-canonical-property
    case tagStatus = 0x360B

    /// [MS-OXPROPS] 2.578 PidTagAnr
    /// Canonical name: PidTagAnr
    /// Description: Contains a filter value used in ambiguous name resolution.
    /// Property ID: 0x360C
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.10.1
    /// Alternate names: PR_ANR, PR_ANR_A, PR_ANR_W
    case tagAnr = 0x360C

    // case unknown0x360D = 0x360D

    /// [MS-OXPROPS] 2.645 PidTagContainerHierarchy
    /// Canonical name: PidTagContainerHierarchy
    /// Description: Identifies all of the subfolders of the current folder.
    /// Property ID: 0x360E
    /// Data type: PtypObject, 0x000D
    /// Area: Container Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.4
    /// Consuming references: [MS-OXCFXICS]
    /// Alternate names: PR_CONTAINER_HIERARCHY, ptagContainerHierarchy
    case tagContainerHierarchy = 0x360E

    /// [MS-OXPROPS] 2.643 PidTagContainerContents
    /// Canonical name: PidTagContainerContents
    /// Description: Empty. An NSPI server defines this value for distribution lists and it is not present for
    /// other objects.
    /// Property ID: 0x360F
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Container Properties
    /// Defining reference: [MS-OXOABK] section 2.2.6.3
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXNSPI]
    /// Alternate names: PR_CONTAINER_CONTENTS, ptagContainerContents
    case tagContainerContents = 0x360F

    /// [MS-OXPROPS] 2.699 PidTagFolderAssociatedContents
    /// Canonical name: PidTagFolderAssociatedContents
    /// Description: Identifies all FAI messages in the current folder.
    /// Property ID: 0x3610
    /// Data type: PtypObject, 0x000D
    /// Area: MapiContainer
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.6
    /// Consuming references: [MS-OXCFXICS]
    /// Alternate names: PR_FOLDER_ASSOCIATED_CONTENTS
    case tagFolderAssociatedContents = 0x3610

    /// PidTagDefCreateDl
    /// Not documented in specification but known on internet
    /// Contains the template entry identifier for a default distribution list.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefcreatedl-canonical-property
    case tagDefCreateDl = 0x3611

    /// PidTagDefCreateMailuser
    /// Not documented in specification but known on internet
    /// Contains the template entry identifier for a default messaging user object.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefcreatemailuser-canonical-property
    case tagDefCreateMailuser = 0x3612

    /// [MS-OXPROPS] 2.642 PidTagContainerClass
    /// Canonical name: PidTagContainerClass
    /// Description: Contains a string value that describes the type of Message object that a folder
    /// contains.
    /// Property ID: 0x3613
    /// Data type: PtypString, 0x001F
    /// Area: Container Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.3
    /// Consuming references: [MS-OXCICAL], [MS-OXMSG], [MS-OXOCAL], [MS-OXOCNTC], [MSOXOSFLD], [MS-OXOSRCH], [MS-OXSHARE], [MS-XWDCAL]
    /// Alternate names: PR_CONTAINER_CLASS, PR_CONTAINER_CLASS_A, ptagContainerClass,
    /// PR_CONTAINER_CLASS_W,
    /// http://schemas.microsoft.com/exchange/outlookfolderclasshttp://schemas.microsoft.com/exchange/o
    /// utlookfolderclass
    case tagContainerClass = 0x3613

    // case unknown0x3614 = 0x3614

    /// PidTagAbProviderId
    /// Not documented in specification but known on internet
    /// Contains an address book provider's MAPIUID structure.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabproviderid-canonical-property
    case tagAbProviderId = 0x3615

    /// PidTagDefaultViewEntryId
    /// Not documented in specification but known on internet
    /// Contains the entry identifier of a folder's default view.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagdefaultviewentryid-canonical-property
    case tagDefaultViewEntryId = 0x3616

    /// PidTagAssociatedContentCount
    /// Not documented in specification but known on internet
    /// Contains the count of items in the associated contents table of the folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagassociatedcontentcount-canonical-property
    case tagAssociatedContentCount = 0x3617

    // case unknown0x3618 = 0x3618

    // case unknown0x3619 = 0x3619

    // case unknown0x3644 = 0x3644

    case unknown0x3645 = 0x3645

    // case unknown0x3646 = 0x3646

    // case unknown0x3659 = 0x3659

    case unknown0x365A = 0x365A

    // case unknown0x365B = 0x365B

    // case unknown0x3662 = 0x3662

    case unknown0x3663 = 0x3663

    // case unknown0x3664 = 0x3664

    // case unknown0x3665 = 0x3665

    case unknown0x3666 = 0x3666

    // case unknown0x3667 = 0x3667

    case unknown0x3668 = 0x3668

    // case unknown0x3669 = 0x3669

    // case unknown0x3676 = 0x3676

    case unknown0x3677 = 0x3677

    // case unknown0x3678 = 0x3678

    // case unknown0x36CF = 0x36CF

    /// [MS-OXPROPS] 2.750 PidTagIpmAppointmentEntryId
    /// Canonical name: PidTagIpmAppointmentEntryId
    /// Description: Contains the EntryID of the Calendar folder.
    /// Property ID: 0x36D0
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Consuming references: [MS-OXODLGT]
    /// Alternate names: PR_IPM_APPOINTMENT_ENTRYID
    case tagIpmAppointmentEntryId = 0x36D0

    /// [MS-OXPROPS] 2.751 PidTagIpmContactEntryId
    /// Canonical name: PidTagIpmContactEntryId
    /// Description: Contains the EntryID of the Contacts folder.
    /// Property ID: 0x36D1
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Consuming references: [MS-OXODLGT]
    /// Alternate names: PR_IPM_CONTACT_ENTRYID
    case tagIpmContactEntryId = 0x36D1

    /// [MS-OXPROPS] 2.753 PidTagIpmJournalEntryId
    /// Canonical name: PidTagIpmJournalEntryId
    /// Description: Contains the EntryID of the Journal folder.
    /// Property ID: 0x36D2
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Consuming references: [MS-OXODLGT]
    /// Alternate names: PR_IPM_JOURNAL_ENTRYID
    case tagIpmJournalEntryId = 0x36D2

    /// [MS-OXPROPS] 2.754 PidTagIpmNoteEntryId
    /// Canonical name: PidTagIpmNoteEntryId
    /// Description: Contains the EntryID of the Notes folder.
    /// Property ID: 0x36D3
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Consuming references: [MS-OXODLGT]
    /// Alternate names: PR_IPM_NOTE_ENTRYID
    case tagIpmNoteEntryId = 0x36D3

    /// [MS-OXPROPS] 2.755 PidTagIpmTaskEntryId
    /// Canonical name: PidTagIpmTaskEntryId
    /// Description: Contains the EntryID of the Tasks folder.
    /// Property ID: 0x36D4
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Consuming references: [MS-OXODLGT]
    /// Alternate names: PR_IPM_TASK_ENTRYID
    case tagIpmTaskEntryId = 0x36D4

    /// [MS-OXPROPS] 2.912 PidTagRemindersOnlineEntryId
    /// Canonical name: PidTagRemindersOnlineEntryId
    /// Description: Contains an EntryID for the Reminders folder.
    /// Property ID: 0x36D5
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiContainer
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Alternate names: PR_REM_ONLINE_ENTRYID, ptagRemOnlineEntryId
    case tagRemindersOnlineEntryId = 0x36D5

    // case unknown0x36D6 = 0x36D6

    /// [MS-OXPROPS] 2.752 PidTagIpmDraftsEntryId
    /// Canonical name: PidTagIpmDraftsEntryId
    /// Description: Contains the EntryID of the Drafts folder.
    /// Property ID: 0x36D7
    /// Data type: PtypBinary, 0x0102
    /// Area: Folder Properties
    /// Defining reference: [MS-OXOSFLD] section 2.2.3
    /// Alternate names: PR_IPM_DRAFTS_ENTRYID
    case tagIpmDraftsEntryId = 0x36D7

    /// [MS-OXPROPS] 2.509 PidTagAdditionalRenEntryIds
    /// Canonical name: PidTagAdditionalRenEntryIds
    /// Description: Contains the indexed entry IDs for several special folders related to conflicts, sync
    /// issues, local failures, server failures, junk email and spam.
    /// Property ID: 0x36D8
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Outlook Application
    /// Defining reference: [MS-OXOSFLD] section 2.2.4
    /// Consuming references: [MS-OXCSPAM], [MS-OXPHISH]
    /// Alternate names: PR_ADDITIONAL_REN_ENTRYIDS, ptagAdditionalRenEntryIds
    case tagAdditionalRenEntryIds = 0x36D8

    /// [MS-OXPROPS] 2.510 PidTagAdditionalRenEntryIdsEx
    /// Canonical name: PidTagAdditionalRenEntryIdsEx
    /// Description: Contains an array of blocks that specify the EntryIDs of several special folders.
    /// Property ID: 0x36D9
    /// Data type: PtypBinary, 0x0102
    /// Area: Outlook Application
    /// Defining reference: [MS-OXOSFLD] section 2.2.5
    /// Alternate names: PR_ADDITIONAL_REN_ENTRYIDS_EX, ptagAdditionalRenEntryIdsEx
    case tagAdditionalRenEntryIdsEx = 0x36D9

    /// [MS-OXPROPS] 2.691 PidTagExtendedFolderFlags
    /// Canonical name: PidTagExtendedFolderFlags
    /// Description: Contains encoded sub-properties for a folder.
    /// Property ID: 0x36DA
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiContainer
    /// Defining reference: [MS-OXOSRCH] section 2.2.2.1.2
    /// Consuming references: [MS-OXCICAL], [MS-OXOCFG]
    /// Alternate names: PR_EXTENDED_FOLDER_FLAGS, ptagExtendedFolderFlags
    case tagExtendedFolderFlags = 0x36DA

    // case unknown0x36DB = 0x36DB

    // case unknown0x36DC = 0x36DC

    // case unknown0x36DD = 0x36DD

    // case unknown0x36DE = 0x36DE

    /// PidTagFolderWebViewInfo
    /// Not documented in specification but known on internet
    /// Contains the URL for the home page of a folder in Microsoft Outlook. This property contains a binary stream called WebViewPersistenceObject.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagfolderwebviewinfo-cannonical-property
    case tagFolderWebViewInfo = 0x36DF

    // case unknown0x36E0 = 0x36E0

    // case unknown0x36E1 = 0x36E1

    /// [MS-OXPROPS] 2.821 PidTagOrdinalMost
    /// Canonical name: PidTagOrdinalMost
    /// Description: Contains a positive number whose negative is less than or equal to the value of the
    /// PidLidTaskOrdinal property (section 2.327) of all of the Task objects in the folder.
    /// Property ID: 0x36E2
    /// Data type: PtypInteger32, 0x0003
    /// Area: Tasks
    /// Defining reference: [MS-OXOTASK] section 2.2.1.1
    /// Alternate names: PR_ORDINAL_MOST
    case tagOrdinalMost = 0x36E2

    /// PidTagUserFields
    /// Not documented in specification but known on internet
    /// Contains the name, data type, and other information about a user-defined field.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaguserfields-canonical-property
    case tagUserFields = 0x36E3

    /// [MS-OXPROPS] 2.705 PidTagFreeBusyEntryIds
    /// Canonical name: PidTagFreeBusyEntryIds
    /// Description: Contains EntryIDs of the Delegate Information object, the free/busy message of the
    /// logged on user, and the folder with the PidTagDisplayName property (section 2.676) value of
    /// "Freebusy Data".
    /// Property ID: 0x36E4
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: MapiContainer
    /// Defining reference: [MS-OXOSFLD] section 2.2.6
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_FREEBUSY_ENTRYIDS, ptagFreeBusyEntryIds
    case tagFreeBusyEntryIds = 0x36E4

    /// [MS-OXPROPS] 2.660 PidTagDefaultPostMessageClass
    /// Canonical name: PidTagDefaultPostMessageClass
    /// Description: Contains the message class of the object.
    /// Property ID: 0x36E5
    /// Data type: PtypString, 0x001F
    /// Area: MapiContainer
    /// Defining reference: [MS-OXOCAL] section 2.2.11.2
    /// Alternate names: PR_DEF_POST_MSGCLASS
    case tagDefaultPostMessageClass = 0x36E5

    // case unknown0x36E6 = 0x36E6

    // case unknown0x3700 = 0x3700

    /// [MS-OXPROPS] 2.589 PidTagAttachDataBinary
    /// Canonical name: PidTagAttachDataBinary
    /// Description: Contains the contents of the file to be attached.
    /// Property ID: 0x3701
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    // case tagAttachDataObject
    case tagAttachDataBinary = 0x3701

    /// [MS-OXPROPS] 2.591 PidTagAttachEncoding
    /// Canonical name: PidTagAttachEncoding
    /// Description: Contains encoding information about the Attachment object.
    /// Property ID: 0x3702
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.20
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXORMDR], [MSOXTNEF]
    /// Alternate names: PR_ATTACH_ENCODING
    case tagAttachEncoding = 0x3702

    /// [MS-OXPROPS] 2.592 PidTagAttachExtension
    /// Canonical name: PidTagAttachExtension
    /// Description: Contains a file name extension that indicates the document type of an attachment.
    /// Property ID: 0x3703
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.12
    /// Consuming references: [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOCNTC], [MS-OXODOC], [MSOXORMMS], [MS-OXVCARD]
    /// Alternate names: PR_ATTACH_EXTENSION, PR_ATTACH_EXTENSION_A,
    /// PR_ATTACH_EXTENSION_W
    case tagAttachExtension = 0x3703

    /// [MS-OXPROPS] 2.593 PidTagAttachFilename
    /// Canonical name: PidTagAttachFilename
    /// Description: Contains the 8.3 name of the PidTagAttachLongFilename property (section 2.595).
    /// Property ID: 0x3704
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.11
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXTNEF], [MSOXOCNTC], [MS-OXORMMS], [MS-OXOSMIME], [MS-OXPFOAB], [MS-OXVCARD]
    /// Alternate names: PR_ATTACH_FILENAME, PR_ATTACH_FILENAME_A, ptagAttachFilename,
    /// PR_ATTACH_FILENAME_W
    case tagAttachFilename = 0x3704

    /// [MS-OXPROPS] 2.601 PidTagAttachMethod
    /// Canonical name: PidTagAttachMethod
    /// Description: Represents the way the contents of an attachment are accessed.
    /// Property ID: 0x3705
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.9
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXODOC], [MSOXOJRNL], [MS-OXORMDR], [MS-OXOSMMS], [MS-OXOTASK], [MS-OXRTFEX], [MS-OXCMAIL], [MSOXMSG], [MS-OXORMMS], [MS-OXORSS], [MS-OXOSMIME], [MS-OXPFOAB], [MS-OXTNEF]
    /// Alternate names: PR_ATTACH_METHOD, ptagAttachMethod
    case tagAttachMethod = 0x3705

    // case unknown0x3706 = 0x3706

    /// [MS-OXPROPS] 2.595 PidTagAttachLongFilename
    /// Canonical name: PidTagAttachLongFilename
    /// Description: Contains the full filename and extension of the Attachment object.
    /// Property ID: 0x3707
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.10
    /// Consuming references: [MS-OXCICAL], [MS-OXOSMMS], [MS-OXRTFEX], [MS-OXCMAIL], [MSOXMSG], [MS-OXORMMS], [MS-OXOSMIME], [MS-OXODOC], [MS-OXOUM], [MS-OXTNEF]
    case tagAttachLongFilename = 0x3707

    /// [MS-OXPROPS] 2.604 PidTagAttachPathname
    /// Canonical name: PidTagAttachPathname
    /// Description: Contains the 8.3 name of the PidTagAttachLongPathname property (section 2.596).
    /// Property ID: 0x3708
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.14
    /// Consuming reference: [MS-OXORMMS]
    /// Alternate names: PR_ATTACH_PATHNAME, PR_ATTACH_PATHNAME_A, ptagAttachPathname,
    /// PR_ATTACH_PATHNAME_W
    case tagAttachPathname = 0x3708

    /// [MS-OXPROPS] 2.607 PidTagAttachRendering
    /// Canonical name: PidTagAttachRendering
    /// Description: Contains a Windows Metafile, as specified in [MS-WMF], for the Attachment object.
    /// Property ID: 0x3709
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.17
    /// Consuming references: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: PR_ATTACH_RENDERING, ptagAttachRendering
    case tagAttachRendering = 0x3709

    /// [MS-OXPROPS] 2.609 PidTagAttachTag
    /// Canonical name: PidTagAttachTag
    /// Description: Contains the identifier information for the application that supplied the Attachment
    /// object data.
    /// Property ID: 0x370A
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.15
    /// Consuming references: [MS-OXORMMS], [MS-OXTNEF]
    /// Alternate names: PR_ATTACH_TAG
    case tagAttachTag = 0x370A

    /// [MS-OXPROPS] 2.914 PidTagRenderingPosition
    /// Canonical name: PidTagRenderingPosition
    /// Description: Represents an offset, in rendered characters, to use when rendering an attachment
    /// within the main message text.
    /// Property ID: 0x370B
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiAttachment
    /// Defining reference: [MS-OXCMSG] section 2.2.2.16
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXORMDR], [MS-OXCMAIL], [MSOXOJRNL], [MS-OXORMMS], [MS-OXOTASK], [MS-OXRTFEX]
    /// Alternate names: PR_RENDERING_POSITION, ptagRenderingPosition
    case tagRenderingPosition = 0x370B

    /// [MS-OXPROPS] 2.610 PidTagAttachTransportName
    /// Canonical name: PidTagAttachTransportName
    /// Description: Contains the name of an attachment file, modified so that it can be correlated with
    /// TNEF messages.
    /// Property ID: 0x370C
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.19
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_ATTACH_TRANSPORT_NAME, PR_ATTACH_TRANSPORT_NAME_A,
    /// PR_ATTACH_TRANSPORT_NAME_W
    case tagAttachTransportName = 0x370C

    /// [MS-OXPROPS] 2.596 PidTagAttachLongPathname
    /// Canonical name: PidTagAttachLongPathname
    /// Description: Contains the fully-qualified path and file name with extension.
    /// Property ID: 0x370D
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.13
    /// Consuming reference: [MS-OXORMMS]
    /// Alternate names: PR_ATTACH_LONG_PATHNAME, PR_ATTACH_LONG_PATHNAME_A,
    /// ptagAttachLongPathname, PR_ATTACH_LONG_PATHNAME_W
    case tagAttachLongPathname = 0x370D

    /// [MS-OXPROPS] 2.602 PidTagAttachMimeTag
    /// Canonical name: PidTagAttachMimeTag
    /// Description: Contains a content-type MIME header.
    /// Property ID: 0x370E
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming references: [MS-OXCICAL], [MS-OXCMAIL], [MS-OXORMMS], [MS-OXOSMIME], [MSOXOSMMS], [MS-OXOUM]
    /// Alternate names: PR_ATTACH_MIME_TAG, PR_ATTACH_MIME_TAG_A, PR_ATTACH_MIME_TAG_W
    case tagAttachMimeTag = 0x370E

    /// [MS-OXPROPS] 2.585 PidTagAttachAdditionalInformation
    /// Canonical name: PidTagAttachAdditionalInformation
    /// Description: Contains attachment encoding information.
    /// Property ID: 0x370F
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.21
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_ATTACH_ADDITIONAL_INFO
    case tagAttachAdditionalInformation = 0x370F

    /// PidTagAttachMimeSequence
    /// Not documented in specification but known on internet
    /// Contains the MIME sequence number of a MIME message attachment.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagattachmimesequence-canonical-property
    case tagAttachMimeSequence = 0x3710

    /// [MS-OXPROPS] 2.586 PidTagAttachContentBase
    /// Canonical name: PidTagAttachContentBase
    /// Description: Contains the base of a relative URI.
    /// Property ID: 0x3711
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming reference: [MS-OXCMAIL] Alternate names: PR_ATTACH_CONTENT_BASE,
    /// PR_ATTACH_CONTENT_BASE_A, PR_ATTACH_CONTENT_BASE_W
    case tagAttachContentBase = 0x3711

    /// [MS-OXPROPS] 2.587 PidTagAttachContentId
    /// Canonical name: PidTagAttachContentId
    /// Description: Contains a content identifier unique to the Message object that matches a
    /// corresponding "cid:" URI schema reference in the HTML body of the Message object.
    /// Property ID: 0x3712
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming references: [MS-OXCICAL], [MS-OXCMAIL], [MS-OXORMMS], [MS-OXOSMMS]
    /// Alternate names: PR_ATTACH_CONTENT_ID, PR_ATTACH_CONTENT_ID_A,
    /// PR_ATTACH_CONTENT_ID_W
    case tagAttachContentId = 0x3712

    /// [MS-OXPROPS] 2.588 PidTagAttachContentLocation
    /// Canonical name: PidTagAttachContentLocation
    /// Description: Contains a relative or full URI that matches a corresponding reference in the HTML
    /// body of a Message object.
    /// Property ID: 0x3713
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming references: [MS-OXCMAIL], [MS-OXORMMS]
    /// Alternate names: PR_ATTACH_CONTENT_LOCATION, PR_ATTACH_CONTENT_LOCATION_A,
    /// PR_ATTACH_CONTENT_LOCATION_W
    case tagAttachContentLocation = 0x3713

    /// [MS-OXPROPS] 2.594 PidTagAttachFlags
    /// Canonical name: PidTagAttachFlags
    /// Description: Indicates which body formats might reference this attachment when rendering data.
    /// Property ID: 0x3714
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.18
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXORMDR]
    /// Alternate names: PR_ATTACH_FLAGS
    case tagAttachFlags = 0x3714

    /// [MS-OXPROPS] 2.606 PidTagAttachPayloadProviderGuidString
    /// Canonical name: PidTagAttachPayloadProviderGuidString
    /// Description: Contains the GUID of the software component that can display the contents of the
    /// message.
    /// Property ID: 0x3719
    /// Data type: PtypString, 0x001F
    /// Area: Outlook Application
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_ATTACH_PAYLOAD_PROV_GUID_STR,
    /// PR_ATTACH_PAYLOAD_PROV_GUID_STR_A, PR_ATTACH_PAYLOAD_PROV_GUID_STR_W
    case tagAttachPayloadProviderGuidString = 0x3719

    /// [MS-OXPROPS] 2.605 PidTagAttachPayloadClass
    /// Canonical name: PidTagAttachPayloadClass
    /// Description: Contains the class name of an object that can display the contents of the message.
    /// Property ID: 0x371A
    /// Data type: PtypString, 0x001F
    /// Area: Outlook Application
    /// Defining reference: [MS-OXCMSG] section 2.2.2.29
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_ATTACH_PAYLOAD_CLASS, PR_ATTACH_PAYLOAD_CLASS_A,
    /// PR_ATTACH_PAYLOAD_CLASS_W, ptagAttachPayloadClass
    case tagAttachPayloadClass = 0x371A

    /// [MS-OXPROPS] 2.1044 PidTagTextAttachmentCharset
    /// Canonical name: PidTagTextAttachmentCharset
    /// Description: Specifies the character set of an attachment received via MIME with the content-type of
    /// text.
    /// Property ID: 0x371B
    /// Data type: PtypString, 0x001F
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.25
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagTextAttachmentCharset
    case tagTextAttachmentCharset = 0x371B

    // case unknown0x371C = 0x371C

    case unknown0x371D = 0x371D

    /// [MS-OXPROPS] 2.679 PidTagDisplayType
    /// Canonical name: PidTagDisplayType
    /// Description: Contains an integer value that indicates how to display an Address Book object in a
    /// table or as an addressee on a message.
    /// Property ID: 0x3900
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiAddressBook
    /// Defining reference:[MS-OXOABK] section 2.2.3.11
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMSG], [MS-OXOMSG], [MSOXLDAP], [MS-OXNSPI], [MS-OXOAB], [MS-OXOABKT], [MS-OXODLGT], [MS-OXOSRCH]
    /// Alternate names: PR_DISPLAY_TYPE, ptagDisplayType
    case tagDisplayType = 0x3900

    // case unknown0x3901 = 0x3901

    /// [MS-OXPROPS] 2.1043 PidTagTemplateid
    /// Canonical name: PidTagTemplateid
    /// Description: Contains the value of the PidTagEntryId property (section 2.683), expressed as a
    /// Permanent Entry ID format.
    /// Property ID: 0x3902
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiAddressBook
    /// Defining reference: [MS-OXOABK] section 2.2.3.3
    /// Alternate names: PR_TEMPLATEID
    case tagTemplateid = 0x3902

    // case unknown0x3903 = 0x3903

    // case unknown0x3904 = 0x3904

    /// [MS-OXPROPS] 2.680 PidTagDisplayTypeEx
    /// Canonical name: PidTagDisplayTypeEx
    /// Description: Contains an integer value that indicates how to display an Address Book object in a
    /// table or as a recipient on a message.
    /// Property ID: 0x3905
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiAddressBook
    /// Defining reference: [MS-OXOABK] section 2.2.3.12
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOMSG], [MS-OXOAB], [MSOXODLGT], [MS-OXOSRCH]
    /// Alternate names: PR_DISPLAY_TYPE_EX
    case tagDisplayTypeEx = 0x3905

    // case unknown0x3906 = 0x3906

    // case unknown0x39FD = 0x39FD

    /// [MS-OXPROPS] 2.1020 PidTagSmtpAddress
    /// Canonical name: PidTagSmtpAddress
    /// Description: Contains the SMTP address of the Message object.
    /// Property ID: 0x39FE
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.21
    /// Consuming references: [MS-OXCMAIL], [MS-OXOMSG], [MS-OXCMSG], [MS-OXOAB], [MSOXSHARE]
    /// Alternate names: PR_SMTP_ADDRESS, PR_SMTP_ADDRESS_A, PR_SMTP_ADDRESS_W
    case tagSmtpAddress = 0x39FE

    /// [MS-OXPROPS] 2.514 PidTagAddressBookDisplayNamePrintable
    /// Canonical name: PidTagAddressBookDisplayNamePrintable
    /// Description: Contains the printable string version of the display name.
    /// Property ID: 0x39FF
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.7
    /// Consuming reference: [MS-OXCMSG], [MS-OXOAB], [MS-OXOMSG]
    /// Alternate names: PR_EMS_AB_DISPLAY_NAME_PRINTABLE,
    /// PR_EMS_AB_DISPLAY_NAME_PRINTABLE_A, PR_EMS_AB_DISPLAY_NAME_PRINTABLE_W,
    /// PR_7BIT_DISPLAY_NAME, PR_7BIT_DISPLAY_NAME_A, PR_7BIT_DISPLAY_NAME_W,
    /// ptagSimpleDisplayName
    case tagAddressBookDisplayNamePrintable = 0x39FF

    /// [MS-OXPROPS] 2.508 PidTagAccount
    /// Canonical name: PidTagAccount
    /// Description: Contains the alias of an Address Book object, which is an alternative name by which
    /// the object can be identified.
    /// Property ID: 0x3A00
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.11
    /// Consuming references: [MS-OXCFXICS], [MS-OXOAB], [MS-OXOABK], [MS-OXOMSG]
    /// Alternate names: PR_ACCOUNT, PR_ACCOUNT_A, PR_ACCOUNT_W, urn:schemas:contacts:account
    case tagAccount = 0x3A00

    /// PidTagAlternateRecipient
    /// Not documented in specification but known on internet
    /// Contains a list of entry identifiers for alternate recipients designated by the original recipient.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagalternaterecipient-canonical-property
    case tagAlternateRecipient = 0x3A01

    /// [MS-OXPROPS] 2.627 PidTagCallbackTelephoneNumber
    /// Canonical name: PidTagCallbackTelephoneNumber
    /// Description: Contains a telephone number to reach the mail user.
    /// Property ID: 0x3A02
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.2
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_CALLBACK_TELEPHONE_NUMBER, PR_CALLBACK_TELEPHONE_NUMBER_A,
    /// PR_CALLBACK_TELEPHONE_NUMBER_W, urn:schemas:contacts:callbackphone
    case tagCallbackTelephoneNumber = 0x3A02

    /// PidTagConversionProhibited
    /// Not documented in specification but known on internet
    /// Contains TRUE if message conversions are prohibited by default for the associated messaging user.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagconversionprohibited-canonical-property
    case tagConversionProhibited = 0x3A03

    /// Not documented in specification - known on internet
    case tagDiscloseRecipients = 0x3A04

    /// [MS-OXPROPS] 2.713 PidTagGeneration
    /// Canonical name: PidTagGeneration
    /// Description: Contains a generational abbreviation that follows the full name of the mail user.
    /// Property ID: 0x3A05
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.2
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_GENERATION, PR_GENERATION_A, PR_GENERATION_W,
    /// urn:schemas:contacts:namesuffix
    case tagGeneration = 0x3A05

    /// [MS-OXPROPS] 2.714 PidTagGivenName
    /// Canonical name: PidTagGivenName
    /// Description: Contains the mail user's given name.
    /// Property ID: 0x3A06
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.2
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_GIVEN_NAME, PR_GIVEN_NAME_A, PR_GIVEN_NAME_W,
    /// urn:schemas:contacts:givenName
    case tagGivenName = 0x3A06

    /// [MS-OXPROPS] 2.715 PidTagGovernmentIdNumber
    /// Canonical name: PidTagGovernmentIdNumber
    /// Description: Contains a government identifier for the mail user.
    /// Property ID: 0x3A07
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.9
    /// Alternate names: PR_GOVERNMENT_ID_NUMBER, PR_GOVERNMENT_ID_NUMBER_A,
    /// PR_GOVERNMENT_ID_NUMBER_W, urn:schemas:contacts:governmentid
    case tagGovernmentIdNumber = 0x3A07

    /// [MS-OXPROPS] 2.626 PidTagBusinessTelephoneNumber
    /// Canonical name: PidTagBusinessTelephoneNumber
    /// Description: Contains the primary telephone number of the mail user's place of business.
    /// Property ID: 0x3A08
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.21
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_BUSINESS_TELEPHONE_NUMBER, PR_BUSINESS_TELEPHONE_NUMBER_A,
    /// PR_BUSINESS_TELEPHONE_NUMBER_W, PR_OFFICE_TELEPHONE_NUMBER,
    /// urn:schemas:contacts:telephoneNumber
    case tagBusinessTelephoneNumber = 0x3A08

    /// [MS-OXPROPS] 2.732 PidTagHomeTelephoneNumber
    /// Canonical name: PidTagHomeTelephoneNumber
    /// Description: Contains the primary telephone number of the mail user's home.
    /// Property ID: 0x3A09
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.22
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_HOME_TELEPHONE_NUMBER, PR_HOME_TELEPHONE_NUMBER_A,
    /// PR_HOME_TELEPHONE_NUMBER_W, urn:schemas:contacts:homePhone
    case tagHomeTelephoneNumber = 0x3A09

    /// [MS-OXPROPS] 2.741 PidTagInitials
    /// Canonical name: PidTagInitials
    /// Description: Contains the initials for parts of the full name of the mail user.
    /// Property ID: 0x3A0A
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.3
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC]
    /// Alternate names: PR_INITIALS, PR_INITIALS_A, PR_INITIALS_W, urn:schemas:contacts:initials
    case tagInitials = 0x3A0A

    /// [MS-OXPROPS] 2.762 PidTagKeyword
    /// Canonical name: PidTagKeyword
    /// Description: Contains a keyword that identifies the mail user to the mail user's system
    /// administrator.
    /// Property ID: 0x3A0B
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.32
    /// Alternate names: PR_KEYWORD, PR_KEYWORD_A, PR_KEYWORD_W
    case tagKeyword = 0x3A0B

    /// [MS-OXPROPS] 2.763 PidTagLanguage
    /// Canonical name: PidTagLanguage
    /// Description: Contains a value that indicates the language in which the messaging user is writing
    /// messages.
    /// Property ID: 0x3A0C
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.4
    /// Alternate names: PR_LANGUAGE, PR_LANGUAGE_A, PR_LANGUAGE_W,
    /// urn:schemas:contacts:language
    case tagLanguage = 0x3A0C

    /// [MS-OXPROPS] 2.776 PidTagLocation
    /// Canonical name: PidTagLocation
    /// Description: Contains the location of the mail user.
    /// Property ID: 0x3A0D
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.5
    /// Consuming references: [MS-OXOCAL]
    /// Alternate names: PR_LOCATION, PR_LOCATION_A, PR_LOCATION_W,
    /// urn:schemas:contacts:location
    case tagLocation = 0x3A0D

    /// PidTagMailPermission
    /// Not documented in specification but known on internet
    /// Contains TRUE if the messaging user is allowed to send and receive messages.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagmailpermission-canonical-property
    case tagMailPermission = 0x3A0E

    /// [MS-OXPROPS] 2.792 PidTagMessageHandlingSystemCommonName
    /// Canonical name: PidTagMessageHandlingSystemCommonName
    /// Description: Contains the common name of a messaging user for use in a message header.
    /// Property ID: 0x3A0F
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.33
    /// Alternate names: PR_MHS_COMMON_NAME, PR_MHS_COMMON_NAME_A,
    /// PR_MHS_COMMON_NAME_W, urn:schemas:contacts:dn
    case tagMessageHandlingSystemCommonName = 0x3A0F

    /// [MS-OXPROPS] 2.822 PidTagOrganizationalIdNumber
    /// Canonical name: PidTagOrganizationalIdNumber
    /// Description: Contains an identifier for the mail user used within the mail user's organization.
    /// Property ID: 0x3A10
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.7
    /// Alternate names: PR_ORGANIZATIONAL_ID_NUMBER, PR_ORGANIZATIONAL_ID_NUMBER_A,
    /// PR_ORGANIZATIONAL_ID_NUMBER_W, urn:schemas:contacts:employeenumber
    case tagOrganizationalIdNumber = 0x3A10

    /// [MS-OXPROPS] 2.1036 PidTagSurname
    /// Canonical name: PidTagSurname
    /// Description: Contains the mail user's family name.
    /// Property ID: 0x3A11
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.1
    /// Consuming references: [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_SURNAME, PR_SURNAME_A, PR_SURNAME_W, urn:schemas:contacts:sn
    case tagSurname = 0x3A11

    /// [MS-OXPROPS] 2.829 PidTagOriginalEntryId
    /// Canonical name: PidTagOriginalEntryId
    /// Description: Contains the original EntryID of an object.
    /// Property ID: 0x3A12
    /// Data type: PtypBinary, 0x0102
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.9
    /// Alternate names: PR_ORIGINAL_ENTRYID, ptagOriginalEntryId
    case tagOriginalEntryId = 0x3A12

    /// PidTagOriginalDisplayName
    /// Not documented in specification but known on internet
    /// Contains the original display name for an entry copied from an address book to a personal address book or other writable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginaldisplayname-canonical-property
    case tagOriginalDisplayName = 0x3A13

    /// PidTagOriginalSearchKey
    /// Not documented in specification but known on internet
    /// Contains the original search key for an entry copied from an address book to a personal address book or other writeable address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagoriginalsearchkey-canonical-property
    case tagOriginalSearchKey = 0x3A14

    /// [MS-OXPROPS] 2.864 PidTagPostalAddress
    /// Canonical name: PidTagPostalAddress
    /// Description: Contains the mail user's postal address.
    /// Property ID: 0x3A15
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.8
    /// Alternate names: PR_POSTAL_ADDRESS, PR_POSTAL_ADDRESS_A, PR_POSTAL_ADDRESS_W,
    /// urn:schemas:contacts:mailingpostaladdress
    case tagPostalAddress = 0x3A15

    /// [MS-OXPROPS] 2.639 PidTagCompanyName
    /// Canonical name: PidTagCompanyName
    /// Description: Contains the mail user's company name.
    /// Property ID: 0x3A16
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.7
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_COMPANY_NAME, PR_COMPANY_NAME_A, PR_COMPANY_NAME_W,
    /// urn:schemas:contacts:o
    case tagCompanyName = 0x3A16

    /// [MS-OXPROPS] 2.1046 PidTagTitle
    /// Canonical name: PidTagTitle
    /// Description: Contains the mail user's job title.
    /// Property ID: 0x3A17
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.4
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_TITLE, PR_TITLE_A, PR_TITLE_W, urn:schemas:contacts:title
    case tagTitle = 0x3A17

    /// [MS-OXPROPS] 2.672 PidTagDepartmentName
    /// Canonical name: PidTagDepartmentName
    /// Description: Contains a name for the department in which the mail user works.
    /// Property ID: 0x3A18
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.6
    /// Consuming references: [MS-OXNSPI], [MS-OXOAB] [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_DEPARTMENT_NAME, PR_DEPARTMENT_NAME_A, PR_DEPARTMENT_NAME_W,
    /// urn:schemas:contacts:department
    case tagDepartmentName = 0x3A18

    /// [MS-OXPROPS] 2.814 PidTagOfficeLocation
    /// Canonical name: PidTagOfficeLocation
    /// Description: Contains the mail user's office location.
    /// Property ID: 0x3A19
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.5
    /// Consuming references: [MS-OXNSPI], [MS-OXOAB], [MS-OXOCNTC]
    /// Alternate names: PR_OFFICE_LOCATION, PR_OFFICE_LOCATION_A, PR_OFFICE_LOCATION_W,
    /// urn:schemas:contacts:roomnumber
    case tagOfficeLocation = 0x3A19

    /// [MS-OXPROPS] 2.870 PidTagPrimaryTelephoneNumber
    /// Canonical name: PidTagPrimaryTelephoneNumber
    /// Description: Contains the mail user's primary telephone number.
    /// Property ID: 0x3A1A
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.5
    /// Consuming references: [MS-OXNSPI], [MS-OXVCARD]
    /// Alternate names: PR_PRIMARY_TELEPHONE_NUMBER, PR_PRIMARY_TELEPHONE_NUMBER_A,
    /// PR_PRIMARY_TELEPHONE_NUMBER_W
    case tagPrimaryTelephoneNumber = 0x3A1A

    /// [MS-OXPROPS] 2.622 PidTagBusiness2TelephoneNumber
    /// Canonical name: PidTagBusiness2TelephoneNumber
    /// Description: Contains a secondary telephone number at the mail user's place of business.
    /// Property ID: 0x3A1B
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.23
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: "PR_BUSINESS2_TELEPHONE_NUMBER, PR_BUSINESS2_TELEPHONE_NUMBER_A,
    /// PR_BUSINESS2_TELEPHONE_NUMBER_W, PR_OFFICE2_TELEPHONE_NUMBER,
    /// urn:schemas:contacts:telephonenumber2
    /// [MS-OXPROPS] 2.623 PidTagBusiness2TelephoneNumbers
    /// Canonical name: PidTagBusiness2TelephoneNumbers
    /// Description: Contains secondary telephone numbers at the mail user's place of business.
    /// Property ID: 0x3A1B
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.24
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_BUSINESS2_TELEPHONE_NUMBER_A_MV
    case tagBusiness2TelephoneNumberOrTagBusiness2TelephoneNumbers = 0x3A1B

    /// [MS-OXPROPS] 2.804 PidTagMobileTelephoneNumber
    /// Canonical name: PidTagMobileTelephoneNumber
    /// Description: Contains the mail user's cellular telephone number.
    /// Property ID: 0x3A1C
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.27
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_MOBILE_TELEPHONE_NUMBER, PR_MOBILE_TELEPHONE_NUMBER_A,
    /// PR_MOBILE_TELEPHONE_NUMBER_W, urn:schemas:contacts:mobile
    case tagMobileTelephoneNumber = 0x3A1C

    /// [MS-OXPROPS] 2.877 PidTagRadioTelephoneNumber
    /// Canonical name: PidTagRadioTelephoneNumber
    /// Description: Contains the mail user's radio telephone number.
    /// Property ID: 0x3A1D
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.8
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_RADIO_TELEPHONE_NUMBER, PR_RADIO_TELEPHONE_NUMBER_A,
    /// PR_RADIO_TELEPHONE_NUMBER_W
    case tagRadioTelephoneNumber = 0x3A1D

    /// [MS-OXPROPS] 2.629 PidTagCarTelephoneNumber
    /// Canonical name: PidTagCarTelephoneNumber
    /// Description: Contains the mail user's car telephone number.
    /// Property ID: 0x3A1E
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.9
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_CAR_TELEPHONE_NUMBER, PR_CAR_TELEPHONE_NUMBER_A,
    /// PR_CAR_TELEPHONE_NUMBER_W, urn:schemas:contacts:othermobile
    case tagCarTelephoneNumber = 0x3A1E

    /// [MS-OXPROPS] 2.854 PidTagOtherTelephoneNumber
    /// Canonical name: PidTagOtherTelephoneNumber
    /// Description: Contains an alternate telephone number for the mail user.
    /// Property ID: 0x3A1F
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.10
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_TELEPHONE_NUMBER, PR_OTHER_TELEPHONE_NUMBER_A,
    /// PR_OTHER_TELEPHONE_NUMBER_W, urn:schemas:contacts:otherTelephone
    case tagOtherTelephoneNumber = 0x3A1F

    /// [MS-OXPROPS] 2.1049 PidTagTransmittableDisplayName
    /// Canonical name: PidTagTransmittableDisplayName
    /// Description: Contains an Address Book object's display name that is transmitted with the
    /// message.
    /// Property ID: 0x3A20
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.8
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMSG]
    /// Alternate names: PR_TRANSMITABLE_DISPLAY_NAME, PR_TRANSMITABLE_DISPLAY_NAME_A,
    /// ptagTransmitableDisplayName, PR_TRANSMITABLE_DISPLAY_NAME_W
    case tagTransmittableDisplayName = 0x3A20

    /// [MS-OXPROPS] 2.857 PidTagPagerTelephoneNumber
    /// Canonical name: PidTagPagerTelephoneNumber
    /// Description: Contains the mail user's pager telephone number.
    /// Property ID: 0x3A21
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.28
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_PAGER_TELEPHONE_NUMBER, PR_PAGER_TELEPHONE_NUMBER_A,
    /// PR_PAGER_TELEPHONE_NUMBER_W, urn:schemas:contacts:pager
    case tagPagerTelephoneNumber = 0x3A21

    /// [MS-OXPROPS] 2.1052 PidTagUserCertificate
    /// Canonical name: PidTagUserCertificate
    /// Description: Contains an ASN.1 authentication certificate for a messaging user.
    /// Property ID: 0x3A22
    /// Data type: PtypBinary, 0x0102
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.34
    /// Consuming references: [MS-OXOAB]
    /// Alternate names: PR_USER_CERTIFICATE, ptagUserCertificate, urn:schemas:contacts:usercertificate
    case tagUserCertificate = 0x3A22

    /// [MS-OXPROPS] 2.868 PidTagPrimaryFaxNumber
    /// Canonical name: PidTagPrimaryFaxNumber
    /// Description: Contains the telephone number of the mail user's primary fax machine.
    /// Property ID: 0x3A23
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.29
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC]
    /// Alternate names: PR_PRIMARY_FAX_NUMBER, PR_PRIMARY_FAX_NUMBER_A,
    /// PR_PRIMARY_FAX_NUMBER_W, urn:schemas:contacts:otherfax
    case tagPrimaryFaxNumber = 0x3A23

    /// [MS-OXPROPS] 2.624 PidTagBusinessFaxNumber
    /// Canonical name: PidTagBusinessFaxNumber
    /// Description: Contains the telephone number of the mail user's business fax machine.
    /// Property ID: 0x3A24
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.6
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_BUSINESS_FAX_NUMBER, PR_BUSINESS_FAX_NUMBER_A,
    /// PR_BUSINESS_FAX_NUMBER_W, urn:schemas:contacts:facsimiletelephonenumber
    case tagBusinessFaxNumber = 0x3A24

    /// [MS-OXPROPS] 2.731 PidTagHomeFaxNumber
    /// Canonical name: PidTagHomeFaxNumber
    /// Description: Contains the telephone number of the mail user's home fax machine.
    /// Property ID: 0x3A25
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.2.6
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_FAX_NUMBER, PR_HOME_FAX_NUMBER_A,
    /// PR_HOME_FAX_NUMBER_W, urn:schemas:contacts:homefax
    case tagHomeFaxNumber = 0x3A25

    /// [MS-OXPROPS] 2.653 PidTagCountry
    /// Canonical name: PidTagCountry
    /// Description: Contains the name of the mail user's country/region.
    /// Property ID: 0x3A26
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.19
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_COUNTRY, PR_COUNTRY_A, PR_COUNTRY_W,
    /// PR_BUSINESS_ADDRESS_COUNTRY, PR_BUSINESS_ADDRESS_COUNTRY_A,
    /// PR_BUSINESS_ADDRESS_COUNTRY_W, urn:schemas:contacts:mailingcountry
    case tagCountry = 0x3A26

    /// [MS-OXPROPS] 2.775 PidTagLocality
    /// Canonical name: PidTagLocality
    /// Description: Contains the name of the mail user's locality, such as the town or city.
    /// Property ID: 0x3A27
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.16
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_LOCALITY, PR_LOCALITY_A, PR_LOCALITY_W,
    /// PR_BUSINESS_ADDRESS_LOCALITY, PR_BUSINESS_ADDRESS_LOCALITY_A,
    /// PR_BUSINESS_ADDRESS_LOCALITY_W, urn:schemas:contacts:mailingcity
    case tagLocality = 0x3A27

    /// [MS-OXPROPS] 2.1027 PidTagStateOrProvince
    /// Canonical name: PidTagStateOrProvince
    /// Description: Contains the name of the mail user's state or province.
    /// Property ID: 0x3A28
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.17
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_STATE_OR_PROVINCE, PR_STATE_OR_PROVINCE_A,
    /// PR_STATE_OR_PROVINCE_W, PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE,
    /// PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_A,
    /// PR_BUSINESS_ADDRESS_STATE_OR_PROVINCE_W, urn:schemas:contacts:mailingstate
    case tagStateOrProvince = 0x3A28

    /// [MS-OXPROPS] 2.1031 PidTagStreetAddress
    /// Canonical name: PidTagStreetAddress
    /// Description: Contains the mail user's street address.
    /// Property ID: 0x3A29
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.14
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_STREET_ADDRESS, PR_STREET_ADDRESS_A, PR_STREET_ADDRESS_W,
    /// PR_BUSINESS_ADDRESS_STREET, PR_BUSINESS_ADDRESS_STREET_A,
    /// PR_BUSINESS_ADDRESS_STREET_W, urn:schemas:contacts:mailingstreet
    case tagStreetAddress = 0x3A29

    /// [MS-OXPROPS] 2.865 PidTagPostalCode
    /// Canonical name: PidTagPostalCode
    /// Description: Contains the postal code for the mail user's postal address.
    /// Property ID: 0x3A2A
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.18
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_POSTAL_CODE, PR_POSTAL_CODE_A, PR_POSTAL_CODE_W,
    /// PR_BUSINESS_ADDRESS_POSTAL_CODE, PR_BUSINESS_ADDRESS_POSTAL_CODE_A,
    /// PR_BUSINESS_ADDRESS_POSTAL_CODE_W, urn:schemas:contacts:mailingpostalcode
    case tagPostalCode = 0x3A2A

    /// [MS-OXPROPS] 2.866 PidTagPostOfficeBox
    /// Canonical name: PidTagPostOfficeBox
    /// Description: Contains the number or identifier of the mail user's post office box.
    /// Property ID: 0x3A2B
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.15
    /// Consuming references: [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_POST_OFFICE_BOX, PR_POST_OFFICE_BOX_A, PR_POST_OFFICE_BOX_W,
    /// PR_BUSINESS_ADDRESS_POST_OFFICE_BOX, PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_A,
    /// PR_BUSINESS_ADDRESS_POST_OFFICE_BOX_W, urn:schemas:contacts:mailingpostofficebox
    case tagPostOfficeBox = 0x3A2B

    /// [MS-OXPROPS] 2.1041 PidTagTelexNumber
    /// Canonical name: PidTagTelexNumber
    /// Description: Contains the mail user's telex number. This property is returned from an NSPI server
    /// as a PtypMultipleBinary. Otherwise, the data type is PtypString.
    /// Property ID: 0x3A2C
    /// Data type: PtypString, 0x001F; PtypMultipleBinary, 0x1102
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.30
    /// Consuming references: [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_TELEX_NUMBER, PR_TELEX_NUMBER_A, PR_TELEX_NUMBER_W,
    /// urn:schemas:contacts:telexnumber
    case tagTelexNumber = 0x3A2C

    /// [MS-OXPROPS] 2.756 PidTagIsdnNumber
    /// Canonical name: PidTagIsdnNumber
    /// Description: Contains the Integrated Services Digital Network (ISDN) telephone number of the
    /// mail user.
    /// Property ID: 0x3A2D
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.16
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_ISDN_NUMBER, PR_ISDN_NUMBER_A, PR_ISDN_NUMBER_W,
    /// urn:schemas:contacts:internationalisdnnumber
    case tagIsdnNumber = 0x3A2D

    /// [MS-OXPROPS] 2.583 PidTagAssistantTelephoneNumber
    /// Canonical name: PidTagAssistantTelephoneNumber
    /// Description: Contains the telephone number of the mail user's administrative assistant.
    /// Property ID: 0x3A2E
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.31
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_ASSISTANT_TELEPHONE_NUMBER, PR_ASSISTANT_TELEPHONE_NUMBER_A,
    /// PR_ASSISTANT_TELEPHONE_NUMBER_W, urn:schemas:contacts:secretaryphone
    case tagAssistantTelephoneNumber = 0x3A2E

    /// [MS-OXPROPS] 2.723 PidTagHome2TelephoneNumber
    /// Canonical name: PidTagHome2TelephoneNumber
    /// Description: Contains a secondary telephone number at the mail user's home.
    /// Property ID: 0x3A2F
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference:[MS-OXOABK] section 2.2.4.25
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_HOME2_TELEPHONE_NUMBER, PR_HOME2_TELEPHONE_NUMBER_A,
    /// PR_HOME2_TELEPHONE_NUMBER_W, urn:schemas:contacts:homephone2
    /// [MS-OXPROPS] 2.724 PidTagHome2TelephoneNumbers
    /// Canonical name: PidTagHome2TelephoneNumbers
    /// Description: Contains secondary telephone numbers at the mail user's home.
    /// Property ID: 0x3A2F
    /// Data type: PtypMultipleString, 0x101F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.26
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_HOME2_TELEPHONE_NUMBER_A_MV
    case tagHome2TelephoneNumberOrTagHome2TelephoneNumbers = 0x3A2F

    /// [MS-OXPROPS] 2.582 PidTagAssistant
    /// Canonical name: PidTagAssistant
    /// Description: Contains the name of the mail user's administrative assistant.
    /// Property ID: 0x3A30
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.4.8
    /// Consuming references: [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_ASSISTANT, PR_ASSISTANT_A, PR_ASSISTANT_W,
    /// urn:schemas:contacts:secretarycn
    case tagAssistant = 0x3A30

    // case unknown0x3A31 = 0x3A31

    // case unknown0x3A32 = 0x3A32

    // case unknown0x3A33 = 0x3A33

    // case unknown0x3A34 = 0x3A34

    // case unknown0x3A35 = 0x3A35

    // case unknown0x3A36 = 0x3A36

    // case unknown0x3A37 = 0x3A37

    // case unknown0x3A38 = 0x3A38

    // case unknown0x3A39 = 0x3A39

    // case unknown0x3A3A = 0x3A3A

    // case unknown0x3A34 = 0x3A3B

    // case unknown0x3A3C = 0x3A3C

    // case unknown0x3A3D = 0x3A3D

    // case unknown0x3A3E = 0x3A3E

    // case unknown0x3A3E = 0x3A3F

    /// [MS-OXPROPS] 2.1009 PidTagSendRichInfo
    /// Canonical name: PidTagSendRichInfo
    /// Description: Indicates whether the email-enabled entity represented by the Address Book object
    /// can receive all message content, including Rich Text Format (RTF) and other embedded objects.
    /// Property ID: 0x3A40
    /// Data type: PtypBoolean, 0x000B
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.18
    /// Consuming references: [MS-OXOAB], [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXCMSG], [MSOXOMSG]
    /// Alternate names: PR_SEND_RICH_INFO, ptagSendRichInfo
    case tagSendRichInfo = 0x3A40

    /// [MS-OXPROPS] 2.1062 PidTagWeddingAnniversary
    /// Canonical name: PidTagWeddingAnniversary
    /// Description: Contains the date of the mail user's wedding anniversary.
    /// Property ID: 0x3A41
    /// Data type: PtypTime, 0x0040
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.4
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_WEDDING_ANNIVERSARY, urn:schemas:contacts:weddinganniversary
    case tagWeddingAnniversary = 0x3A41

    /// [MS-OXPROPS] 2.616 PidTagBirthday
    /// Canonical name: PidTagBirthday
    /// Description: Contains the date of the mail user's birthday at midnight.
    /// Property ID: 0x3A42
    /// Data type: PtypTime, 0x0040
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.5.1
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_BIRTHDAY, urn:schemas:contacts:bday
    case tagBirthday = 0x3A42

    /// [MS-OXPROPS] 2.722 PidTagHobbies
    /// Canonical name: PidTagHobbies
    /// Description: Contains the names of the mail user's hobbies.
    /// Property ID: 0x3A43
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.2
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOBBIES, PR_HOBBIES_A, PR_HOBBIES_W, urn:schemas:contacts:hobbies
    case tagHobbies = 0x3A43

    /// [MS-OXPROPS] 2.802 PidTagMiddleName
    /// Canonical name: PidTagMiddleName
    /// Description: Specifies the middle name(s) of the contact.
    /// Property ID: 0x3A44
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.5
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_MIDDLE_NAME, PR_MIDDLE_NAME_A, PR_MIDDLE_NAME_W,
    /// urn:schemas:contacts:middlename
    case tagMiddleName = 0x3A44

    /// [MS-OXPROPS] 2.677 PidTagDisplayNamePrefix
    /// Canonical name: PidTagDisplayNamePrefix
    /// Description: Contains the mail user's honorific title.
    /// Property ID: 0x3A45
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_DISPLAY_NAME_PREFIX, PR_DISPLAY_NAME_PREFIX_A,
    /// PR_DISPLAY_NAME_PREFIX_W, urn:schemas:contacts:personaltitle
    case tagDisplayNamePrefix = 0x3A45

    /// [MS-OXPROPS] 2.873 PidTagProfession
    /// Canonical name: PidTagProfession
    /// Description: Contains the name of the mail user's line of business.
    /// Property ID: 0x3A46
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.6.9
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_PROFESSION, PR_PROFESSION_A, PR_PROFESSION_W,
    /// urn:schemas:contacts:profession
    case tagProfession = 0x3A46

    /// [MS-OXPROPS] 2.911 PidTagReferredByName
    /// Canonical name: PidTagReferredByName
    /// Description: Contains the name of the mail user's referral.
    /// Property ID: 0x3A47
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.21
    /// Alternate names: PR_REFERRED_BY_NAME, PR_REFERRED_BY_NAME_A,
    /// PR_REFERRED_BY_NAME_W
    case tagReferredByName = 0x3A47

    /// [MS-OXPROPS] 2.1024 PidTagSpouseName
    /// Canonical name: PidTagSpouseName
    /// Description: Contains the name of the mail user's spouse/partner.
    /// Property ID: 0x3A48
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_SPOUSE_NAME, PR_SPOUSE_NAME_A, PR_SPOUSE_NAME_W,
    /// urn:schemas:contacts:spousecn
    case tagSpouseName = 0x3A48

    /// [MS-OXPROPS] 2.640 PidTagComputerNetworkName
    /// Canonical name: PidTagComputerNetworkName
    /// Description: Contains the name of the mail user's computer network.
    /// Property ID: 0x3A49
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.16
    /// Alternate names: PR_COMPUTER_NETWORK_NAME, PR_COMPUTER_NETWORK_NAME_A,
    /// PR_COMPUTER_NETWORK_NAME_W, urn:schemas:contacts:computernetworkname
    case tagComputerNetworkName = 0x3A49

    /// [MS-OXPROPS] 2.657 PidTagCustomerId
    /// Canonical name: PidTagCustomerId
    /// Description: Contains the mail user's customer identification number.
    /// Property ID: 0x3A4A
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.8
    /// Alternate names: PR_CUSTOMER_ID, PR_CUSTOMER_ID_A, PR_CUSTOMER_ID_W,
    /// urn:schemas:contacts:customerid
    case tagCustomerId = 0x3A4A

    /// [MS-OXPROPS] 2.1040 PidTagTelecommunicationsDeviceForDeafTelephoneNumber
    /// Canonical name: PidTagTelecommunicationsDeviceForDeafTelephoneNumber
    /// Description: Contains the mail user's telecommunication device for the deaf (TTY/TDD) telephone
    /// number.
    /// Property ID: 0x3A4B
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.13
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_TTYTDD_PHONE_NUMBER, PR_TTYTDD_PHONE_NUMBER_A,
    /// PR_TTYTDD_PHONE_NUMBER_W, urn:schemas:contacts:ttytddphone
    case tagTelecommunicationsDeviceForDeafTelephoneNumber = 0x3A4B

    /// [MS-OXPROPS] 2.710 PidTagFtpSite
    /// Canonical name: PidTagFtpSite
    /// Description: Contains the File Transfer Protocol (FTP) site address of the mail user.
    /// Property ID: 0x3A4C
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.15
    /// Alternate names: PR_FTP_SITE, PR_FTP_SITE_A, PR_FTP_SITE_W, urn:schemas:contacts:ftpsite
    case tagFtpSite = 0x3A4C

    /// [MS-OXPROPS] 2.712 PidTagGender
    /// Canonical name: PidTagGender
    /// Description: Contains a value that represents the mail user's gender.
    /// Property ID: 0x3A4D
    /// Data type: PtypInteger16, 0x0002
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.20
    /// Alternate names: PR_GENDER, urn:schemas:contacts:gender
    case tagGender = 0x3A4D

    /// [MS-OXPROPS] 2.779 PidTagManagerName
    /// Canonical name: PidTagManagerName
    /// Description: Contains the name of the mail user's manager.
    /// Property ID: 0x3A4E
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.6.6
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_MANAGER_NAME, PR_MANAGER_NAME_A, PR_MANAGER_NAME_W,
    /// urn:schemas:contacts:manager
    case tagManagerName = 0x3A4E

    /// [MS-OXPROPS] 2.807 PidTagNickname
    /// Canonical name: PidTagNickname
    /// Description: Contains the mail user's nickname.
    /// Property ID: 0x3A4F
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.1.1
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_NICKNAME, PR_NICKNAME_A, PR_NICKNAME_W,
    /// urn:schemas:contacts:nickname
    case tagNickname = 0x3A4F

    /// [MS-OXPROPS] 2.862 PidTagPersonalHomePage
    /// Canonical name: PidTagPersonalHomePage
    /// Description: Contains the URL of the mail user's personal home page.
    /// Property ID: 0x3A50
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.13
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_PERSONAL_HOME_PAGE, PR_PERSONAL_HOME_PAGE_A,
    /// PR_PERSONAL_HOME_PAGE_W, urn:schemas:contacts:personalHomePage
    case tagPersonalHomePage = 0x3A50

    /// [MS-OXPROPS] 2.625 PidTagBusinessHomePage
    /// Canonical name: PidTagBusinessHomePage
    /// Description: Contains the URL of the mail user's business home page.
    /// Property ID: 0x3A51
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.14
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_BUSINESS_HOME_PAGE, PR_BUSINESS_HOME_PAGE_A,
    /// PR_BUSINESS_HOME_PAGE_W,
    /// urn:schemas:contacts:businesshomepageurn:schemas:contacts:businesshomepage
    case tagBusinessHomePage = 0x3A51

    /// PidTagContactVersion
    /// Not documented in specification but known on internet
    /// Contains the version of a recipient's contact information.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactversion-canonical-property

    case tagContactVersion = 0x3A52

    /// Not documented - known on internet
    case tagContactEntryIds = 0x3A53

    /// PidTagContactAddressTypes
    /// Not documented in specification but known on internet
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactaddresstypes-canonical-property
    case tagContactAddressTypes = 0x3A54

    /// Not documented - known on internet
    case tagContactDefaultAddressIndex = 0x3A55

    /// Not documented - known on internet
    case tagContactEmailAddresses = 0x3A56

    /// [MS-OXPROPS] 2.638 PidTagCompanyMainTelephoneNumber
    /// Canonical name: PidTagCompanyMainTelephoneNumber
    /// Description: Contains the main telephone number of the mail user's company.
    /// Property ID: 0x3A57
    /// Data type: PtypString, 0x001F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.4.14
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_COMPANY_MAIN_PHONE_NUMBER, PR_COMPANY_MAIN_PHONE_NUMBER_A,
    /// PR_COMPANY_MAIN_PHONE_NUMBER_W, urn:schemas:contacts:organizationmainphone
    case tagCompanyMainTelephoneNumber = 0x3A57

    /// [MS-OXPROPS] 2.633 PidTagChildrensNames
    /// Canonical name: PidTagChildrensNames
    /// Description: Specifies the names of the children of the contact.
    /// Property ID: 0x3A58
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.10.17
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_CHILDRENS_NAMES, PR_CHILDRENS_NAMES_A, PR_CHILDRENS_NAMES_W,
    /// urn:schemas:contacts:childrensnames
    case tagChildrensNames = 0x3A58

    /// [MS-OXPROPS] 2.725 PidTagHomeAddressCity
    /// Canonical name: PidTagHomeAddressCity
    /// Description: Contains the name of the mail user's home locality, such as the town or city.
    /// Property ID: 0x3A59
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.2
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_CITY, PR_HOME_ADDRESS_CITY_A,
    /// PR_HOME_ADDRESS_CITY_W, urn:schemas:contacts:homeCity
    case tagHomeAddressCity = 0x3A59

    /// [MS-OXPROPS] 2.726 PidTagHomeAddressCountry
    /// Canonical name: PidTagHomeAddressCountry
    /// Description: Contains the name of the mail user's home country/region.
    /// Property ID: 0x3A5A
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.5
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_COUNTRY, PR_HOME_ADDRESS_COUNTRY_A,
    /// PR_HOME_ADDRESS_COUNTRY_W, urn:schemas:contacts:homeCountry
    case tagHomeAddressCountry = 0x3A5A

    /// [MS-OXPROPS] 2.727 PidTagHomeAddressPostalCode
    /// Canonical name: PidTagHomeAddressPostalCode
    /// Description: Contains the postal code for the mail user's home postal address.
    /// Property ID: 0x3A5B
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.4
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_POSTAL_CODE, PR_HOME_ADDRESS_POSTAL_CODE_A,
    /// PR_HOME_ADDRESS_POSTAL_CODE_W, urn:schemas:contacts:homePostalCode
    case tagHomeAddressPostalCode = 0x3A5B

    /// [MS-OXPROPS] 2.729 PidTagHomeAddressStateOrProvince
    /// Canonical name: PidTagHomeAddressStateOrProvince
    /// Description: Contains the name of the mail user's home state or province.
    /// Property ID: 0x3A5C
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_STATE_OR_PROVINCE,
    /// PR_HOME_ADDRESS_STATE_OR_PROVINCE_A, PR_HOME_ADDRESS_STATE_OR_PROVINCE_W,
    /// urn:schemas:contacts:homeState
    case tagHomeAddressStateOrProvince = 0x3A5C

    /// [MS-OXPROPS] 2.730 PidTagHomeAddressStreet
    /// Canonical name: PidTagHomeAddressStreet
    /// Description: Contains the mail user's home street address.
    /// Property ID: 0x3A5D
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.20
    /// Consuming references: [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_STREET, PR_HOME_ADDRESS_STREET_A,
    /// PR_HOME_ADDRESS_STREET_W, urn:schemas:contacts:homeStreet
    case tagHomeAddressStreet = 0x3A5D

    /// [MS-OXPROPS] 2.728 PidTagHomeAddressPostOfficeBox
    /// Canonical name: PidTagHomeAddressPostOfficeBox
    /// Description: Contains the number or identifier of the mail user's home post office box.
    /// Property ID: 0x3A5E
    /// Data type: PtypString, 0x001F
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.7
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_HOME_ADDRESS_POST_OFFICE_BOX,
    /// PR_HOME_ADDRESS_POST_OFFICE_BOX_A, PR_HOME_ADDRESS_POST_OFFICE_BOX_W,
    /// urn:schemas:contacts:homepostofficebox
    case tagHomeAddressPostOfficeBox = 0x3A5E

    /// [MS-OXPROPS] 2.848 PidTagOtherAddressCity
    /// Canonical name: PidTagOtherAddressCity
    /// Description: Contains the name of the mail user's other locality, such as the town or city.
    /// Property ID: 0x3A5F
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.2
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_CITY, PR_OTHER_ADDRESS_CITY_A,
    /// PR_OTHER_ADDRESS_CITY_W, urn:schemas:contacts:othercity
    case tagOtherAddressCity = 0x3A5F

    /// [MS-OXPROPS] 2.849 PidTagOtherAddressCountry
    /// Canonical name: PidTagOtherAddressCountry
    /// Description: Contains the name of the mail user's other country/region.
    /// Property ID: 0x3A60
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.5
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_COUNTRY, PR_OTHER_ADDRESS_COUNTRY_A,
    /// PR_OTHER_ADDRESS_COUNTRY_W, urn:schemas:contacts:othercountry
    case tagOtherAddressCountry = 0x3A60

    /// [MS-OXPROPS] 2.850 PidTagOtherAddressPostalCode
    /// Canonical name: PidTagOtherAddressPostalCode
    /// Description: Contains the postal code for the mail user's other postal address.
    /// Property ID: 0x3A61
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.4
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_POSTAL_CODE, PR_OTHER_ADDRESS_POSTAL_CODE_A,
    /// PR_OTHER_ADDRESS_POSTAL_CODE_W, urn:schemas:contacts:otherpostalcode
    case tagOtherAddressPostalCode = 0x3A61

    /// [MS-OXPROPS] 2.852 PidTagOtherAddressStateOrProvince
    /// Canonical name: PidTagOtherAddressStateOrProvince
    /// Description: Contains the name of the mail user's other state or province.
    /// Property ID: 0x3A62
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.3
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_STATE_OR_PROVINCE,
    /// PR_OTHER_ADDRESS_STATE_OR_PROVINCE_A, PR_OTHER_ADDRESS_STATE_OR_PROVINCE_W,
    /// urn:schemas:contacts:otherstate
    case tagOtherAddressStateOrProvince = 0x3A62

    /// [MS-OXPROPS] 2.853 PidTagOtherAddressStreet
    /// Canonical name: PidTagOtherAddressStreet
    /// Description: Contains the mail user's other street address.
    /// Property ID: 0x3A63
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.1
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_STREET, PR_OTHER_ADDRESS_STREET_A,
    /// PR_OTHER_ADDRESS_STREET_W, urn:schemas:contacts:otherstreet
    case tagOtherAddressStreet = 0x3A63

    /// [MS-OXPROPS] 2.851 PidTagOtherAddressPostOfficeBox
    /// Canonical name: PidTagOtherAddressPostOfficeBox
    /// Description: Contains the number or identifier of the mail user's other post office box.
    /// Property ID: 0x3A64
    /// Data type: PtypString, 0x001F
    /// Area: Address Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.3.7
    /// Consuming references: [MS-OXVCARD]
    /// Alternate names: PR_OTHER_ADDRESS_POST_OFFICE_BOX,
    /// PR_OTHER_ADDRESS_POST_OFFICE_BOX_A, PR_OTHER_ADDRESS_POST_OFFICE_BOX_W,
    /// urn:schemas:contacts:otherpostofficebox
    case tagOtherAddressPostOfficeBox = 0x3A64

    // case unknown0x3A65 = 0x3A65

    // case unknown0x3A66 = 0x3A66

    // case unknown0x3A67 = 0x3A67

    // case unknown0x3A68 = 0x3A68

    // case unknown0x3A69 = 0x3A69

    /// [MS-OXPROPS] 2.1054 PidTagUserX509Certificate
    /// Canonical name: PidTagUserX509Certificate
    /// Description: Contains a list of certificates for the mail user.
    /// Property ID: 0x3A70
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: MapiMailUser
    /// Defining reference: [MS-OXOABK] section 2.2.4.36
    /// Consuming references: [MS-OXLDAP], [MS-OXOAB], [MS-OXOCNTC], [MS-OXVCARD]
    /// Alternate names: PR_USER_X509_CERTIFICATE
    case tagUserX509Certificate = 0x3A70

    /// [MS-OXPROPS] 2.1008 PidTagSendInternetEncoding
    /// Canonical name: PidTagSendInternetEncoding
    /// Description: Contains a bitmask of message encoding preferences for email sent to an email-enabled
    /// entity that is represented by this Address Book object.
    /// Property ID: 0x3A71
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Properties
    /// Defining reference: [MS-OXOABK] section 2.2.3.19
    /// Consuming references: [MS-OXCMAIL], [MS-OXCMSG], [MS-OXOMSG]
    /// Alternate names: PR_SEND_INTERNET_ENCODING, ptagSendInternetEncoding
    case tagSendInternetEncoding = 0x3A71

    // case unknown0x3A72 = 0x3A72

    // case unknown0x3CFF = 0x3CFF

    /// PidTagStoreProviders
    /// Not documented in specification but known on internet
    /// Contains a list of identifiers of message store providers in the current profile.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagstoreproviders-canonical-property
    case tagStoreProviders = 0x3D00

    /// PidTagAbProviders
    /// Not documented in specification but known on internet
    /// Contains a list of identifiers for address book providers in the current profile.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagabproviders-canonical-property
    case tagAbProviders = 0x3D01

    /// PidTagTransportProviders
    /// Not documented in specification but known on internet
    /// Contains a list of identifiers of transport providers in the current profile.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagtransportproviders-canonical-property
    case tagTransportProviders = 0x3D02

    // case unknown0x3D03 = 0x3D03

    // case unknown0x3F07 = 0x3F07

    /// [MS-OXPROPS] 2.740 PidTagInitialDetailsPane
    ///Canonical name: PidTagInitialDetailsPane
    ///Description: Indicates which page of a display template to display first.
    ///Property ID: 0x3F08
    ///Data type: PtypInteger32, 0x0003
    ///Area: MAPI Display Tables
    ///Defining reference: [MS-OXOABK] section 2.2.3.33
    ///Consuming Reference: [MS-OXNSPI]
    ///Alternate names: PR_INITIAL_DETAILS_PANE
    case tagInitialDetailsPane = 0x3F08

    // case unknown0x3F09 = 0x3F09

    // case unknown0x3FD8 = 0x3FD8

    /// Not documented in specification - known on internet
    case tagPreview = 0x3FD9

    // case unknown0x3FDA = 0x3FDA

    // case unknown0x3FDB = 0x3FDB

    // case unknown0x3FDC = 0x3FDC

    // case unknown0x3FDD = 0x3FDD

    /// [MS-OXPROPS] 2.746 PidTagInternetCodepage
    /// Canonical name: PidTagInternetCodepage
    /// Description: Indicates the code page used for the PidTagBody property (section 2.618) or the
    /// PidTagBodyHtml property (section 2.621).
    /// Property ID: 0x3FDE
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.56.6
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXCMSG], [MSOXORMMS], [MS-OXORSS], [MS-OXOSMMS], [MS-OXTNEF]
    /// Alternate names: PR_INTERNET_CPID, ptagInternetCpid
    case tagInternetCodepage = 0x3FDE

    /// [MS-OXPROPS] 2.615 PidTagAutoResponseSuppress
    /// Canonical name: PidTagAutoResponseSuppress
    /// Description: Specifies whether a client or server application will forego sending automated replies in
    /// response to this message.
    /// Property ID: 0x3FDF
    /// Data type: PtypInteger32, 0x0003
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.1.77
    /// Consuming references: [MS-OXCMAIL], [MS-OXORULE]
    /// Alternate names: PR_AUTO_RESPONSE_SUPPRESS, ptagAutoResponseSuppress
    case tagAutoResponseSuppress = 0x3FDF

    //// 2.506 PidTagAccessControlListData
    //// Canonical name: PidTagAccessControlListData
    //// Description: Contains a permissions list for a folder.
    //// Property ID: 0x3FE0
    //// Data type: PtypBinary, 0x0102
    //// Area: Access Control Properties
    //// Defining reference: [MS-OXCPERM] section 2.2.3
    //// Consuming references: [MS-OXCFOLD]
    //// Alternate names: PR_ACL_DATA, ptagACLData
    case tagAccessControlListData = 0x3FE0

    /// PidTagRulesTable
    /// Not documented in specification but known on internet
    /// Contains a table with all rules applied to a folder.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrulestable-canonical-property
    case tagRulesTable = 0x3FE1

    // case unknown0x3FE2 = 0x3FE2

    /// [MS-OXPROPS] 2.666 PidTagDelegatedByRule
    /// Canonical name: PidTagDelegatedByRule
    /// Description: Specifies whether the message was forwarded due to the triggering of a delegate
    /// forward rule.
    /// Property ID: 0x3FE3
    /// Data type: PtypBoolean, 0x000B
    /// Area: MapiStatus
    /// Defining reference: [MS-OXOMSG] section 2.2.1.84
    /// Consuming references: [MS-OXODLGT], [MS-OXORULE]
    /// Alternate names: PR_DELEGATED_BY_RULE
    case tagDelegatedByRule = 0x3FE3

    // case unknown0x3FE4 = 0x3FE4

    // case unknown0x3FE5 = 0x3FE5

    // case unknown0x3FE6 = 0x3FE6

    /// [MS-OXPROPS] 2.929 PidTagResolveMethod
    /// Canonical name: PidTagResolveMethod
    /// Description: Specifies how to resolve any conflicts with the message.
    /// Property ID: 0x3FE7
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiStatus
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.4.1
    /// Alternate names: PR_RESOLVE_METHOD, ptagResolveMethod
    case tagResolveMethod = 0x3FE7

    // case unknown0x3FE8 = 0x3FE8

    // case unknown0x3FE9 = 0x3FE9

    /// [MS-OXPROPS] 2.717 PidTagHasDeferredActionMessages
    /// Canonical name: PidTagHasDeferredActionMessages
    /// Description: Indicates whether a Message object has a deferred action message associated with it.
    /// Property ID: 0x3FEA
    /// Data type: PtypBoolean, 0x000B
    /// Area: Rules
    /// Defining reference: [MS-OXORULE] section 2.2.9.1
    /// Alternate names: PR_HAS_DAMS, ptagHasDAMs
    case tagHasDeferredActionMessages = 0x3FEA

    /// [MS-OXPROPS] 2.663 PidTagDeferredSendNumber
    /// Canonical name: PidTagDeferredSendNumber
    /// Description: Contains a number used in the calculation of how long to defer sending a message.
    /// Property ID: 0x3FEB
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiStatus
    /// Defining reference: [MS-OXOMSG] section 2.2.3.2
    /// Alternate names: PR_DEFERRED_SEND_NUMBER
    case tagDeferredSendNumber = 0x3FEB

    /// [MS-OXPROPS] 2.665 PidTagDeferredSendUnits
    /// Canonical name: PidTagDeferredSendUnits
    /// Description: Specifies the unit of time used as a multiplier with the PidTagDeferredSendNumber
    /// property (section 2.663) value.
    /// Property ID: 0x3FEC
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiStatus
    /// Defining reference: [MS-OXOMSG] section 2.2.3.3
    /// Alternate names: PR_DEFERRED_SEND_UNITS
    case tagDeferredSendUnits = 0x3FEC

    /// [MS-OXPROPS] 2.688 PidTagExpiryNumber
    /// Canonical name: PidTagExpiryNumber
    /// Description: Contains an integer value that is used along with the PidTagExpiryUnits property
    /// (section 2.690) to define the expiry send time.
    /// Property ID: 0x3FED
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiStatus
    /// Defining reference:[MS-OXOMSG] section 2.2.3.5
    /// Alternate names: PR_EXPIRY_NUMBER
    case tagExpiryNumber = 0x3FED

    /// [MS-OXPROPS] 2.690 PidTagExpiryUnits
    /// Canonical name: PidTagExpiryUnits
    /// Description: Contains the unit of time that the value of the PidTagExpiryNumber property (section
    /// 2.688) multiplies.
    /// Property ID: 0x3FEE
    /// Data type: PtypInteger32, 0x0003
    /// Area: MapiStatus
    /// Defining reference: [MS-OXOMSG] section 2.2.3.6
    /// Alternate names: PR_EXPIRY_UNITS
    case tagExpiryUnits = 0x3FEE

    /// [MS-OXPROPS] 2.664 PidTagDeferredSendTime
    /// Canonical name: PidTagDeferredSendTime
    /// Description: Contains the amount of time after which a client would like to defer sending the
    /// message.
    /// Property ID: 0x3FEF
    /// Data type: PtypTime, 0x0040
    /// Area: MapiStatus
    /// Defining reference: [MS-OXOMSG] section 2.2.3.4
    /// Alternate names: PR_DEFERRED_SEND_TIME, ptagDeferredSendTime
    case tagDeferredSendTime = 0x3FEF

    /// [MS-OXPROPS] 2.641 PidTagConflictEntryId
    /// Canonical name: PidTagConflictEntryId
    /// Description: Contains the EntryID of the conflict resolve message.
    /// Property ID: 0x3FF0
    /// Data type: PtypBinary, 0x0102
    /// Area: ICS
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.4.2
    /// Alternate names: PR_CONFLICT_ENTRYID, ptagConflictEntryId
    case tagConflictEntryId = 0x3FF0

    /// [MS-OXPROPS] 2.793 PidTagMessageLocaleId
    /// Canonical name: PidTagMessageLocaleId
    /// Description: Contains the Windows Locale ID of the end-user who created this message.
    /// Property ID: 0x3FF1
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.5
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMAIL], [MS-OXOMSG], [MSOXTNEF]
    /// Alternate names: PR_MESSAGE_LOCALE_ID
    case tagMessageLocaleId = 0x3FF1

    // case unknown0x3FF2 = 0x3FF2

    // case unknown0x3FF3 = 0x3FF3

    // case unknown0x3FF4 = 0x3FF4

    // case unknown0x3FF5 = 0x3FF5

    // case unknown0x3FF6 = 0x3FF6

    // case unknown0x3FF7 = 0x3FF7

    /// [MS-OXPROPS] 2.656 PidTagCreatorName
    /// Canonical name: PidTagCreatorName
    /// Description: Contains the name of the creator of a Message object.
    /// Property ID: 0x3FF8
    /// Data type: PtypString, 0x001F
    /// Area: General Message Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.51
    /// Consuming references: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: PR_CREATOR_NAME, PR_CREATOR_NAME_A, ptagCreatorName,
    /// PR_CREATOR_NAME_W
    case tagCreatorName = 0x3FF8

    /// [MS-OXPROPS] 2.655 PidTagCreatorEntryId
    /// Canonical name: PidTagCreatorEntryId
    /// Description: Specifies the original author of the message according to their Address Book EntryID.
    /// Property ID: 0x3FF9
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.31
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_CREATOR_ENTRYID, ptagCreatorEntryId
    case tagCreatorEntryId = 0x3FF9

    /// [MS-OXPROPS] 2.766 PidTagLastModifierName
    /// Canonical name: PidTagLastModifierName
    /// Description: Contains the name of the last mail user to change the Message object.
    /// Property ID: 0x3FFA
    /// Data type: PtypString, 0x001F
    /// Area: History Properties
    /// Defining reference: [MS-OXCPRPT] section 2.2.1.5
    /// Consuming references: [MS-OXCFOLD], [MS-OXCFXICS], [MS-OXCMSG], [MS-OXTNEF]
    /// Alternate names: PR_LAST_MODIFIER_NAME, PR_LAST_MODIFIER_NAME_A, ptagLastModifierName,
    /// PR_LAST_MODIFIER_NAME_W
    case tagLastModifierName = 0x3FFA

    /// [MS-OXPROPS] 2.765 PidTagLastModifierEntryId
    /// Canonical name: PidTagLastModifierEntryId
    /// Description: Specifies the Address Book EntryID of the last user to modify the contents of the
    /// message.
    /// Property ID: 0x3FFB
    /// Data type: PtypBinary, 0x0102
    /// Area: History Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.32
    /// Consuming reference: [MS-OXTNEF]
    /// Alternate names: PR_LAST_MODIFIER_ENTRYID, ptagLastModifierEntryId
    case tagLastModifierEntryId = 0x3FFB


    // case unknown0x3FFC = 0x3FFC

    /// [MS-OXPROPS] 2.788 PidTagMessageCodepage
    /// Canonical name: PidTagMessageCodepage
    /// Description: Specifies the code page used to encode the non-Unicode string properties on this
    /// Message object.
    /// Property ID: 0x3FFD
    /// Data type: PtypInteger32, 0x0003
    /// Area: Common
    /// Defining reference: [MS-OXCMSG] section 2.2.1.4
    /// Consuming references: [MS-OXTNEF] [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXPFOAB]
    /// Alternate names: PR_MESSAGE_CODEPAGE
    case tagMessageCodepage = 0x3FFD

    // case unknown0x3FFE = 0x3FFE

    // case unknown0x3FFF = 0x3FFF

    /// [MS-OXPROPS] 2.908 PidTagNewAttach
    /// Canonical name: PidTagNewAttach
    /// Property ID: 0x4000
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagNewAttach
    case tagNewAttach = 0x4000

    /// [MS-OXPROPS] 2.1145 PidTagStartEmbed
    /// Canonical name: PidTagStartEmbed
    /// Property ID: 0x4001
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartEmbed
    case tagStartEmbed = 0x4001

    /// [MS-OXPROPS] 2.758 PidTagEndEmbed
    /// Canonical name: PidTagEndEmbed
    /// Property ID: 0x4002
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEndEmbed
    case tafEndEmbed = 0x4002

    /// [MS-OXPROPS] 2.1148 PidTagStartRec ip
    /// Canonical name: PidTagStartRecip
    /// Property ID: 0x4003
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartRecip
    case tagStartRecip = 0x4003

    /// [MS-OXPROPS] 2.761 PidTagEndToRecip
    /// Canonical name: PidTagEndToRecip
    /// Property ID: 0x4004
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEndToRecip
    case tagEndToRecip = 0x4004

    // case unknown0x4005 = 0x4005

    // case unknown0x4006 = 0x4006

    // case unknown0x4007 = 0x4007

    // case unknown0x4008 = 0x4008

    /// [MS-OXPROPS] 2.1150 PidTagStartTopFld
    /// Canonical name: PidTagStartTopFld
    /// Property ID: 0x4009
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartTopFld
    case tagStartTopFld = 0x4009

    /// [MS-OXPROPS] 2.1149 PidTagStartSubF ld
    /// Canonical name: PidTagStartSubFld
    /// Property ID: 0x400A
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartSubFld
    case tagStartSubF = 0x400A

    /// [MS-OXPROPS] 2.759 PidTagEndFolder
    /// Canonical name: PidTagEndFolder
    /// Property ID: 0x400B
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEndFolder
    case tagEndFolder = 0x400B

    /// [MS-OXPROPS] 2.1147 PidTagStartMessage
    /// Canonical name: PidTagStartMessage
    /// Property ID: 0x400C
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartMessage
    case tagStartMessage = 0x400C

    /// [MS-OXPROPS] 2.760 PidTagEndMessage
    /// Canonical name: PidTagEndMessage
    /// Property ID: 0x400D
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEndMessage
    case tagEndMessage = 0x400D

    /// [MS-OXPROPS] 2.756 PidTagEndAttach
    /// Canonical name: PidTagEndAttach
    /// Property ID: 0x400E
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEndAttach
    case tagEndAttach = 0x400E

    /// [MS-OXPROPS] 2.754 PidTagEcWarning
    /// Canonical name: PidTagEcWarning
    /// Property ID: 0x400F
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagEcWarning
    case tagEcWarning = 0x400F

    /// [MS-OXPROPS] 2.1146 PidTagStartFAIMsg
    /// Canonical name: PidTagStartFAIMsg
    /// Property ID: 0x4010
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagStartFAIMsg
    case tagStartFAIMsg = 0x4010

    /// [MS-OXPROPS] 2.909 PidTagNewFXFolder
    /// Canonical name: PidTagNewFXFolder
    /// Property ID: 0x4011
    /// Data type: PtypBinary, 0x0102
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagNewFXFolder
    case tagNewFXFolder = 0x4011

    /// [MS-OXPROPS] 2.827 PidTagIncrSyncChg
    /// Canonical name: PidTagIncrSyncChg
    /// Property ID: 0x4012
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncChg
    case tagIncrSyncChg = 0x4012

    /// [MS-OXPROPS] 2.829 PidTagIncrSyncDel
    /// Canonical name: PidTagIncrSyncDel
    /// Property ID: 0x4013
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncDel
    case tagIncrSyncDel = 0x4013

    /// [MS-OXPROPS] 2.830 PidTagIncrSyncEnd
    /// Canonical name: PidTagIncrSyncEnd
    /// Property ID: 0x4014
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncEnd
    case tagIncrSyncEnd = 0x4014

    /// [MS-OXPROPS] 2.833 PidTagIncrSyncMessage
    /// Canonical name: PidTagIncrSyncMessage
    /// Property ID: 0x4015
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncMsg
    case tagIncrSyncMessage = 0x4015

    /// [MS-OXPROPS] 2.789 PidTagFXDe lProp
    /// Canonical name: PidTagFXDelProp
    /// Property ID: 0x4016
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagFXDelProp
    case tagFXDelProp = 0x4016

    /// [MS-OXPROPS] 2.819 PidTagIdsetGiven
    /// Canonical name: PidTagIdsetGiven
    /// Property ID: 0x4017
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIdsetGiven
    case tagIdsetGiven = 0x4017

    /// [MS-OXPROPS] 2.790 PidTagFXErrorInfo
    /// Canonical name: PidTagFXErrorInfo
    /// Property ID: 0x4018
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagFXErrorInfo
    case tagFXErrorInfo = 0x4018

    /// [MS-OXPROPS] 2.1118 PidTagSenderFlags
    /// Canonical name: PidTagSenderFlags
    /// Property ID: 0x4019
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagSenderFlags
    /// Not documented in specification - removed
    case tagSenderFlags = 0x4019

    /// [MS-OXPROPS] 2.1015 PidTagSentRepresentingFlags
    /// Canonical name: PidTagSentRepresentingFlags
    /// Description:
    /// Property ID: 0x401A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference:
    /// Consuming references: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagSentRepresentingFlags
    case tagSentRepresentingFlags = 0x401A

    /// [MS-OXPROPS] 2.998 PidTagReceivedByFlags
    /// Canonical name: PidTagReceivedByFlags
    /// Property ID: 0x401B
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagRcvdByFlags
    /// Not documented in specification - removed
    case tagReceivedByFlags = 0x401B

    /// [MS-OXPROPS] 2.1004 PidTagReceivedRepresentingFlags
    /// Canonical name: PidTagReceivedRepresentingFlags
    /// Property ID: 0x401C
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS], [MS-OXTNEF]
    /// Alternate names: ptagRcvdRepresentingFlags
    /// Not documented in specification - removed
    case tagReceivedRepresentingFlags = 0x401C

    // case unknown0x401D = 0x401D

    // case unknown0x401E = 0x401E

    // case unknown0x401F = 0x401F

    // case unknown0x4020 = 0x4020

    /// [MS-OXPROPS] 2.607 PidTagIdsetSoftDeleted
    /// Canonical name: PidTagIdsetSoftDeleted
    /// Property ID: 0x4021
    /// Data type: PtypBinary, 0x0102
    /// Area: Sync
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagSoftDeletes
    case tagIdsetSoftDeleted = 0x4021

    /// [MS-OXPROPS] 2.523 PidTagCreatorAddressType
    /// Canonical name: PidTagCreatorAddressType
    /// Property ID: 0x4022
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXCMAIL]
    /// Alternate names: ptagCreatorAddrType
    /// Not documented in specification - removed
    case tagCreatorAddressType = 0x4022

    /// [MS-OXPROPS] 2.524 PidTagCreatorEmailAddress
    /// Canonical name: PidTagCreatorEmailAddress
    /// Property ID: 0x4023
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXCMAIL]
    /// Alternate names: ptagCreatorEmailAddr
    /// Not documented in specification - removed
    case tagCreatorEmailAddress = 0x4023

    case unknown0x4024 = 0x4024

    case unknown0x4025 = 0x4025

    // case unknown0x4026 = 0x4026

    // case unknown0x4027 = 0x4027

    // case unknown0x4028 = 0x4028

    /// [MS-OXPROPS] 2.879 PidTagReadReceiptAddressType
    /// Canonical name: PidTagReadReceiptAddressType
    /// Description: Contains the address type of the end user to whom a read receipt is directed.
    /// Property ID: 0x4029
    /// Data type: PtypString, 0x001F
    /// Area: Transport Envelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.24
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagReadReceiptAddrType, ReadReceiptAddrType
    case tagReadReceiptAddressType = 0x4029

    /// [MS-OXPROPS] 2.880 PidTagReadReceiptEmailAddress
    /// Canonical name: PidTagReadReceiptEmailAddress
    /// Description: Contains the email address of the end user to whom a read receipt is directed.
    /// Property ID: 0x402A
    /// Data type: PtypString, 0x001F
    /// Area: Transport Envelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.25
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagReadReceiptEmailAddr, ReadReceiptEmailAddress
    case tagReadReceiptEmailAddress = 0x402A

    /// [MS-OXPROPS] 2.882 PidTagReadReceiptName
    /// Canonical name: PidTagReadReceiptName
    /// Description: Contains the display name for the end user to whom a read receipt is directed.
    /// Property ID: 0x402B
    /// Data type: PtypString, 0x001F
    /// Area: Transport Envelope
    /// Defining reference: [MS-OXOMSG] section 2.2.2.27
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagReadReceiptDisplayName, ReadReceiptDisplayName
    case tagReadReceiptName = 0x402B

    // case unknown0x402C = 0x402C

    /// [MS-OXPROPS] 2.820 PidTagIdsetRead
    /// Canonical name: PidTagIdsetRead
    /// Property ID: 0x402D
    /// Data type: PtypBinary, 0x0102
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIdsetRead
    /// Not documented in specification - removed
    case tagIdsetRead = 0x402D

    /// [MS-OXPROPS] 2.822 PidTagIdsetUnread
    /// Canonical name: PidTagIdsetUnread
    /// Property ID: 0x402E
    /// Data type: PtypBinary, 0x0102
    /// Area: TransportEnvelope
    /// References: [MS-OXCFXICS]
    /// Not documented in specification - removed
    case tagIdsetUnread = 0x402E

    /// [MS-OXPROPS] 2.836 PidTagIncrSyncRead
    /// Canonical name: PidTagIncrSyncRead
    /// Property ID: 0x402F
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncRead
    /// Not documented in specification - removed
    case tagIncrSyncRead = 0x402F

    /// [MS-OXPROPS] 2.1122 PidTagSenderSimpleDisplayName
    /// Canonical name: PidTagSenderSimpleDisplayName
    /// Property ID: 0x4030
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagSenderSimpleDispName
    /// Not documented in specification - removed
    case tagSenderSimpleDisplayName = 0x4030

    /// [MS-OXPROPS] 2.1136 PidTagSentRepresentingSimpleDisplayName
    /// Canonical name: PidTagSentRepresentingSimpleDisplayName
    /// Property ID: 0x4031
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagSentRepresentingSimpleDispName
    /// Not documented in specification - removed
    case tagSentRepresentingSimpleDisplayName = 0x4031

    // case unknown0x4032 = 0x4032

    // case unknown0x4033 = 0x4033

    case unknown0x4034 = 0x4034

    case unknown0x4035 = 0x4035

    // case unknown0x4036 = 0x4036

    // case unknown0x4037 = 0x4037

    /// [MS-OXPROPS] 2.732 PidTagCreatorSimpleDisplayName
    /// Canonical name: PidTagCreatorSimpleDisplayName
    /// Property ID: 0x4038
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagCreatorSimpleDispName
    /// Not documented in specification - removed
    case tagCreatorSimpleDisplayName = 0x4038

    /// [MS-OXPROPS] 2.869 PidTagLastModifierSimpleDisplayName
    /// Canonical name: PidTagLastModifierSimpleDisplayName
    /// Property ID: 0x4039
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// References: [MS-OXTNEF]
    /// Alternate names: ptagLastModifierSimpleDispName
    /// Not documented in specification - removed
    case tagLastModifierSimpleDisplayName = 0x4039

    /// [MS-OXPROPS] 2.837 PidTagIncrSyncStateBegin
    /// Canonical name: PidTagIncrSyncStateBegin
    /// Property ID: 0x403A
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncStateBegin
    /// Not documented in specification - removed
    case tagIncrSyncStateBegin = 0x403A

    /// [MS-OXPROPS] 2.838 PidTagIncrSyncStateEnd
    /// Canonical name: PidTagIncrSyncStateEnd
    /// Property ID: 0x403B
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncStateEnd
    /// Not documented in specification - removed
    case tagIncrSyncStateEnd = 0x403B

    // case unknown0x403C

    /// Not documented in specification - known on internet
    case creatorFlag = 0x4059

    /// Not documented in specification - known on internet
    case modifierFlag = 0x405A

    // case unknown0x4073 = 0x4073

    /// [MS-OXPROPS] 2.836   PidTagIncrSyncProgressMode
    /// Canonical name: PidTagIncrSyncProgressMode
    /// Property ID: 0x4074
    /// Data type: PtypBoolean, 0x000B
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncProgressMode
    case tagIncrSyncProgressMode = 0x4074

    /// [MS-OXPROPS] 2.837   PidTagIncrSyncProgressPerMsg
    /// Canonical name: PidTagIncrSyncProgressPerMsg
    /// Property ID: 0x4075
    /// Data type: PtypBoolean, 0x000B
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncProgressPerMsg
    case tagIncrSyncProgressPerMsg = 0x4075

    /// [MS-OXPROPS] 2.647 PidTagContentFilterSpamConfidenceLevel
    /// Canonical name: PidTagContentFilterSpamConfidenceLevel
    /// Description: Indicates a confidence level that the message is spam.
    /// Property ID: 0x4076
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXCSPAM] section 2.2.1.3
    /// Consuming references: [MS-OXCFXICS], [MS-OXCMAIL], [MS-OXOMSG], [MS-OXORULE], [MSOXTNEF]
    /// Alternate names: PR_CONTENT_FILTER_SCL, ptagContentFilterSCL
    case tagContentFilterSpamConfidenceLevel = 0x4076

    // case unknown0x4077 = 0x4077

    // case unknown0x4078 = 0x4078

    /// [MS-OXPROPS] 2.1003 PidTagSenderIdStatus
    /// Canonical name: PidTagSenderIdStatus
    /// Description: Reports the results of a Sender-ID check.
    /// Property ID: 0x4079
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging Properties
    /// Defining reference: [MS-OXOMSG] section 2.2.1.80
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_SENDER_ID_STATUS
    case tagSenderIdStatus = 0x4079

    /// [MS-OXPROPS] 2.826 PidTagIncrementalSyncMessagePartial
    /// Canonical name: PidTagIncrementalSyncMessagePartial
    /// Property ID: 0x407A
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncMsgPartial
    /// Not documented in specification - removed
    case tagIncrementalSyncMessagePartial = 0x407A

    /// [MS-OXPROPS] 2.832 PidTagIncrSyncGroupInfo
    /// Canonical name: PidTagIncrSyncGroupInfo
    /// Property ID: 0x407B
    /// Data type: PtypBinary, 0x0102
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncGroupInfo
    /// Not documented in specification - removed
    case tagIncrSyncGroupInfo = 0x407B

    /// [MS-OXPROPS] 2.831 PidTagIncrSyncGroupId
    /// Canonical name: PidTagIncrSyncGroupId
    /// Property ID: 0x407C
    /// Data type: PtypInteger32, 0x0003
    /// Area: ICS
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncGroupId
    /// Not documented in specification - removed
    case tagIncrSyncGroupId = 0x407C

    /// [MS-OXPROPS] 2.828 PidTagIncrSyncChgPartial
    /// Canonical name: PidTagIncrSyncChgPartial
    /// Property ID: 0x407D
    /// Data type: PtypInteger32, 0x0003
    /// Area: IC
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIncrSyncChgPartial
    /// Not documented in specification - removed
    case tagIncrSyncChgPartial = 0x407D

    // case unknown0x407E = 0x407E

    // case unknown0x407F = 0x407F

    // case unknown0x4080 = 0x4080

    // case unknown0x4081 = 0x4081

    /// [MS-OXPROPS] 2.721 PidTagHierRev
    /// Canonical name: PidTagHierRev
    /// Description: Specifies the time, in UTC, to trigger the client in cached mode to synchronize the folder
    /// hierarchy.
    /// Property ID: 0x4082
    /// Data type: PtypTime, 0x0040
    /// Area: TransportEnvelope
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.9
    /// Alternate names: PR_HIER_REV, ptagHierRev
    case tagHierRev = 0x4082

    /// [MS-OXPROPS] 2.876 PidTagPurportedSenderDomain
    /// Canonical name: PidTagPurportedSenderDomain
    /// Description: Contains the domain responsible for transmitting the current message.
    /// Property ID: 0x4083
    /// Data type: PtypString, 0x001F
    /// Area: TransportEnvelope
    /// Defining reference: [MS-OXCMSG] section 2.2.1.43
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: PR_PURPORTED_SENDER_DOMAIN
    case tagPurportedSenderDomain = 0x4083

    /// [MS-OXPROPS] 2.721 PidTagContentFilterPhishingConfidenceLevel
    /// Canonical name: PidTagContentFilterPhishingConfidenceLevel
    /// Property ID: 0x4084
    /// Data type: PtypInteger32, 0x0003
    /// Area: Secure Messaging
    /// References: [MS-OXCMAIL]
    /// Alternate names: ContentFilterPcl, PR_CONTENT_FILTER_PCL
    /// Not documented in specification - removed
    case tagContentFilterPhishingConfidenceLevel = 0x4084

    // case unknown0x4085 = 0x4085

    /// Not documented in specification - known on internet
    case unknown0x5037 = 0x5037

    case tagInternetMailOverrideFormat = 0x5902
    case tagMessageEditorFormat = 0x5909
    case tagSenderSmtpAddress = 0x5D01

    /// [MS-OXPROPS]
    /// 2.1018 PidTagSentRepresentingSmtpAddress
    /// Canonical name: PidTagSentRepresentingSmtpAddress
    /// Description: Contains the SMTP email address of the end user who is represented by the sending
    /// mailbox owner.
    /// Property ID: 0x5D02
    /// Data type: PtypString, 0x001F
    /// Area: Mail
    /// Defining reference: [MS-OXOMSG] section 2.2.1.59
    /// Alternate names: ptagRecipientSentRepresentingSMTPAddress, SentRepresentingSMTPAddressXSO,
    /// PR_SENT_REPRESENTING_SMTP_ADDRESS
    case tagSentRepresentingSmtpAddress = 0x5D02

    /// [MS-OXPROPS] 2.885 PidTagReadReceiptSmtpAddress
    /// Canonical name: PidTagReadReceiptSmtpAddress
    /// Description: Contains the SMTP email address of the user to whom a read receipt is directed.
    /// Property ID: 0x5D05
    /// Data type: PtypString, 0x001F
    /// Area: Mail
    /// Defining reference: [MS-OXOMSG] section 2.2.1.30
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagRecipientReadReceiptSmtpAddress
    case tagReadReceiptSmtpAddress = 0x5D05

    /// [MS-OXPROPS] 2.892 PidTagReceivedBySmtpAddress
    /// Canonical name: PidTagReceivedBySmtpAddress
    /// Description: Contains the email message receiver's SMTP email address.
    /// Property ID: 0x5D07
    /// Data type: PtypString, 0x001F
    /// Area: Mail
    /// Defining reference: [MS-OXOMSG] section 2.2.1.41
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: ptagRecipientRcvdBySmtpAddress
    case tagReceivedBySmtpAddress = 0x5D07

    /// 2.898 PidTagReceivedRepresentingSmtpAddress
    /// Canonical name: PidTagReceivedRepresentingSmtpAddress
    /// Description: Contains the SMTP email address of the user represented by the receiving mailbox
    /// owner.
    /// Property ID: 0x5D08
    /// Data type: PtypString, 0x001F
    /// Area: Mail
    /// Defining reference: [MS-OXOMSG] section 2.2.1.28
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: ptagRecipientRcvdRepresentingSmtpAddress
    case tagReceivedRepresentingSmtpAddress = 0x5D08

    /// Not documented in specification - known on internet
    case tagSendingSmtpAddress = 0x5D09

    case unknown0x5D0A = 0x5D0A

    case unknown0x5D0B = 0x5D0B

    // case unknown0x5D0C = 0x5D0C

    // case unknown0x5FDD = 0x5FDD

    /// [MS-OXPROPS] 2.777 PidTagRecipientResourceState
    /// Canonical name: PidTagRecipientResourceState
    /// Property ID: 0x5FDE
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportRecipient
    /// References: [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_RESOURCESTATE
    /// Not documented in specification - removed
    case tagRecipientResourceState = 0x5FDE

    /// [MS-OXPROPS] 2.902 PidTagRecipientOrder
    /// Canonical name: PidTagRecipientOrder
    /// Description: Specifies the location of the current recipient in the recipient table.
    /// Property ID: 0x5FDF
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXCMSG] section 2.2.1.40
    /// Consuming references: [MS-OXCFXICS], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_ORDER, ptagRecipientOrder
    case tagRecipientOrder = 0x5FDF

    // case unknown0x5FE0 = 0x5FE0

    /// [MS-OXPROPS] 2.903 PidTagRecipientProposed
    /// Canonical name: PidTagRecipientProposed
    /// Description: Indicates that the attendee proposed a new date and/or time.
    /// Property ID: 0x5FE1
    /// Data type: PtypBoolean, 0x000B
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.4
    /// Alternate names: PR_RECIPIENT_PROPOSED, ptagRecipientProposed
    case tagRecipientProposed = 0x5FE1

    // case unknown 0x5FE2 = 0x5FE2

    /// [MS-OXPROPS] 2.905 PidTagRecipientProposedStartTime
    /// Canonical name: PidTagRecipientProposedStartTime
    /// Description: Indicates the meeting start time requested by the attendee in a counter proposal.
    /// Property ID: 0x5FE3
    /// Data type: PtypTime, 0x0040
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.5
    /// Alternate names: PR_RECIPIENT_PROPOSEDSTARTTIME, ptagRecipientProposedStartTime
    case tagRecipientProposedStartTime = 0x5FE3

    /// [MS-OXPROPS] 2.904 PidTagRecipientProposedEndTime
    /// Canonical name: PidTagRecipientProposedEndTime
    /// Description: Indicates the meeting end time requested by the attendee in a counter proposal.
    /// Property ID: 0x5FE4
    /// Data type: PtypTime, 0x0040
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.6
    /// Alternate names: PR_RECIPIENT_PROPOSEDENDTIME, ptagRecipientProposedEndTime
    case tagRecipientProposedEndTime = 0x5FE4

    case unknown0x5FE5 = 0x5FE5

    // case unknown0x5FE6 = 0x5FE6

    // case unknown0x5FE7 = 0x5FE7

    // case unknown0x5FE8 = 0x5FE8

    // case unknown0x5FE9 = 0x5FE9

    // case unknown0x5FEA = 0x5FEA

    case unknown0x5FEB = 0x5FEB

    // case unknown0x5FEC = 0x5FEC

    // case unknown0x5FED = 0x5FED

    // case unknown0x5FEE = 0x5FEE

    case unknown0x5FEF = 0x5FEF

    // case unknown0x5FF1 = 0x5FF1

    case unknown0x5FF2 = 0x5FF2

    // case unknown0x5FF3 = 0x5FF3

    // case unknown0x5FF4 = 0x5FF4

    case unknown0x5FF5 = 0x5FF5

    /// [MS-OXPROPS] 2.899 PidTagRecipientDisplayName
    /// Canonical name: PidTagRecipientDisplayName
    /// Description: Specifies the display name of the recipient.
    /// Property ID: 0x5FF6
    /// Data type: PtypString, 0x001F
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXCMSG] section 2.2.1.54
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_DISPLAY_NAME, PR_RECIPIENT_DISPLAY_NAME_W
    case tagRecipientDisplayName = 0x5FF6

    /// [MS-OXPROPS] 2.900 PidTagRecipientEntryId
    /// Canonical name: PidTagRecipientEntryId
    /// Description: Identifies an Address Book object that specifies the recipient.
    /// Property ID: 0x5FF7
    /// Data type: PtypBinary, 0x0102
    /// Area: ID Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.55
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_ENTRYID, ptagRecipientEntryId
    case tagRecipientEntryId = 0x5FF7

    // case unknown0x5FF8 = 0x5FF8

    // case unknown0x5FF9 = 0x5FF9

    // case unknown0x5FFA = 0x5FFA

    /// [MS-OXPROPS] 2.908 PidTagRecipientTrackStatusTime
    /// Canonical name: PidTagRecipientTrackStatusTime
    /// Description: Indicates the date and time at which the attendee responded.
    /// Property ID: 0x5FFB
    /// Data type: PtypTime, 0x0040
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.3
    /// Consuming reference: [MS-OXCICAL]
    /// Alternate names: PR_RECIPIENT_TRACKSTATUS_TIME, ptagRecipientTrackStatusTime
    case tagRecipientTrackStatusTime = 0x5FFB

    // case unknown0x5FFC = 0x5FFC

    /// [MS-OXPROPS] 2.901 PidTagRecipientFlags
    /// Canonical name: PidTagRecipientFlags
    /// Description: Specifies a bit field that describes the recipient status.
    /// Property ID: 0x5FFD
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.1
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXCMSG], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_FLAGS
    case tagRecipientFlags = 0x5FFD

    // case unknown0x5FFE = 0x5FFE

    /// [MS-OXPROPS] 2.907 PidTagRecipientTrackStatus
    /// Canonical name: PidTagRecipientTrackStatus
    /// Description: Indicates the response status that is returned by the attendee.
    /// Property ID: 0x5FFF
    /// Data type: PtypInteger32, 0x0003
    /// Area: TransportRecipient
    /// Defining reference: [MS-OXOCAL] section 2.2.4.10.2
    /// Consuming references: [MS-OXCICAL], [MS-OXCFXICS], [MS-OXCMSG], [MS-OXOMSG]
    /// Alternate names: PR_RECIPIENT_TRACKSTATUS, ptagRecipientTrackStatus
    case tagRecipientTrackStatus = 0x5FFF

    // case unknown0x6000 = 0x6000

    /// Not documented in specification - known on internet
    case dotstuffState = 0x6001

    // case unknown0x6002 = 0x6002

    // case unknown0x60FF = 0x60FF

    /// [MS-OXPROPS] 2.758 PidTagJunkIncludeContacts
    /// Canonical name: PidTagJunkIncludeContacts
    /// Description: Indicates whether email addresses of the contacts in the Contacts folder are treated in
    /// a special way with respect to the spam filter.
    /// Property ID: 0x6100
    /// Data type: PtypInteger32, 0x0003
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.2.2
    /// Alternate names: PR_JUNK_INCLUDE_CONTACTS
    case tagJunkIncludeContacts = 0x6100

    /// [MS-OXPROPS] 2.761 PidTagJunkThreshold
    /// Canonical name: PidTagJunkThreshold
    /// Description: Indicates how aggressively incoming email is to be sent to the Junk Email folder.
    /// Property ID: 0x6101
    /// Data type: PtypInteger32, 0x0003
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.2.5
    /// Alternate names: PR_JUNK_THRESHOLD
    case tagJunkThreshold = 0x6101

    /// [MS-OXPROPS] 2.759 PidTagJunkPermanentlyDelete
    /// Canonical name: PidTagJunkPermanentlyDelete
    /// Description: Indicates whether messages identified as spam can be permanently deleted.
    /// Property ID: 0x6102
    /// Data type: PtypInteger32, 0x0003
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.2.3
    /// Alternate names: PR_JUNK_PERMANENTLY_DELETE
    case tagJunkPermanentlyDelete = 0x6102

    /// [MS-OXPROPS] 2.757 PidTagJunkAddRecipientsToSafeSendersList
    /// Canonical name: PidTagJunkAddRecipientsToSafeSendersList
    /// Description: Indicates whether email recipients are to be added to the safe senders list.
    /// Property ID: 0x6103
    /// Data type: PtypInteger32, 0x0003
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.2.1
    /// Alternate names: PR_JUNK_ADD_RECIPS_TO_SSL
    case tagJunkAddRecipientsToSafeSendersList = 0x6103

    // case unknown0x6104 = 0x6104

    // case unknown0x6105 = 0x6105

    // case unknown0x6106 = 0x6106

    /// [MS-OXPROPS] 2.760 PidTagJunkPhishingEnableLinks
    /// Canonical name: PidTagJunkPhishingEnableLinks
    /// Description: Indicated whether the phishing stamp on a message is to be ignored.
    /// Property ID: 0x6107
    /// Data type: PtypBoolean, 0x000B
    /// Area: Spam
    /// Defining reference: [MS-OXCSPAM] section 2.2.2.4
    /// Consuming reference: [MS-OXPHISH]
    /// Alternate names: PR_JUNK_PHISHING_ENABLE_LINKS
    case tagJunkPhishingEnableLinks = 0x6107

    // case unknown0x6108 = 0x6108

    // case unknown0x61FF = 0x61FF

    case unknown0x6200 = 0x6200

    case unknown0x6201 = 0x6201

    // case unknown0x6202 = 0x6202

    // case unknown0x64EF = 0x64EF

    /// [MS-OXPROPS] 2.803 PidTagMimeSkeleton
    /// Canonical name: PidTagMimeSkeleton
    /// Description: Contains the top-level MIME message headers, all MIME message body part headers,
    /// and body part content that is not already converted to Message object properties, including
    /// attachments.
    /// Property ID: 0x64F0
    /// Data type: PtypBinary, 0x0102
    /// Area: MIME properties
    /// Defining reference: [MS-OXCMSG] section 2.2.1.28
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: ptagMimeSkeleton
    case tagMimeSkeleton = 0x64F0

    // case unknown0x64F1 = 0x64F1

    // case unknown0x65C1 = 0x65C1

    /// [MS-OXPROPS] 2.918 PidTagReplyTemplateId
    /// Canonical name: PidTagReplyTemplateId
    /// Description: Contains the value of the GUID that points to a Reply template.
    /// Property ID: 0x65C2
    /// Data type: PtypBinary, 0x0102
    /// Area: Rules
    /// Defining reference: [MS-OXORULE] section 2.2.9.2
    /// Alternate names: PR_REPLY_TEMPLATE_ID, ptagReplyTemplateId
    case tagReplyTemplateId = 0x65C2

    // case unknown0x65C2 = 0x65C2

    // case unknown0x65C3 = 0x65C3

    // case unknown0x65C4 = 0x65C4

    // case unknown0x65C5 = 0x65C5

    /// [MS-OXPROPS] 2.871 PidTagSecureSubmitFlags
    /// Canonical name: PidTagSecureSubmitFlags
    /// Property ID: 0x65C6
    /// Data type: PtypInteger32, 0x0003
    /// Area: Exchange
    /// References: [MS-OXCFXICS]
    /// Alternate names: PR_SECURE_SUBMIT_FLAGS, ptagSecureSubmitFlags
    /// https://social.msdn.microsoft.com/Forums/en-US/63d11b6a-109c-4bdb-83ce-6b52dabea25f/msoxprops-msoxcfxics-pidtagsecuresubmitflags?forum=os_exchangeprotocols
    case tagSecureSubmitFlags = 0x65C6

    // case unknown0x65C7 = 0x65C7

    // case unknown0x65DF = 0x65DF

    /// [MS-OXPROPS] 2.1022 PidTagSourceKey
    /// Canonical name: PidTagSourceKey
    /// Description: Contains a value that contains an internal global identifier (GID) for this folder or
    /// message.
    /// Property ID: 0x65E0
    /// Data type: PtypBinary, 0x0102
    /// Area: Sync
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.5
    /// Alternate names: PR_SOURCE_KEY
    case tagSourceKey = 0x65E0

    /// [MS-OXPROPS] 2.861 PidTagParentSourceKey
    /// Canonical name: PidTagParentSourceKey
    /// Description: Contains a value on a folder that contains the PidTagSourceKey property (section
    /// 2.1022) of the parent folder.
    /// Property ID: 0x65E1
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.6
    /// Alternate names: PR_PARENT_SOURCE_KEY
    case tagParentSourceKey = 0x65E1

    /// [MS-OXPROPS] 2.631 PidTagChangeKey
    /// Canonical name: PidTagChangeKey
    /// Description: Contains a structure that identifies the last change to the object.
    /// Property ID: 0x65E2
    /// Data type: PtypBinary, 0x0102
    /// Area: History Properties
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.7
    /// Consuming references: [MS-OXCFOLD], [MS-OXCMSG], [MS-OXCPRPT]
    /// Alternate names: PR_CHANGE_KEY
    case tagChangeKey = 0x65E2

    /// [MS-OXPROPS] 2.867 PidTagPredecessorChangeList
    /// Canonical name: PidTagPredecessorChangeList
    /// Description: Contains a value that contains a serialized representation of a PredecessorChangeList
    /// structure.
    /// Property ID: 0x65E3
    /// Data type: PtypBinary, 0x0102
    /// Area: Sync
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.8
    /// Alternate names: PR_PREDECESSOR_CHANGE_LIST
    case tagPredecessorChangeList = 0x65E3

    // case unknown0x65E4 = 0x65E4

    // case unknown0x65E5 = 0x65E5

    // case unknown0x65E6 = 0x65E6

    // case unknown0x65E7 = 0x65E7

    // case unknown0x65E8 = 0x65E8

    /// [MS-OXPROPS] 2.957 PidTagRuleMessageState
    /// Canonical name: PidTagRuleMessageState
    /// Description: Contains flags that specify the state of the rule. Set on the FAI message.
    /// Property ID: 0x65E9
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.4
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_STATE, ptagRuleMsgState
    case tagRuleMessageState = 0x65E9

    /// [MS-OXPROPS] 2.958 PidTagRuleMessageUserFlags
    /// Canonical name: PidTagRuleMessageUserFlags
    /// Description: Contains an opaque property that the client sets for the exclusive use of the client. Set
    /// on the FAI message.
    /// Property ID: 0x65EA
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.5
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_USER_FLAGS, ptagRuleMsgUserFlags
    case tagRuleMessageUserFlags = 0x65EA

    /// [MS-OXPROPS] 2.954 PidTagRuleMessageProvider
    /// Canonical name: PidTagRuleMessageProvider
    /// Description: Identifies the client application that owns the rule. Set on the FAI message.
    /// Property ID: 0x65EB
    /// Data type: PtypString, 0x001F
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.7
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: ptagRuleMsgProvider
    case tagRuleMessageProvider = 0x65EB

    /// [MS-OXPROPS] 2.953 PidTagRuleMessageName
    /// Canonical name: PidTagRuleMessageName
    /// Description: Specifies the name of the rule. Set on the FAI message.
    /// Property ID: 0x65EC
    /// Data type: PtypString, 0x001F
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.1
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: ptagRuleMsgName
    case tagRuleMessageName = 0x65EC

    /// [MS-OXPROPS] 2.952 PidTagRuleMessageLevel
    /// Canonical name: PidTagRuleMessageLevel
    /// Description: Contains 0x00000000. Set on the FAI message.
    /// Property ID: 0x65ED
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.6
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_LEVEL, ptagRuleMsgLevel
    case tagRuleMessageLevel = 0x65ED

    /// [MS-OXPROPS] 2.955 PidTagRuleMessageProviderData
    /// Canonical name: PidTagRuleMessageProviderData
    /// Description: Contains opaque data set by the client for the exclusive use of the client. Set on the FAI
    /// message.
    /// Property ID: 0x65EE
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.8
    /// Alternate names: PR_RULE_MSG_PROVIDER_DATA, ptagRuleMsgProviderData
    case tagRuleMessageProviderData = 0x65EE

    /// [MS-OXPROPS] 2.824 PidTagRuleMsgActions
    /// Canonical name: PidTagRuleMsgActions
    /// Property ID: 0x65EF
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeNonTransmittableReserved
    /// References: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_ACTIONS, ptagRuleMsgActions
    case tagRuleMsgActions = 0x65EF

    /// [MS-OXPROPS] 2.825 PidTagRuleMsgCondition
    /// Canonical name: PidTagRuleMsgCondition
    /// Property ID: 0x65F0
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeNonTransmittableReserved
    /// References: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_CONDITION, ptagRuleMsgCondition
    case tagRuleMsgCondition = 0x65F0

    // case unknown0x65F1 = 0x65F1

    // case unknown0x65F2 = 0x65F2

    /// [MS-OXPROPS] 2.956 PidTagRuleMessageSequence
    /// Canonical name: PidTagRuleMessageSequence
    /// Description: Contains a value used to determine the order in which rules are evaluated and
    /// executed. Set on the FAI message.
    /// Property ID: 0x65F3
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeNonTransmittableReserved
    /// Defining reference: [MS-OXORULE] section 2.2.4.1.3
    /// Consuming reference: [MS-OXCSPAM]
    /// Alternate names: PR_RULE_MSG_SEQUENCE, ptagRuleMsgSequence
    case tagRuleMessageSequence = 0x65F3

    // case unknown0x65F4 = 0x65F4

    // case unknown0x65F5 = 0x65F5

    // case unknown0x65F6 = 0x65F6

    // case unknown0x65F7 = 0x65F7

    // case unknown0x65F8 = 0x65F8

    // case unknown0x65F9 = 0x65F9

    // case unknown0x65FA = 0x65FA

    // case unknown0x65FB = 0x65FB

    // case unknown0x65FC = 0x65FC

    // case unknown0x65FD = 0x65FD

    // case unknown0x65FE = 0x65FE

    // case unknown0x65FF = 0x65FF

    // case unknown0x6618 = 0x6618

    /// [MS-OXPROPS] 2.1053 PidTagUserEntryId
    /// Canonical name: PidTagUserEntryId
    /// Description: Address book EntryID of the user logged on to the public folders.
    /// Property ID: 0x6619
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeMessageStore
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1
    /// Alternate names: PR_USER_ENTRYID, ptagUserEntryId
    case tagUserEntryId = 0x6619

    // case unknown0x661A = 0x661A

    /// [MS-OXPROPS] 2.777 PidTagMailboxOwnerEntryId
    /// Canonical name: PidTagMailboxOwnerEntryId
    /// Description: Contains the EntryID in the Global Address List (GAL) of the owner of the mailbox.
    /// Property ID: 0x661B
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Store Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.7
    /// Consuming references: [MS-OXOCAL], [MS-OXOPFFB]
    /// Alternate names: PR_MAILBOX_OWNER_ENTRYID, ptagMailboxOwnerEntryId
    case tagMailboxOwnerEntryId = 0x661B

    /// [MS-OXPROPS] 2.778 PidTagMailboxOwnerName
    /// Canonical name: PidTagMailboxOwnerName
    /// Description: Contains the display name of the owner of the mailbox.
    /// Property ID: 0x661C
    /// Data type: PtypString, 0x001F
    /// Area: Message Store Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.8
    /// Consuming reference: [MS-OXOCAL]
    /// Alternate names: PR_MAILBOX_OWNER_NAME, PR_MAILBOX_OWNER_NAME_A,
    /// ptagMailboxOwnerName, PR_MAILBOX_OWNER_NAME_W
    case tagMailboxOwnerName = 0x661C

    /// [MS-OXPROPS] 2.855 PidTagOutOfOfficeState
    /// Canonical name: PidTagOutOfOfficeState
    /// Description: Indicates whether the user is OOF.
    /// Property ID: 0x661D
    /// Data type: PtypBoolean, 0x000B
    /// Area: Message Store Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.2.4
    /// Alternate names: PR_OOF_STATE, ptagOOFState
    case tagOutOfOfficeState = 0x661D

    // case unknown0x661E = 0x661E
    
    /// Not documented in specification - PR_IPM_DAF_ENTRYID
    case PR_IPM_DAF_ENTRYID = 0x661F
    
    /// PidTagNonIpmSubtreeEntryId
    /// Not documented in specification but known on internet
    /// Shows the entry ID of the NON_IPM_SUBTREE folder in an Exchange Public Folder store.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagnonipmsubtreeentryid-canonical-property
    case tagNonIpmSubtreeEntryId = 0x6620
    
    /// PidTagContactAddressBookStoreSupportMasks
    /// Not documented in specification but known on internet
    /// Contains flags indicating the store's supported features.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactaddressbookstoresupportmasks-canonical-property
    case tagContactAddressBookStoreSupportMasks = 0x6621
    // case PR_EFORMS_REGISTRY_ENTRYID = 0x6621
    
    /// PidTagRpcOverHttpProxyServer
    /// Not documented in specification but known on internet
    /// Contains the URL of the proxy server that is used to connect Microsoft Outlook to Microsoft Exchange
    /// Server without the HTTP protocol or the Hypertext Transfer Protocol Secure (HTTPS) protocol that
    /// comes before the URL.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpproxyserver-canonical-property
    case tagRpcOverHttpProxyServer = 0x6622
    
    /// PidTagRpcOverHttpFlags
    /// Not documented in specification but known on internet
    /// Contains the settings in a profile used by Microsoft Office Outlook to connect to Microsoft Exchange Server by using
    /// a remote procedure call (RPC) over Hypertext Transfer Protocol (HTTP).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpflags-canonical-property
    case tagRpcOverHttpFlags = 0x6623
    
    /// PidTagContactAddressBookDisplayNames
    /// Not documented in specification but known on internet
    /// Contains a list of display names for messaging users in the contact address book.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactaddressbookdisplaynames-canonical-property
    case tagContactAddressBookDisplayNames = 0x6624
    
    /// PidTagRpcOverHttpProxyPrincipalName
    /// Not documented in specification but known on internet
    /// Contains the principal name of the proxy server that is used by Microsoft Outlook to connect to
    /// Microsoft Exchange Server by using a remote procedure call (RPC) over Hypertext Transfer Protocol (HTTP).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpproxyprincipalname-canonical-property
    case tagRpcOverHttpProxyPrincipalName = 0x6625
    
    /// PidTagContactAddressBookStoreEntryIds
    /// Not documented in specification but known on internet
    /// Contains the Entry IDs of the stores in which folders that act as contact address book entries are found.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagcontactaddressbookstoreentryids-canonical-property
    case tagContactAddressBookStoreEntryIds = 0x6626
    
    /// PidTagRpcOverHttpProxyAuthScheme
    /// Not documented in specification but known on internet
    /// Represents the authentication protocol to be used for this profile.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagrpcoverhttpproxyauthscheme-canonical-property
    case tagRpcOverHttpProxyAuthScheme = 0x6627
    
    /// Not documented in specification - PR_GW_MTSIN_ENTRYID
    case PR_GW_MTSIN_ENTRYID = 0x6628
    
    /// Not documented in specification - PR_GW_MTSOUT_ENTRYID
    case PR_GW_MTSOUT_ENTRYID = 0x6629
    
    /// Not documented in specification - PR_INTERNET_CONTENT_ID
    case PR_INTERNET_CONTENT_ID = 0x662A
    
    /// Not documented in specification - PR_TEST_LINE_SPEED
    case PR_TEST_LINE_SPEED = 0x662B
    
    /// Not documented in specification - PR_HIERARCHY_SYNCHRONIZER
    case PR_HIERARCHY_SYNCHRONIZER = 0x662C
    
    /// Not documented in specification - PR_CONTENTS_SYNCHRONIZER
    case PR_CONTENTS_SYNCHRONIZER = 0x662D
    
    /// Not documented in specification - PR_COLLECTOR
    case PR_COLLECTOR = 0x662E
    
    /// Not documented in specification - PR_FAST_TRANSFER
    case PR_FAST_TRANSFER = 0x662F
    
    /// Not documented in specification - PR_IPM_FAVORITES_ENTRYID
    case PR_IPM_FAVORITES_ENTRYID = 0x6630
    
    /// Not documented in specification - PR_IPM_PUBLIC_FOLDERS_ENTRYID
    case PR_IPM_PUBLIC_FOLDERS_ENTRYID = 0x6631
    
    /// Not documented in specification - PR_STORE_OFFLINE
    case PR_STORE_OFFLINE = 0x6632
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    case tagPstLrNoRestrictions = 0x6633
    
    /// Not documented in specification - PR_CHANGE_ADVISOR
    case PR_CHANGE_ADVISOR = 0x6634
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstHiddenCount 0x6635 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// 0x6635 PtypInteger32 PidTagPstHiddenCount Total number of hidden Items in sub-Folder object. Y
    case tagPstHiddenCount = 0x6635
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstHiddenUnread 0x6636 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// 0x6636 PtypInteger32 PidTagPstHiddenUnread Unread hidden items in sub-Folder object. Y
    case tagPstHiddenUnread = 0x6636

    // case unknown0x6637 = 0x6637

    /// [MS-OXPROPS] 2.1019 PidTagSerializedReplidGuidMap
    /// Canonical name: PidTagSerializedReplidGuidMap
    /// Description: Contains a serialized list of REPLID and REPLGUID pairs which represent all or part of
    /// the REPLID / REPLGUID mapping of the associated Logon object.
    /// Property ID: 0x6638
    /// Data type: PtypBinary, 0x0102
    /// Area: Logon Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.13
    /// Alternate names: ptagSerializedReplidGuidMap
    case tagSerializedReplidGuidMap = 0x6638

    /// [MS-OXPROPS] 2.935 PidTagRights
    /// Canonical name: PidTagRights
    /// Description: Specifies a user's folder permissions.
    /// Property ID: 0x6639
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeFolder
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.2.8
    /// Consuming reference: [MS-OXCPERM]
    /// Alternate names: PR_RIGHTS, ptagRights
    case tagRights = 0x6639

    // case unknown0x6639 = 0x6639

    /// 2.719 PidTagHasRules
    /// Canonical name: PidTagHasRules
    /// Description: Indicates whether a Folder object has rules.
    /// Property ID: 0x663A
    /// Data type: PtypBoolean, 0x000B
    /// Area: ExchangeFolder
    /// Defining reference: [MS-OXORULE] section 2.2.8.1
    /// Alternate names: PR_HAS_RULES, ptagHasRules
    case tagHasRules = 0x663A

    /// [MS-OXPROPS] 2.521 PidTagAddressBookEntryId
    /// Canonical name: PidTagAddressBookEntryId
    /// Description: Contains the name-service EntryID of a directory object that refers to a public folder.
    /// Property ID: 0x663B
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.4
    /// Alternate names: PR_ADDRESS_BOOK_ENTRYID, ptagAddressBookEntryId
    case tagAddressBookEntryId = 0x663B

    // case unknown0x663C = 0x663C

    // case unknown0x663D = 0x663D

    /// [MS-OXPROPS] 2.720 PidTagHierarchyChangeNumber
    /// Canonical name: PidTagHierarchyChangeNumber
    /// Description: Contains a number that monotonically increases every time a subfolder is added to, or
    /// deleted from, this folder.
    /// Property ID: 0x663E
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeFolder
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.8
    /// Alternate names: PR_HIERARCHY_CHANGE_NUM
    case tagHierarchyChangeNumber = 0x663E

    // case unknown0x663F = 0x663F

    // case unknown0x6640 = 0x6640

    // case unknown0x6641 = 0x6641

    // case unknown0x6642 = 0x6642

    // case unknown0x6643 = 0x6643

    // case unknown0x6644 = 0x6644

    /// [MS-OXPROPS] 2.634 PidTagClientActions
    /// Canonical name: PidTagClientActions
    /// Description: Specifies the actions the client is required to take on the message.
    /// Property ID: 0x6645
    /// Data type: PtypBinary, 0x0102
    /// Area: Server-side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.6.6
    /// Alternate names: PR_CLIENT_ACTIONS, ptagClientActions
    case tagClientActions = 0x6645

    /// [MS-OXPROPS] 2.659 PidTagDamOriginalEntryId
    /// Canonical name: PidTagDamOriginalEntryId
    /// Description: Contains the EntryID of the delivered message that the client has to process.
    /// Property ID: 0x6646
    /// Data type: PtypBinary, 0x0102
    /// Area: Server-side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.6.3
    /// Alternate names: PR_DAM_ORIGINAL_ENTRYID
    case tagDamOriginalEntryId = 0x6646

    /// [MS-OXPROPS] 2.658 PidTagDamBackPatched
    /// Canonical name: PidTagDamBackPatched
    /// Description: Indicates whether the Deferred Action Message (DAM) was updated by the server.
    /// Property ID: 0x6647
    /// Data type: PtypBoolean, 0x000B
    /// Area: Server-side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.6.2
    /// Alternate names: PR_DAM_BACK_PATCHED, ptagDamBackPatched
    case tagDamBackPatched = 0x6647

    /// [MS-OXPROPS] 2.947 PidTagRuleError
    /// Canonical name: PidTagRuleError
    /// Description: Contains the error code that indicates the cause of an error encountered during the
    /// execution of the rule.
    /// Property ID: 0x6648
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeMessageReadOnly
    /// Defining reference: [MS-OXORULE] section 2.2.7.2
    /// Alternate names: PR_RULE_ERROR, ptagRuleError
    case tagRuleError = 0x6648

    /// [MS-OXPROPS] 2.945 PidTagRuleActionType
    /// Canonical name: PidTagRuleActionType
    /// Description: Contains the ActionType field ([MS-OXORULE] section 2.2.5.1) of a rule that failed.
    /// Property ID: 0x6649
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeMessageReadOnly
    /// Defining reference: [MS-OXORULE] section 2.2.7.3
    /// Alternate names: PR_RULE_ACTION_TYPE, ptagRuleActionType
    case tagRuleActionType = 0x6649

    /// 2.718 PidTagHasNamedProperties
    /// Canonical name: PidTagHasNamedProperties
    /// Description: Indicates whether the Message object has a named property.
    /// Property ID: 0x664A
    /// Data type: PtypBoolean, 0x000B
    /// Area: ExchangeMessageReadOnly
    /// Defining reference: [MS-OXCMSG] section 2.2.1.39
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: PR_HAS_NAMED_PROPERTIES, ptagHasNamedProperties
    case tagHasNamedProperties = 0x664A

    /// case unknown0x664B = 0x664B

    /// case unknown0x664C = 0x664C

    /// case unknown0x664D = 0x664D

    /// case unknown0x664E = 0x664E

    /// case unknown0x664F = 0x664F

    /// [MS-OXPROPS] 2.943 PidTagRuleActionNumber
    /// Canonical name: PidTagRuleActionNumber
    /// Description: Contains the index of a rule action that failed.
    /// Property ID: 0x6650
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeMessageReadOnly
    /// Defining reference: [MS-OXORULE] section 2.2.7.4
    /// Alternate names: PR_RULE_ACTION_NUMBER, ptagRuleActionNumber
    case tagRuleActionNumber = 0x6650

    /// 2.948 PidTagRuleFolderEntryId
    /// Canonical name: PidTagRuleFolderEntryId
    /// Description: Contains the EntryID of the folder where the rule that triggered the generation of a
    /// DAM is stored.
    /// Property ID: 0x6651
    /// Data type: PtypBinary, 0x0102
    /// Area: ExchangeMessageReadOnly
    /// Defining reference: [MS-OXORULE] section 2.2.6.5
    /// Alternate names: PR_RULE_FOLDER_ENTRYID, ptagRuleFolderEntryId
    case tagRuleFolderEntryId = 0x6651

    // case unknown0x6652 = 0x6652

    // case unknown0x6669 = 0x6669

    /// [MS-OXPROPS] 2.874 PidTagProhibitReceiveQuota
    /// Canonical name: PidTagProhibitReceiveQuota
    /// Description: Maximum size, in kilobytes, that a user is allowed to accumulate in their mailbox
    /// before no further email will be delivered to their mailbox.
    /// Property ID: 0x666A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Exchange Administrative
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.3
    /// Alternate names: PR_PROHIBIT_RECEIVE_QUOTA, ptagProhibitReceiveQuota
    case tagProhibitReceiveQuota = 0x666A

    // case unknown0x666B = 0x666B

    /// [MS-OXPROPS] 2.739 PidTagInConflict
    /// Canonical name: PidTagInConflict
    /// Description: Specifies whether the attachment represents an alternate replica.
    /// Property ID: 0x666C
    /// Data type: PtypBoolean, 0x000B
    /// Area: Conflict Note
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.4.3
    /// Alternate names: PR_IN_CONFLICT, ptagInConflict
    case tagInConflict = 0x666C

    /// [MS-OXPROPS] 2.781 PidTagMaximumSubmitMessageSize
    /// Canonical name: PidTagMaximumSubmitMessageSize
    /// Description: Maximum size, in kilobytes, of a message that a user is allowed to submit for
    /// transmission to another user.
    /// Property ID: 0x666D
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Store Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.2
    /// Alternate names: PR_MAX_SUBMIT_MESSAGE_SIZE
    case tagMaximumSubmitMessageSize = 0x666D

    /// [MS-OXPROPS] 2.875 PidTagProhibitSendQuota
    /// Canonical name: PidTagProhibitSendQuota
    /// Description: Maximum size, in kilobytes, that a user is allowed to accumulate in their mailbox
    /// before the user can no longer send any more email.
    /// Property ID: 0x666E
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeAdministrative
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.4
    /// Alternate names: PR_PROHIBIT_SEND_QUOTA, ptagProhibitSendQuota
    case tagProhibitSendQuota = 0x666E

    // case unknown0x666F = 0x666F

    /// PidTagLongTermEntryIdFromTable
    /// Not documented in specification but known on internet
    /// Obtains the long- term entry identifier of an item.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtaglongtermentryidfromtable-canonical-property
    case tagLongTermEntryIdFromTable = 06670

    /// [MS-OXPROPS] 2.782 PidTagMemberId
    /// Canonical name: PidTagMemberId
    /// Description: Contains a unique identifier that the messaging server generates for each user.
    /// Property ID: 0x6671
    /// Data type: PtypInteger64, 0x0014
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCPERM] section 2.2.5
    /// Alternate names: PR_MEMBER_ID, ptagMemberId
    case tagMemberId = 0x6671

    /// [MS-OXPROPS] 2.783 PidTagMemberName
    /// Canonical name: PidTagMemberName
    /// Description: Contains the user-readable name of the user.
    /// Property ID: 0x6672
    /// Data type: PtypString, 0x001F
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCPERM] section 2.2.6
    /// Alternate names: PR_MEMBER_NAME, PR_MEMBER_NAME_A, ptagMemberName,
    /// PR_MEMBER_NAME_W
    case tagMemberName = 0x6672

    /// [MS-OXPROPS] 2.784 PidTagMemberRights
    /// Canonical name: PidTagMemberRights
    /// Description: Contains the permissions for the specified user.
    /// Property ID: 0x6673
    /// Data type: PtypInteger32, 0x0003
    /// Area: Access Control Properties
    /// Defining reference: [MS-OXCPERM] section 2.2.7
    /// Consuming references: [MS-OXCFOLD], [MS-OXODLGT]
    /// Alternate names: PR_MEMBER_RIGHTS, ptagMemberRights
    case tagMemberRights = 0x6673

    /// [MS-OXPROPS] 2.949 PidTagRuleId
    /// Canonical name: PidTagRuleId
    /// Description: Specifies a unique identifier that is generated by the messaging server for each rule
    /// when the rule is first created.
    /// Property ID: 0x6674
    /// Data type: PtypInteger64, 0x0014
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.1
    /// Alternate names: PR_RULE_ID, ptagRuleId
    case tagRuleId = 0x6674

    /// [MS-OXPROPS] 2.950 PidTagRuleIds
    /// Canonical name: PidTagRuleIds
    /// Description: Contains a buffer that is obtained by concatenating the PidTagRuleId property (section
    /// 2.949) values from all of the rules contributing actions that are contained in the
    /// PidTagClientActions property (section 2.634).
    /// Property ID: 0x6675
    /// Data type: PtypBinary, 0x0102
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.6.7
    /// Alternate names: PR_RULE_IDS, ptagRuleIds
    case tagRuleIds = 0x6675

    /// [MS-OXPROPS] 2.962 PidTagRuleSequence
    /// Canonical name: PidTagRuleSequence
    /// Description: Contains a value used to determine the order in which rules are evaluated and
    /// executed.
    /// Property ID: 0x6676
    /// Data type: PtypInteger32, 0x0003
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.2
    /// Consuming references: [MS-OXCPRPT], [MS-OXCSTOR], [MS-OXCTABL], [MS-OXODLGT]
    /// Alternate names: PR_RULE_SEQUENCE, ptagRuleSequence
    case tagRuleSequence = 0x6676

    /// [MS-OXPROPS] 2.963 PidTagRuleState
    /// Canonical name: PidTagRuleState
    /// Description: Contains flags that specify the state of the rule.
    /// Property ID: 0x6677
    /// Data type: PtypInteger32, 0x0003
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.3
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_STATE, ptagRuleState
    case tagRuleState = 0x6677

    /// [MS-OXPROPS] 2.964 PidTagRuleUserFlags
    /// Canonical name: PidTagRuleUserFlags
    /// Description: Contains an opaque property that the client sets for the exclusive use of the client.
    /// Property ID: 0x6678
    /// Data type: PtypInteger32, 0x0003
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.7
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_USER_FLAGS, ptagRuleUserFlags
    case tagRuleUserFlags = 0x6678

    /// [MS-OXPROPS] 2.946 PidTagRuleCondition
    /// Canonical name: PidTagRuleCondition
    /// Description: Defines the conditions under which a rule action is to be executed.
    /// Property ID: 0x6679
    /// Data type: PtypRestriction, 0x00FD
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.9
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_CONDITION, ptagRuleCondition
    case tagRuleCondition = 0x6679

    // case unknown0x667A = 0x667A

    // case unknown0x667B = 0x667B

    // case unknown0x667C = 0x667C

    // case unknown0x667D = 0x667D

    // case unknown0x667A = 0x667E

    // case unknown0x667F = 0x667F

    /// [MS-OXPROPS] 2.944 PidTagRuleActions
    /// Canonical name: PidTagRuleActions
    /// Description: Contains the set of actions associated with the rule.
    /// Property ID: 0x6680
    /// Data type: PtypRuleAction, 0x00FE
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.10
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_ACTIONS, ptagRuleActions
    case tagRuleActions = 0x6680

    /// [MS-OXPROPS] 2.960 PidTagRuleProvider
    /// Canonical name: PidTagRuleProvider
    /// Description: A string identifying the client application that owns a rule.
    /// Property ID: 0x6681
    /// Data type: PtypString, 0x001F
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.5
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_PROVIDER, ptagRuleProvider, PR_RULE_PROVIDER_W
    case tagRuleProvider = 0x6681

    /// [MS-OXPROPS] 2.959 PidTagRuleName
    /// Canonical name: PidTagRuleName
    /// Description: Specifies the name of the rule.
    /// Property ID: 0x6682
    /// Data type: PtypString, 0x001F
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.4
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_NAME, PR_RULE_NAME_A, ptagRuleName, PR_RULE_NAME_W
    case tagRuleName = 0x6682

    /// [MS-OXPROPS] 2.951 PidTagRuleLevel
    /// Canonical name: PidTagRuleLevel
    /// Description: Contains 0x00000000. This property is not used.
    /// Property ID: 0x6683
    /// Data type: PtypInteger32, 0x0003
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.6
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_RULE_LEVEL, ptagRuleLevel
    case tagRuleLevel = 0x6683

    /// [MS-OXPROPS] 2.961 PidTagRuleProviderData
    /// Canonical name: PidTagRuleProviderData
    /// Description: Contains opaque data set by the client for the exclusive use of the client.
    /// Property ID: 0x6684
    /// Data type: PtypBinary, 0x0102
    /// Area: Server-Side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.1.3.1.8
    /// Alternate names: PR_RULE_PROVIDER_DATA, ptagRuleProviderData
    case tagRuleProviderData = 0x6684

    // case unknown0x6685 = 0x6685

    // case unknown0x668E = 0x668E

    /// [MS-OXPROPS] 2.670 PidTagDeletedOn
    /// Canonical name: PidTagDeletedOn
    /// Description: Specifies the time, in UTC, when the item or folder was soft deleted.
    /// Property ID: 0x668F
    /// Data type: PtypTime, 0x0040
    /// Area: ExchangeFolder
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.3
    /// Alternate names: PR_DELETED_ON, ptagDeletedOn, urn:schemas:httpmail:deletedon
    case tagDeletedOn = 0x668F

    // case unknown0x6690 = 0x6690

    // case unknown0x66A0 = 0x66A0

    /// [MS-OXPROPS] 2.774 PidTagLocaleId
    /// Canonical name: PidTagLocaleId
    /// Description: Contains the Logon object LocaleID.
    /// Property ID: 0x66A1
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.12
    /// Consuming references: [MS-OXCMSG]
    case tagLocaleId = 0x66A1

    // case unknown0x66A2 = 0x66A2

    // case unknown0x66A3 = 0x66A3

    // case unknown0x66A4 = 0x66A4

    // case unknown0x66A5 = 0x66A5

    // case unknown0x66A6 = 0x66A6

    // case unknown0x66A7 = 0x66A7

    /// [MS-OXPROPS] 2.701 PidTagFolderFlags
    /// Canonical name: PidTagFolderFlags
    /// Description: Contains a computed value to specify the type or state of a folder.
    /// Property ID: 0x66A8
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeAdministrative
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.5
    /// Alternate names: PR_FOLDER_FLAGS
    case tagFolderFlags = 0x66A8

    // case unknown0x66A9 = 0x66A9

    // case unknown0x66C2 = 0x66C2

    /// [MS-OXPROPS] 2.636 PidTagCodePageId
    /// Canonical name: PidTagCodePageId
    /// Description: Contains the identifier for the client code page used for Unicode to double-byte
    /// character set (DBCS) string conversion.
    /// Property ID: 0x66C3
    /// Data type: PtypInteger32, 0x0003
    /// Area: Exchange Profile Configuration
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.15
    /// Alternate names: PR_CODE_PAGE_ID, ptagCodePageId
    case tagCodePageId = 0x66C3

    // case unknown0x66C4 = 0x66C4
    
    /// Unknown - seen in PST files
    case unknown0x66FC = 0x66FC
    
    // case unknown0x66F9 = 0x66F9
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLatestPstEnsure 0x66FA PtypInteger32
    case tagLatestPstEnsure = 0x66FA
    
    // case unknown0x66FB = 0x66FB

    // case unknown0x6703 = 0x6703

    /// [MS-OXPROPS] 2.547 PidTagAddressBookManageDistributionList
    /// Canonical name: PidTagAddressBookManageDistributionList
    /// Description: Contains information for use in display templates for distribution lists.
    /// Property ID: 0x6704
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.10.2
    /// Consuming reference: [MS-OXOABKT]
    /// Alternate names: PR_EMS_AB_MANAGE_DL
    case tagAddressBookManageDistributionList = 0x6704

    /// [MS-OXPROPS] 2.1021 PidTagSortLocaleId
    /// Canonical name: PidTagSortLocaleId
    /// Description: Contains the locale identifier.
    /// Property ID: 0x6705
    /// Data type: PtypInteger32, 0x0003
    /// Area: ExchangeAdministrative
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.1.1.14
    /// Consuming reference: [MS-OXPFOAB]
    /// Alternate names: PR_SORT_LOCALE_ID, ptagSortLocaleId
    case tagSortLocaleId = 0x6705

    // case unknown0x6706 = 0x6706

    /// [MS-OXPROPS] 2.1185 PidTagUrlName
    /// Canonical name: PidTagUrlName
    /// Property ID: 0x6707
    /// Data type: PtypString, 0x001F
    /// Area: ExchangeAdministrative Property set
    /// References: [MS-XWDCAL], [MS-XWDDOC]
    /// Alternate names: PR_URL_NAME, PR_URL_NAME_A, PR_URL_NAME_W, ptagURLName, DAV:href
    case tagUrlName = 0x6707

    /// [MS-OXPROPS] 2.1159 PidTagSubfolder
    /// Canonical name: PidTagSubfolder
    /// Property ID: 0x6708
    /// Data type: PtypBoolean, 0x000B
    /// Area: ExchangeAdministrative Property set
    /// References: [MS-XWDMAIL], [MS-XWDCAL], [MS-XWDDOC]
    /// Alternate names: PR_SUBFOLDER, ptagSubfolder, DAV:isfolder
    case tagSubfolder = 0x6708

    /// [MS-OXPROPS] 2.772 PidTagLocalCommitTime
    /// Canonical name: PidTagLocalCommitTime
    /// Description: Specifies the time, in UTC, that a Message object or Folder object was last changed.
    /// Property ID: 0x6709
    /// Data type: PtypTime, 0x0040
    /// Area: Server
    /// Defining references: [MS-OXCMSG] section 2.2.1.49; [MS-OXCFOLD] section 2.2.2.2.1.13
    /// Alternate names: PR_LOCAL_COMMIT_TIME, ptagLocalCommitTime
    case tagLocalCommitTime = 0x6709

    /// [MS-OXPROPS] 2.773 PidTagLocalCommitTimeMax
    /// Canonical name: PidTagLocalCommitTimeMax
    /// Description: Contains the time of the most recent message change within the folder container,
    /// excluding messages changed within subfolders.
    /// Property ID: 0x670A
    /// Data type: PtypTime, 0x0040
    /// Area: Server
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.14
    /// Consuming Reference: [MS-OXCFXICS]
    /// Alternate names: PR_LOCAL_COMMIT_TIME_MAX, ptagLocalCommitTimeMax
    case tagLocalCommitTimeMax = 0x670A

    /// [MS-OXPROPS] 2.669 PidTagDeletedCountTotal
    /// Canonical name: PidTagDeletedCountTotal
    /// Description: Contains the total count of messages that have been deleted from a folder, excluding
    /// messages deleted within subfolders.
    /// Property ID: 0x670B
    /// Data type: PtypInteger32, 0x0003
    /// Area: Server
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.15
    /// Consuming reference: [MS-OXCFXICS]
    /// Alternate names: PR_DELETED_COUNT_TOTAL, ptagDeleteCountTotal
    case tagDeletedCountTotal = 0x670B

    // case unknown0x670C = 0x670C
    
    // case unknown0x670D = 0x670D
    
    /// [MS-OXPROPS] 2.698 PidTagFlatUrlName
    /// Canonical name: PidTagFlatUrlName
    /// Description: Contains a unique identifier for an item across the message store.
    /// Property ID: 0x670E
    /// Data type: PtypString, 0x001F
    /// Area: ExchangeAdministrative
    /// Defining reference: [MS-XWDCAL] section 2.2.8.9
    /// Alternate names: PR_FLAT_URL_NAME, PR_FLAT_URL_NAME_A, PR_FLAT_URL_NAME_W,
    /// ptagFlatURLName, http://schemas.microsoft.com/exchange/permanenturl
    case tagFlatUrlName = 0x670E
    
    // case unknown0x670F = 0x670F

    // case unknown0x673F = 0x673F

    /// [MS-OXPROPS] 2.1011 PidTagSentMailSvrEID
    /// Canonical name: PidTagSentMailSvrEID
    /// Description: Contains an EntryID that represents the Sent Items folder for the message.
    /// Property ID: 0x6740
    /// Data type: PtypServerId, 0x00FB
    /// Area: ProviderDefinedNonTransmittable
    /// Defining reference: [MS-OXOMSG] section 2.2.3.10
    /// Consuming reference: [MS-OXCSTOR]
    /// Alternate names: ptagSentMailSvrEID
    case tagSentMailSvrEID = 0x6740

    /// [MS-OXPROPS] 2.661 PidTagDeferredActionMessageOriginalEntryId
    /// Canonical name: PidTagDeferredActionMessageOriginalEntryId
    /// Description: Contains the server EntryID for the DAM.
    /// Property ID: 0x6741
    /// Data type: PtypServerId, 0x00FB
    /// Area: Server-side Rules Properties
    /// Defining reference: [MS-OXORULE] section 2.2.6.8
    /// Alternate names: PR_DAM_ORIG_MSG_SVREID, ptagDamOrgMsgSvrEID
    case tagDeferredActionMessageOriginalEntryId = 0x6741

    // case unknown0x6742 = 0x6742

    // case unknown0x6743 = 0x6743

    // case unknown0x6744 = 0x6744

    // case unknown0x6745 = 0x6745

    // case unknown0x6746 = 0x6746

    // case unknown0x6747 = 0x6747

    /// [MS-OXPROPS] 2.700 PidTagFolderId
    /// Canonical name: PidTagFolderId
    /// Description: Contains the Folder ID (FID) ([MS-OXCDATA] section 2.2.1.1) of the folder.
    /// Property ID: 0x6748
    /// Data type: PtypInteger64, 0x0014
    /// Area: ID Properties
    /// Defining reference: [MS-OXCFOLD] section 2.2.2.2.1.6
    /// Consuming references: [MS-OXCFXICS], [MS-OXOCFG], [MS-OXCROPS], [MS-OXCTABL], [MSOXOPFFB], [MS-OXOTASK], [MS-OXRTFEX]
    /// Alternate names: ptagFID
    case tagFolderId = 0x6748

    /// [MS-OXPROPS] 2.859 PidTagParentFolderId
    /// Canonical name: PidTagParentFolderId
    /// Description: Contains a value that contains the Folder ID (FID), as specified in [MS-OXCDATA]
    /// section 2.2.1.1, that identifies the parent folder of the messaging object being synchronized.
    /// Property ID: 0x6749
    /// Data type: PtypInteger64, 0x0014
    /// Area: ID Properties
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.4
    /// Alternate names: ptagParentFID
    case tagParentFolderId = 0x6749

    /// [MS-OXPROPS] 2.801 PidTagMid
    /// Canonical name: PidTagMid
    /// Description: Contains a value that contains the MID of the message currently being synchronized.
    /// Property ID: 0x674A
    /// Data type: PtypInteger64, 0x0014
    /// Area: ID Properties
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.1
    /// Consuming references: [MS-OXCMSG], [MS-OXOCFG], [MS-OXCTABL], [MS-OXOCAL], [MSOXOCNTC], [MS-OXOPFFB], [MS-OXOTASK], [MS-OXPROTO], [MS-OXRTFEX], [MS-OXVCARD], [MSXWDCAL]
    /// Alternate names: ptagMID, http://schemas.microsoft.com/exchange/mid
    case tagMid = 0x674A

    // case unknown0x674B = 0x674B

    // case unknown0x674C = 0x674C

    /// [MS-OXPROPS] 2.745 PidTagInstID
    /// Canonical name: PidTagInstID
    /// Description: Contains an identifier for all instances of a row in the table.
    /// Property ID: 0x674D
    /// Data type: PtypInteger64, 0x0014
    /// Area: ProviderDefinedNonTransmittable
    /// Defining reference: [MS-OXCTABL] section 2.2.1.1
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: ptagInstID
    case tagInstID = 0x674D

    /// [MS-OXPROPS] 2.744 PidTagInstanceNum
    /// Canonical name: PidTagInstanceNum
    /// Description: Contains an identifier for a single instance of a row in the table.
    /// Property ID: 0x674E
    /// Data type: PtypInteger32, 0x0003
    /// Area: ProviderDefinedNonTransmittable
    /// Defining reference: [MS-OXCTABL] section 2.2.1.2
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: ptagInstanceNum
    case tagInstanceNum = 0x674E

    /// [MS-OXPROPS] 2.551 PidTagAddressBookMessageId
    /// Canonical name: PidTagAddressBookMessageId
    /// Description: Contains the Short-term Message ID (MID) ([MS-OXCDATA] section 2.2.1.2) of the first
    /// message in the local site's offline address book public folder.
    /// Property ID: 0x674F
    /// Data type: PtypInteger64, 0x0014
    /// Area: ProviderDefinedNonTransmittable
    /// Defining reference: [MS-OXCSTOR] section 2.2.2.2.2
    /// Alternate names: ptagAddrbookMID
    case tagAddressBookMessageId = 0x674F

    // case unknown0x6750 = 0x6750
    
    // case unknown0x676F = 0x676F
    
    /// PidTagPstConfigurationFlags
    /// Not documented in specification but known on internet
    /// Specfies configuration flags for a personal storage table (.pst file).
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagpstconfigurationflags-canonical-property
    case tagPstConfigurationFlags = 0x6770
    
    /// PidTagPstPathHint
    /// Not documented in specification but known on internet
    /// Provides the personal storage table (.pst file) name, which the user can edit, for the configuration dialog box.
    /// https://docs.microsoft.com/en-us/office/client-developer/outlook/mapi/pidtagpstpathhint-canonical-property
    case tagPstPathHint = 0x6771
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstSubTreeContainer 0x6772 PtypInteger32
    case tagPstSubTreeContainer = 0x6772
    
    // case unknown0x6773 = 0x6773

    // case unknown0x6792 = 0x6792

    /// [MS-OXPROPS] 2.604 PidTagIdsetExpired
    /// Canonical name: PidTagIdsetExpired
    /// Property ID: 0x6793
    /// Data type: PtypBinary, 0x0102
    /// Area: Sync
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagMidsetExpired
    case tagIdsetExpired = 0x6793

    // case unknown0x6794 = 0x6794

    // case unknown0x6795 = 0x6795

    /// [MS-OXPROPS] 2.499 PidTagCnsetSeen
    /// Canonical name: PidTagCnsetSeen
    /// Property ID: 0x6796
    /// Data type: PtypBinary, 0x0102
    /// Area: ProviderDefinedNonTransmittable
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagCnsetSeen
    case tagCnsetSeen = 0x6796

    // case unknown0x6797 = 0x6797

    // case unknown0x67A3 = 0x67A3

    /// [MS-OXPROPS] 2.632 PidTagChangeNumber
    /// Canonical name: PidTagChangeNumber
    /// Description: Contains a structure that identifies the last change to the message or folder that is
    /// currently being synchronized.
    /// Property ID: 0x67A4
    /// Data type: PtypInteger64, 0x0014
    /// Area: Sync
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.2.3
    /// Consuming reference: [MS-OXCSTOR]
    /// Alternate names: ptagCn
    case tagChangeNumber = 0x67A4

    // case unknown0x67A5 = 0x67A5

    // case unknown0x67A6 = 0x67A6

    // case unknown0x67A7 = 0x67A7

    // case unknown0x67A8 = 0x67A8

    // case unknown0x67A9 = 0x67A9

    /// [MS-OXPROPS] 2.584 PidTagAssociated
    /// Canonical name: PidTagAssociated
    /// Description: Specifies whether the message being synchronized is an FAI message.
    /// Property ID: 0x67AA
    /// Data type: PtypBoolean, 0x000B
    /// Area: Sync
    /// Defining reference: [MS-OXCFXICS] section 2.2.1.5
    /// Alternate names: ptagAssociated
    case tagAssociated = 0x67AA

    // case unknown0x67AB = 0x67AB

    /// [MS-OXPROPS] 2.498 PidTagCnsetRead
    /// Canonical name: PidTagCnsetRead
    /// Property ID: 0x67D2
    /// Data type: PtypBinary, 0x0102
    /// Area: ProviderDefinedNonTransmittable
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagCnsetRead
    case tagCnsetRead = 0x67D2

    // case unknown0x67D3 = 0x67D3

    // case unknown0x67D9 = 0x67D9

    /// [MS-OXPROPS] 2.500 PidTagCnsetSeenFAI
    /// Canonical name: PidTagCnsetSeenFAI
    /// Property ID: 0x67DA
    /// Data type: PtypBinary, 0x0102
    /// Area: ProviderDefinedNonTransmittable
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagCnsetSeenFAI
    case tagCnsetSeenFAI = 0x67DA

    // case unknown0x67DB = 0x67DB

    // case unknown0x67E4 = 0x67E4

    /// [MS-OXPROPS] 2.603 PidTagIdsetDeleted
    /// Canonical name: PidTagIdsetDeleted
    /// Property ID: 0x67E5
    /// Data type: PtypBinary, 0x0102
    /// Area: ProviderDefinedNonTransmittable
    /// References: [MS-OXCFXICS]
    /// Alternate names: ptagIdsetDeleted
    case tagIdsetDeleted = 0x67E5

    // case unknown0x67E6 = 0x67E6
    
    // case unknown0x67EF = 0x67EF
    
    /// Not documented in specification - PR_PROFILE_SECURE_MAILBOX
    case PR_PROFILE_SECURE_MAILBOX = 0x67F0
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpParentNid 0x67F1 PtypInteger32
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F1 PtypInteger32 PidTagLtpParentNid LTP Parent NID
    case tagLtpParentNid = 0x67F1
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpRowId 0x67F2 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID. Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP row ID Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP row ID. Y
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID.
    /// [MS-PST] 2.4.6.1 Attachment Table
    /// The Attachment Table is a standard TC structure where each of its rows maps to an Attachment
    /// object. Each row contains sufficient metadata to identify or display a representation of the
    /// Attachment object, but the full Attachment object data is stored in a separate subnode. The
    /// Attachment table is optional, and can be absent from Message objects that do not contain any
    /// Attachment objects.
    /// [MS-PST] 2.4.6.1.1 Attachment Table Template
    /// Each PST MUST have one attachment table template, which is identified with an NID value of
    /// NID_ATTACHMENT_TABLE (0x671). The attachment table template defines the set of columns for
    /// every new Attachment Table that is created. The attachment table template MUST have no data rows,
    /// and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F2 PtypInteger32 PidTagLtpRowId LTP Row ID
    case tagLtpRowId = 0x67F2
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagLtpRowVer 0x67F3 PtypInteger32
    /// [MS-PST] 2.4.4.4 Hierarchy Table
    /// The hierarchy table is implemented as a TC. The NID of a hierarchy table MUST have an NID_TYPE of
    /// NID_TYPE_HIERARCHY_TABLE. Its function is to list the immediate sub-Folder objects of the Folder
    /// object. Note that the hierarchy table only contains sub-Folder object information. Information about
    /// Message objects stored in the Folder object is stored in the Contents Table (section 2.4.4.5) instead.
    /// [MS-PST] 2.4.4.4.1 Hierarchy Table Template
    /// Each PST MUST have one hierarchy table template, which is identified with an NID value of
    /// NID_HIERARCHY_TABLE_TEMPLATE (0x60D). The hierarchy table template defines the set of columns
    /// for every new hierarchy table that is created. The hierarchy table template MUST have no data rows,
    /// and MUST contain the following property columns. The list of columns below represent the required
    /// properties, and different versions of Outlook can add additional properties to the template.
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version. Y
    /// [MS-PST] 2.4.4.5 Contents Table
    /// The contents table is a TC node that is identified with an NID_TYPE of NID_TYPE_CONTENTS_TABLE.
    /// Its function is to list the Message objects in the Folder object.
    /// [MS-PST] 2.4.4.5.1 Contents Table Template
    /// Each PST MUST have one contents table template, which is identified with an NID value of
    /// NID_CONTENTS_TABLE_TEMPLATE (0x60E). The contents table template MUST have no data rows,
    /// and MUST contain the property columns described in the following table. These properties represent
    /// ONLY the required properties; additional properties can be added by newer versions of Outlook.
    /// The right-most column indicates whether the property is copied from the Message object PC into the
    /// Contents TC row when a new Message object is created.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP row version Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP row version. Y
    /// [MS-PST] 2.4.5.3 Recipient Table
    /// The Recipient Table is a standard Table Context structure that is identified with an NID_TYPE of
    /// NID_TYPE_RECIPIENT_TABLE. With the exception of the recipient table template a Recipient Table
    /// resides in the subnode of a Message object node. It contains the list of Recipients of the Message
    /// object (one row per Recipient). A Recipient Table MUST exist for any Message object.
    /// [MS-PST] 2.4.5.3.1 Recipient Table Template
    /// Each PST MUST have one recipient table template, which is identified with an NID value of
    /// NID_RECIPIENT_TABLE (0x692). The recipient table template defines the set of columns for every
    /// new Recipient Table that is created. The recipient table template MUST have no data rows, and MUST
    /// contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version.
    /// [MS-PST] 2.4.6.1 Attachment Table
    /// The Attachment Table is a standard TC structure where each of its rows maps to an Attachment
    /// object. Each row contains sufficient metadata to identify or display a representation of the
    /// Attachment object, but the full Attachment object data is stored in a separate subnode. The
    /// Attachment table is optional, and can be absent from Message objects that do not contain any
    /// Attachment objects.
    /// [MS-PST] 2.4.6.1.1 Attachment Table Template
    /// Each PST MUST have one attachment table template, which is identified with an NID value of
    /// NID_ATTACHMENT_TABLE (0x671). The attachment table template defines the set of columns for
    /// every new Attachment Table that is created. The attachment table template MUST have no data rows,
    /// and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x67F3 PtypInteger32 PidTagLtpRowVer LTP Row Version
    case tagLtpRowVer = 0x67F3
    
    // case unknown0x67F4 = 0x67F4
    
    // case unknown0x67FE = 0x67FE

    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstPassword 0x67FF PtypInteger32
    case tagPstPassword = 0x67FF

    /// [MS-OXPROPS] 2.818 PidTagOfflineAddressBookName
    /// Canonical name: PidTagOfflineAddressBookName
    /// Description: Contains the display name of the address list.
    /// Property ID: 0x6800
    /// Data type: PtypString, 0x001F
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXOAB] section 2.12.3
    /// Alternate names: PR_OAB_NAME, PR_OAB_NAME_W
    case tagOfflineAddressBookName = 0x6800

    /// [MS-OXPROPS] 2.819 PidTagOfflineAddressBookSequence
    /// Canonical name: PidTagOfflineAddressBookSequence
    /// Description: Contains the sequence number of the OAB.
    /// Property ID: 0x6801
    /// Data type: PtypInteger32, 0x0003
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXOAB] section 2.12.4
    /// Alternate names: PR_OAB_SEQUENCE
    /// [MS-OXPROPS] 2.1060 PidTagVoiceMessageDuration
    /// Canonical name: PidTagVoiceMessageDuration
    /// Description: Specifies the length of the attached audio message, in seconds.
    /// Property ID: 0x6801
    /// Data type: PtypInteger32, 0x0003
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.3
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaVoiceMessageDuration
    case tagOfflineAddressBookSequenceOrTagVoiceMessageDuration = 0x6801

    /// [MS-OXPROPS] 2.815 PidTagOfflineAddressBookContainerGuid
    /// Canonical name: PidTagOfflineAddressBookContainerGuid
    /// Description: A string-formatted GUID that represents the address list container object.
    /// Property ID: 0x6802
    /// Data type: PtypString8, 0x001E
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXOAB] section 2.12.1
    /// Alternate names: PR_OAB_CONTAINER_GUID, PR_OAB_CONTAINER_GUID_W
    /// [MS-OXPROPS] 2.965 PidTagRwRulesStream
    /// Canonical name: PidTagRwRulesStream
    /// Description: Contains additional rule data about the Rule FAI message.
    /// Property ID: 0x6802
    /// Data type: PtypBinary, 0x0102
    /// Area: Message Class Defined Transmittable
    /// Defining reference: [MS-OXORULE] section 2.2.9.3
    /// Alternate names: PR_RW_RULES_STREAM
    /// [MS-OXPROPS] 2.1007 PidTagSenderTelephoneNumber
    /// Canonical name: PidTagSenderTelephoneNumber
    /// Description: Contains the telephone number of the caller associated with a voice mail message.
    /// Property ID: 0x6802
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.1
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaSenderTelephoneNumber
    case tagOfflineAddressBookContainerGuidOrTagRwRulesStreamOrTagSenderTelephoneNumber = 0x6802

    /// [MS-OXPROPS] 2.817 PidTagOfflineAddressBookMessageClass
    /// Canonical name: PidTagOfflineAddressBookMessageClass
    /// Description: Contains the message class for full OAB messages.
    /// Property ID: 0x6803
    /// Data type: PtypInteger32, 0x0003
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXPFOAB] section 2.2.2.1.1
    /// Alternate names: PR_OAB_MESSAGE_CLASS
    /// [MS-OXPROPS] 2.1061 PidTagVoiceMessageSenderName
    /// Canonical name: PidTagVoiceMessageSenderName
    /// Description: Specifies the name of the caller who left the attached voice message, as provided by the
    /// voice network's caller ID system.
    /// Property ID: 0x6803
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.5
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaVoiceMessageSenderName
    case tagOfflineAddressBookMessageClassOrTagVoiceMessageSenderName = 0x6803

    /// [MS-OXPROPS] 2.695 PidTagFaxNumberOfPages
    /// Canonical name: PidTagFaxNumberOfPages
    /// Description: Contains the number of pages in a Fax object.
    /// Property ID: 0x6804
    /// Data type: PtypInteger32, 0x0003
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.7
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaFaxNumberOfPages
    /// [MS-OXPROPS] 2.816 PidTagOfflineAddressBookDistinguishedName
    /// Canonical name: PidTagOfflineAddressBookDistinguishedName
    /// Description: Contains the DN of the address list that is contained in the OAB message.
    /// Property ID: 0x6804
    /// Data type: PtypString8, 0x001E
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXOAB] section 2.12.2
    /// Alternate names: PR_OAB_DN, PR_OAB_DN_W
    case tagFaxNumberOfPagesOrTagOfflineAddressBookDistinguishedName = 0x6804

    /// [MS-OXPROPS] 2.820 PidTagOfflineAddressBookTruncatedProperties
    /// Canonical name: PidTagOfflineAddressBookTruncatedProperties
    /// Description: Contains a list of the property tags that have been truncated or limited by the server.
    /// Property ID: 0x6805
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Offline Address Book Properties
    /// Defining reference: [MS-OXOAB] section 2.9.2.2
    /// Alternate names: PR_OAB_TRUNCATED_PROPS
    /// [MS-OXPROPS] 2.1059 PidTagVoiceMessageAttachmentOrder
    /// Canonical name: PidTagVoiceMessageAttachmentOrder
    /// Description: Contains a list of file names for the audio file attachments that are to be played as part
    /// of a message.
    /// Property ID: 0x6805
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.9
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaVoiceMessageAttachmentOrder
    case tagOfflineAddressBookTruncatedPropertiesOrTagVoiceMessageAttachmentOrder = 0x6805

    /// [MS-OXPROPS] 2.628 PidTagCallId
    /// Canonical name: PidTagCallId
    /// Description: Contains a unique identifier associated with the phone call.
    /// Property ID: 0x6806
    /// Data type: PtypString, 0x001F
    /// Area: Unified Messaging
    /// Defining reference: [MS-OXOUM] section 2.2.5.11
    /// Consuming reference: [MS-OXCMAIL]
    /// Alternate names: InternalSchemaCallID
    case tagCallId = 0x6806

    // case unknown0x6807 = 0x6807

    // case unknown0x6808 = 0x6808

    // case unknown0x6809 = 0x6809

    // case unknown0x680A = 0x680A

    // case unknown0x680B = 0x680B

    // case unknown0x680C = 0x680C

    case unknown0x680D = 0x680D

    case unknown0x680E = 0x680E

    // case unknown0x680F = 0x680F

    /// [MS-OXPROPS] 2.923 PidTagReportingMessageTransferAgent
    /// Canonical name: PidTagReportingMessageTransferAgent
    /// Description: Contains the value of the Reporting-MTA field for a delivery status notification, as
    /// specified in [RFC3464].
    /// Property ID: 0x6820
    /// Data type: PtypString, 0x001F
    /// Area: Email
    /// Defining reference: [MS-OXOMSG] section 2.2.2.35
    /// Consuming references: [MS-OXCMAIL]
    /// Alternate names: ptagDsnReportingMta
    case tagReportingMessageTransferAgent = 0x6820

    // case unknown0x6821 = 0x6821

    // case unknown0x6826 = 0x6826

    case unknown0x6827 = 0x6827

    // case unknown0x6828 = 0x6828
    
    // case unknown0x682E = 0x682E
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagMapiFormComposeCommand 0x682F PtypString
    case tagMapiFormComposeCommand = 0x682F
    
    // case unknown0x68230 = 0x68230

    // case unknown0x6834 = 0x6834

    /// [MS-OXPROPS] 2.992 PidTagSearchFolderLastUsed
    /// Canonical name: PidTagSearchFolderLastUsed
    /// Description: Contains the last time, in UTC, that the folder was accessed.
    /// Property ID: 0x6834
    /// Data type: PtypInteger32, 0x0003
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.4
    /// Alternate names: PR_WB_SF_LAST_USED
    case tagSearchFolderLastUsed = 0x6834

    // case unknown0x6835 = 0x6835

    // case unknown0x6836 = 0x6836

    // case unknown0x6837 = 0x6837

    // case unknown0x6838 = 0x6838

    // case unknown0x6839 = 0x6839

    /// [MS-OXPROPS] 2.990 PidTagSearchFolderExpiration
    /// Canonical name: PidTagSearchFolderExpiration
    /// Description: Contains the time, in UTC, at which the search folder container will be stale and has to
    /// be updated or recreated.
    /// Property ID: 0x683A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.5
    /// Alternate names: PR_WB_SF_EXPIRATION
    case tagSearchFolderExpiration = 0x683A

    // case unknown0x683B = 0x683B

    // case unknown0x683C = 0x683C

    // case unknown0x683D = 0x683D

    // case unknown0x683E = 0x683E

    // case unknown0x683F = 0x683F

    // case unknown0x6840 = 0x6840

    /// [MS-OXPROPS] 2.996 PidTagSearchFolderTemplateId
    ///Canonical name: PidTagSearchFolderTemplateId
    ///Description: Contains the ID of the template that is being used for the search.
    ///Property ID: 0x6841
    ///Data type: PtypInteger32, 0x0003
    ///Area: Search
    ///Defining reference: [MS-OXOSRCH] section 2.2.1.2.2
    ///Alternate names: PR_WB_SF_TEMPLATE_ID
    case tagSearchFolderTemplateId = 0x6841

    /// [MS-OXPROPS] 2.991 PidTagSearchFolderId
    /// Canonical name: PidTagSearchFolderId
    /// Description: Contains a GUID that identifies the search folder.
    /// Property ID: 0x6842
    /// Data type: PtypBinary, 0x0102
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.1
    /// Consuming reference: [MS-OXOCFG]
    /// Alternate names: PR_WB_SF_ID
    /// [MS-OXPROPS] 2.971 PidTagScheduleInfoDelegatorWantsCopy
    /// Canonical name: PidTagScheduleInfoDelegatorWantsCopy
    /// Description: Indicates whether the delegator wants to receive copies of the meeting-related objects
    /// that are sent to the delegate.
    /// Property ID: 0x6842
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.1
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_BOSS_WANTS_COPY
    /// [MS-OXPROPS] 2.1071 PidTagWlinkGroupHeaderID
    /// Canonical name: PidTagWlinkGroupHeaderID
    /// Description: Specifies the ID of the navigation shortcut that groups other navigation shortcuts.
    /// Property ID: 0x6842
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.3
    /// Alternate names:
    case tagSearchFolderIdOrTagScheduleInfoDelegatorWantsCopyOrWlinkGroupHeaderID = 0x6842

    /// [MS-OXPROPS] 2.975 PidTagScheduleInfoDontMailDelegates
    /// Canonical name: PidTagScheduleInfoDontMailDelegates
    /// Description: Contains a value set to TRUE by the client, regardless of user input.
    /// Property ID: 0x6843
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.7
    /// Consuming references: [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_DONT_MAIL_DELEGATES
    case tagScheduleInfoDontMailDelegates = 0x6843

    /// [MS-OXPROPS] 2.993 PidTagSearchFolderRecreateInfo
    /// Canonical name: PidTagSearchFolderRecreateInfo
    /// Description: This property is not to be used.
    /// Property ID: 0x6844
    /// Data type: PtypBinary, 0x0102
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.9
    /// Alternate names: PR_WB_SF_RECREATE_INFO
    /// [MS-OXPROPS] 2.969 PidTagScheduleInfoDelegateNames
    /// Canonical name: PidTagScheduleInfoDelegateNames
    /// Description: Specifies the names of the delegates.
    /// Property ID: 0x6844
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.3
    /// Consuming reference: [MS-OXMSG]
    /// Alternate names: PR_SCHDINFO_DELEGATE_NAMES
    case tagSearchFolderRecreateInfoOrTagScheduleInfoDelegateNames = 0x6844

    /// [MS-OXPROPS] 2.968 PidTagScheduleInfoDelegateEntryIds
    /// Canonical name: PidTagScheduleInfoDelegateEntryIds
    /// Description: Specifies the EntryIDs of the delegates.
    /// Property ID: 0x6845
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.5
    /// Alternate names: PR_SCHDINFO_DELEGATE_ENTRYIDS
    /// [MS-OXPROPS] 2.988 PidTagSearchFolderDefinition
    /// Canonical name: PidTagSearchFolderDefinition
    /// Description: Specifies the search criteria and search options.
    /// Property ID: 0x6845
    /// Data type: PtypBinary, 0x0102
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.8
    /// Alternate names: PR_WB_SF_DEFINITION
    case tagScheduleInfoDelegateEntryIdsOrTagSearchFolderDefinition = 0x6845

    /// [MS-OXPROPS] 2.711 PidTagGatewayNeedsToRefresh
    /// Canonical name: PidTagGatewayNeedsToRefresh
    /// Description: This property is deprecated and SHOULD NOT be used.
    /// Property ID: 0x6846
    /// Data type: PtypBoolean, 0x000B
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.4.1
    /// Alternate names: PR_GATEWAY_NEEDS_TO_REFRESH
    /// [MS-OXPROPS] 2.994 PidTagSearchFolderStorageType
    /// Canonical name: PidTagSearchFolderStorageType
    /// Description: Contains flags that specify the binary large object (BLOB) data that appears in the
    /// PidTagSearchFolderDefinition (section 2.988) property.
    /// Property ID: 0x6846
    /// Data type: PtypInteger32, 0x0003
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.6
    /// Alternate names: PR_WB_SF_STORAGE_TYPE
    case tagGatewayNeedsToRefreshOrTagSearchFolderStorageType = 0x6846

    /// [MS-OXPROPS] 2.708 PidTagFreeBusyPublishStart
    /// Canonical name: PidTagFreeBusyPublishStart
    /// Description: Specifies the start time, in UTC, of the publishing range.
    /// Property ID: 0x6847
    /// Data type: PtypInteger32, 0x0003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.9
    /// Alternate names: PR_FREEBUSY_PUBLISH_START
    /// [MS-OXPROPS] 2.995 PidTagSearchFolderTag
    /// Canonical name: PidTagSearchFolderTag
    /// Description: Contains the value of the SearchFolderTag sub-property of the
    /// PidTagExtendedFolderFlags (section 2.691) property of the search folder container.
    /// Property ID: 0x6847
    /// Data type: PtypInteger32, 0x0003
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.3
    /// Alternate names: PR_WB_SF_TAG
    /// [MS-OXPROPS] 2.1076 PidTagWlinkSaveStamp
    /// Canonical name: PidTagWlinkSaveStamp
    /// Description: Specifies an integer that allows a client to identify with a high probability whether the
    /// navigation shortcut was saved by the current client session.
    /// Property ID: 0x6847
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.4
    /// Alternate names:
    case tagFreeBusyPublishStartOrTagSearchFolderTagOrTagWlinkSaveStamp = 0x6847

    /// [MS-OXPROPS] 2.707 PidTagFreeBusyPublishEnd
    /// Canonical name: PidTagFreeBusyPublishEnd
    /// Description: Specifies the end time, in UTC, of the publishing range.
    /// Property ID: 0x6848
    /// Data type: PtypInteger32, 0x0003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.10
    /// Alternate names: PR_FREEBUSY_PUBLISH_END
    /// [MS-OXPROPS] 2.989 PidTagSearchFolderEfpFlags
    /// Canonical name: PidTagSearchFolderEfpFlags
    /// Description: Specifies flags that control how a folder is displayed.
    /// Property ID: 0x6848
    /// Data type: PtypInteger32, 0x0003
    /// Area: Search
    /// Defining reference: [MS-OXOSRCH] section 2.2.1.2.7
    /// Alternate names: PR_WB_SF_EFP_FLAGS
    case tagFreeBusyPublishEndOrTagSearchFolderEfpFlags = 0x6848

    /// [MS-OXPROPS] 2.706 PidTagFreeBusyMessageEmailAddress
    /// Canonical name: PidTagFreeBusyMessageEmailAddress
    /// Description: Specifies the email address of the user or resource to whom this free/busy message
    /// applies.
    /// Property ID: 0x6849
    /// Data type: PtypString, 0x001F
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.12
    /// Alternate names: PR_FREEBUSY_EMA
    /// [MS-OXPROPS] 2.1079 PidTagWlinkType
    /// Canonical name: PidTagWlinkType
    /// Description: Specifies the type of navigation shortcut.
    /// Property ID: 0x6849
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.5
    /// Alternate names: PR_WLINK_TYPE
    case tagFreeBusyMessageEmailAddressOrTagWlinkType = 0x6849

    /// [MS-OXPROPS] 2.970 PidTagScheduleInfoDelegateNamesW
    /// Canonical name: PidTagScheduleInfoDelegateNamesW
    /// Description: Specifies the names of the delegates in Unicode.
    /// Property ID: 0x684A
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.4
    /// Alternate names: PR_SCHDINFO_DELEGATE_NAMES_W, ptagDelegateNames
    /// [MS-OXPROPS] 2.1068 PidTagWlinkFlags
    /// Canonical name: PidTagWlinkFlags
    /// Description: Specifies conditions associated with the shortcut.
    /// Property ID: 0x684A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.6
    /// Alternate names: PR_WLINK_FLAGS
    case tagScheduleInfoDelegateNamesWOrWlinkFlags = 0x684A

    /// [MS-OXPROPS]2.972 PidTagScheduleInfoDelegatorWantsInfo
    /// Canonical name: PidTagScheduleInfoDelegatorWantsInfo
    /// Description: Indicates whether the delegator wants to receive informational updates.
    /// Property ID: 0x684B
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.2
    /// Consuming references: [MS-OXOCAL], [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_BOSS_WANTS_INFO
    /// [MS-OXPROPS] 2.1073 PidTagWlinkOrdinal
    /// Canonical name: PidTagWlinkOrdinal
    /// Description: Specifies a variable-length binary property to be used to sort shortcuts lexicographically.
    /// Property ID: 0x684B
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.7
    /// Alternate names: PR_WLINK_ORDINAL
    case tagScheduleInfoDelegatorWantsInfoOrTagWlinkOrdinal = 0x684B

    /// [MS-OXPROPS] 2.1067 PidTagWlinkEntryId
    /// Canonical name: PidTagWlinkEntryId
    /// Description: Specifies the EntryID of the folder pointed to by the shortcut.
    /// Property ID: 0x684C
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.8
    /// Alternate names: PR_WLINK_ENTRYID
    case tagWlinkEntryId = 0x684C

    /// [MS-OXPROPS] 2.1074 PidTagWlinkRecordKey
    /// Canonical name: PidTagWlinkRecordKey
    /// Description: Specifies the value of PidTagRecordKey property (section 2.910) of the folder pointed
    /// to by the shortcut.
    /// Property ID: 0x684D
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.9
    /// Alternate names: PR_WLINK_RECKEY
    case tagWlinkRecordKey = 0x684D

    /// [MS-OXPROPS] 2.1078 PidTagWlinkStoreEntryId
    /// Canonical name: PidTagWlinkStoreEntryId
    /// Description: Specifies the value of the PidTagStoreEntryId property (section 2.1028) of the folder
    /// pointed to by the shortcut.
    /// Property ID: 0x684E
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.10
    /// Alternate names: PR_WLINK_STORE_ENTRYID
    case tagWlinkStoreEntryId = 0x684E

    /// [MS-OXPROPS] 2.983 PidTagScheduleInfoMonthsMerged
    /// Canonical name: PidTagScheduleInfoMonthsMerged
    /// Description: Specifies the months for which free/busy data of type busy or OOF is present in the
    /// free/busy message.
    /// Property ID: 0x684F
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.7
    /// Alternate names: PR_SCHDINFO_MONTHS_MERGED
    /// [MS-OXPROPS] 2.1069 PidTagWlinkFolderType
    /// Canonical name: PidTagWlinkFolderType
    /// Description: Specifies the type of folder pointed to by the shortcut.
    /// Property ID: 0x684F
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.11
    /// Alternate names: PR_WLINK_FOLDER_TYPE
    case tagScheduleInfoMonthsMergedOragWlinkFolderType = 0x684F

    /// [MS-OXPROPS] 2.979 PidTagScheduleInfoFreeBusyMerged
    /// Canonical name: PidTagScheduleInfoFreeBusyMerged
    /// Description: Specifies the blocks for which free/busy data of type busy or OOF is present in the
    /// free/busy message.
    /// Property ID: 0x6850
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.8
    /// Alternate names: PR_SCHDINFO_FREEBUSY_MERGED
    /// [MS-OXPROPS] 2.1070 PidTagWlinkGroupClsid
    /// Canonical name: PidTagWlinkGroupClsid
    /// Description: Specifies the value of the PidTagWlinkGroupHeaderID property (section 2.1070) of
    /// the group header associated with the shortcut.
    /// Property ID: 0x6850
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.12
    /// Alternate names: PR_WLINK_GROUP_CLSID
    case tagScheduleInfoFreeBusyMergedOrTagWlinkGroupClsid = 0x6850

    /// [MS-OXPROPS] 2.984 PidTagScheduleInfoMonthsTentative
    /// Canonical name: PidTagScheduleInfoMonthsTentative
    /// Description: Specifies the months for which free/busy data of type tentative is present in the
    /// free/busy message.
    /// Property ID: 0x6851
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.1
    /// Alternate names: PR_SCHDINFO_MONTHS_TENTATIVE
    /// [MS-OXPROPS] 2.1072 PidTagWlinkGroupName
    /// Canonical name: PidTagWlinkGroupName
    /// Description: Specifies the value of the PidTagNormalizedSubject (section 2.812) of the group
    /// header associated with the shortcut.
    /// Property ID: 0x6851
    /// Data type: PtypString, 0x001F
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.13
    /// Alternate names: PR_WLINK_GROUP_NAME
    case tagScheduleInfoMonthsTentativeOrTagWlinkGroupName = 0x6851

    /// [MS-OXPROPS] 2.980 PidTagScheduleInfoFreeBusyTentative
    /// Canonical name: PidTagScheduleInfoFreeBusyTentative
    /// Description: Specifies the blocks of times for which the free/busy status is set to a value of
    /// tentative.
    /// Property ID: 0x6852
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.2
    /// Alternate names: PR_SCHDINFO_FREEBUSY_TENTATIVE
    /// [MS-OXPROPS] 2.1077 PidTagWlinkSection
    /// Canonical name: PidTagWlinkSection
    /// Description: Specifies the section where the shortcut will be grouped.
    /// Property ID: 0x6852
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.14
    /// Alternate names: PR_WLINK_SECTION
    case tagScheduleInfoFreeBusyTentativeOrTagWlinkSection = 0x6852

    /// [MS-OXPROPS] 2.982 PidTagScheduleInfoMonthsBusy
    /// Canonical name: PidTagScheduleInfoMonthsBusy
    /// Description: Specifies the months for which free/busy data of type busy is present in the free/busy
    /// message.
    /// Property ID: 0x6853
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.3
    /// Consuming reference: [MS-OXMSG]
    /// Alternate names: PR_SCHDINFO_MONTHS_BUSY
    /// [MS-OXPROPS] 2.1065 PidTagWlinkCalendarColor
    /// Canonical name: PidTagWlinkCalendarColor
    /// Description: Specifies the background color of the calendar.
    /// Property ID: 0x6853
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.15
    /// Alternate names: PR_WLINK_CALENDAR_COLOR
    case tagScheduleInfoMonthsBusyOrTagWlinkCalendarColor = 0x6853

    /// [MS-OXPROPS] 2.978 PidTagScheduleInfoFreeBusyBusy
    /// Canonical name: PidTagScheduleInfoFreeBusyBusy
    /// Description: Specifies the blocks of time for which the free/busy status is set to a value of busy.
    /// Property ID: 0x6854
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.4
    /// Alternate names: PR_SCHDINFO_FREEBUSY_BUSY
    /// [MS-OXPROPS] 2.1063 PidTagWlinkAddressBookEID
    /// Canonical name: PidTagWlinkAddressBookEID
    /// Description: Specifies the value of the PidTagEntryId property (section 2.683) of the user to whom
    /// the folder belongs.
    /// Property ID: 0x6854
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.16
    /// Alternate names: PR_WLINK_ABEID
    case tagScheduleInfoFreeBusyBusyOrTagWlinkAddressBookEID = 0x6854

    /// [MS-OXPROPS] 2.981 PidTagScheduleInfoMonthsAway
    /// Canonical name: PidTagScheduleInfoMonthsAway
    /// Description: Specifies the months for which free/busy data of type OOF is present in the free/busy
    /// message.
    /// Property ID: 0x6855
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.5
    /// Alternate names: PR_SCHDINFO_MONTHS_OOF
    case tagScheduleInfoMonthsAway = 0x6855

    /// [MS-OXPROPS] 2.977 PidTagScheduleInfoFreeBusyAway
    /// Canonical name: PidTagScheduleInfoFreeBusyAway
    /// Description: Specifies the times for which the free/busy status is set a value of OOF.
    /// Property ID: 0x6856
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.6
    /// Alternate names: PR_SCHDINFO_FREEBUSY_OOF
    case tagScheduleInfoFreeBusyAway = 0x6856

    // case unknown0x6857 = 0x6857

    // case unknown0x6867 = 0x6867

    /// [MS-OXPROPS] 2.709 PidTagFreeBusyRangeTimestamp
    /// Canonical name: PidTagFreeBusyRangeTimestamp
    /// Description: Specifies the time, in UTC, that the data was published.
    /// Property ID: 0x6868
    /// Data type: PtypTime, 0x0040
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.2.11
    /// Alternate names: PR_FREEBUSY_RANGE_TIMESTAMP
    case tagFreeBusyRangeTimestamp = 0x6868

    /// [MS-OXPROPS] 2.704 PidTagFreeBusyCountMonths
    /// Canonical name: PidTagFreeBusyCountMonths
    /// Description: Contains an integer value used to calculate the start and end dates of the range of
    /// free/busy data to be published to the public folders.
    /// Property ID: 0x6869
    /// Data type: PtypInteger32, 0x0003
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOCAL] section 2.2.12.1
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: PR_FREEBUSY_COUNT_MONTHS
    case tagFreeBusyCountMonths = 0x6869

    /// [MS-OXPROPS] 2.966 PidTagScheduleInfoAppointmentTombstone
    /// Canonical name: PidTagScheduleInfoAppointmentTombstone
    /// Description: Contains a list of tombstones, where each tombstone represents a Meeting object that
    /// has been declined.
    /// Property ID: 0x686A
    /// Data type: PtypBinary, 0x0102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.12.5
    /// Alternate names: PR_SCHDINFO_APPT_TOMBSTONE
    case tagScheduleInfoAppointmentTombstone = 0x686A

    /// [MS-OXPROPS] 2.667 PidTagDelegateFlags
    /// Canonical name: PidTagDelegateFlags
    /// Description: Indicates whether delegates can view Message objects that are marked as private.
    /// Property ID: 0x686B
    /// Data type: PtypMultipleInteger32, 0x1003
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXODLGT] section 2.2.2.2.6
    /// Alternate names: PR_DELEGATE_FLAGS, ptagDelegateFlags
    case tagDelegateFlags = 0x686B

    /// [MS-OXPROPS] 2.976 PidTagScheduleInfoFreeBusy
    /// Canonical name: PidTagScheduleInfoFreeBusy
    /// Description: This property is deprecated and is not to be used.
    /// Property ID: 0x686C
    /// Data type: PtypBinary, 0x0102
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOPFFB] section 2.2.1.4.3
    /// Alternate names: PR_SCHDINFO_FREEBUSY
    case tagScheduleInfoFreeBusy = 0x686C

    /// [MS-OXPROPS] 2.967 PidTagScheduleInfoAutoAcceptAppointments
    /// Canonical name: PidTagScheduleInfoAutoAcceptAppointments
    /// Description: Indicates whether a client or server is to automatically respond to all meeting
    /// requests for the attendee or resource.
    /// Property ID: 0x686D
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.12.2
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_AUTO_ACCEPT_APPTS
    case tagScheduleInfoAutoAcceptAppointments = 0x686D

    /// [MS-OXPROPS] 2.974 PidTagScheduleInfoDisallowRecurringAppts
    /// Canonical name: PidTagScheduleInfoDisallowRecurringAppts
    /// Description: Indicates whether a client or server, when automatically responding to meeting
    /// requests, is to decline Meeting Request objects that represent a recurring series.
    /// Property ID: 0x686E
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.12.3
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_DISALLOW_RECURRING_APPTS
    case tagScheduleInfoDisallowRecurringAppts = 0x686E

    /// [MS-OXPROPS] 2.973 PidTagScheduleInfoDisallowOverlappingAppts
    /// Canonical name: PidTagScheduleInfoDisallowOverlappingAppts
    /// Description: Indicates whether a client or server, when automatically responding to meeting
    /// requests, is to decline Meeting Request objects that overlap with previously scheduled events.
    /// Property ID: 0x686F
    /// Data type: PtypBoolean, 0x000B
    /// Area: Free/Busy Properties
    /// Defining reference: [MS-OXOCAL] section 2.2.12.4
    /// Consuming reference: [MS-OXOPFFB]
    /// Alternate names: PR_SCHDINFO_DISALLOW_OVERLAPPING_APPTS
    case tagScheduleInfoDisallowOverlappingAppts = 0x686F

    // case unknown0x6870 = 0x6870

    // case unknown0x688F = 0x688F

    /// [MS-OXPROPS] 2.1066 PidTagWlinkClientID
    /// Canonical name: PidTagWlinkClientID
    /// Description: Specifies the Client ID that allows the client to determine whether the shortcut was
    /// created on the current machine/user via an equality test.
    /// Property ID: 0x6890
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.18
    /// Alternate names: PR_WLINK_CLIENTID
    case tagWlinkClientID = 0x6890

    /// [MS-OXPROPS] 2.1064 PidTagWlinkAddressBookStoreEID
    /// Canonical name: PidTagWlinkAddressBookStoreEID
    /// Description: Specifies the value of the PidTagStoreEntryId property (section 2.1028) of the current
    /// user (not the owner of the folder).
    /// Property ID: 0x6891
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.17
    /// Alternate names: PR_WLINK_AB_EXSTOREEID
    case tagWlinkAddressBookStoreEID = 0x6891

    /// [MS-OXPROPS] 2.1075 PidTagWlinkROGroupType
    /// Canonical name: PidTagWlinkROGroupType
    /// Description: Specifies the type of group header.
    /// Property ID: 0x6892
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.9.19
    /// Alternate names: PR_WLINK_RO_GROUP_TYPE
    case tagWlinkROGroupType = 0x6892

    // case unknown0x6893 = 0x6893

    // case unknown0x68FF = 0x68FF

    case unknown0x6900 = 0x6900

    // case unknown0x6901 = 0x6901

    // case unknown0x7000 = 0x7000

    /// [MS-OXPROPS] 2.1055 PidTagViewDescriptorBinary
    /// Canonical name: PidTagViewDescriptorBinary
    /// Description: Contains view definitions.
    /// Property ID: 0x7001
    /// Data type: PtypBinary, 0x0102
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOCFG] section 2.2.6.1
    /// Alternate names: PR_VD_BINARY
    case tagViewDescriptorBinary = 0x7001

    /// [MS-OXPROPS] 2.1057 PidTagViewDescriptorStrings
    /// Canonical name: PidTagViewDescriptorStrings
    /// Description: Contains view definitions in string format.
    /// Property ID: 0x7002
    /// Data type: PtypString, 0x001F
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOCFG] section 2.2.6.3
    /// Alternate names: PR_VD_STRINGS, PR_VD_STRINGS_W
    case tagViewDescriptorStrings = 0x7002
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7003 PtypInteger32 PidTagViewDescriptorFlags View descriptor flags. Y
    case tagViewDescriptorFlags = 0x7003
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7004 PtypBinary PidTagViewDescriptorLinkTo View descriptor link. Y
    case tagViewDescriptorLinkTo = 0x7004
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7005 PtypBinary PidTagViewDescriptorViewFolder View descriptor Folder object. Y
    case tagViewDescriptorViewFolder = 0x7005

    /// [MS-OXPROPS] 2.1056 PidTagViewDescriptorName
    /// Canonical name: PidTagViewDescriptorName
    /// Description: Contains the view descriptor name.
    /// Property ID: 0x7006
    /// Data type: PtypString, 0x001F
    /// Area: MessageClassDefinedTransmittable
    /// Defining reference: [MS-OXOCFG] section 2.2.6.2
    /// Alternate names: PR_VD_NAME, PR_VD_NAME_W
    case tagViewDescriptorName = 0x7006

    /// [MS-OXPROPS] 2.1058 PidTagViewDescriptorVersion
    /// Canonical name: PidTagViewDescriptorVersion
    /// Description: Contains the View Descriptor version.
    /// Property ID: 0x7007
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference:[MS-OXOCFG] section 2.2.6.4
    /// Alternate names: PR_VD_VERSION
    case tagViewDescriptorVersion = 0x7007

    // case unknown0x7008 = 0x7008

    // case unknown0x7009 = 0x7009

    // case unknown0x7C00 = 0x7C00

    // case unknown0x7C01 = 0x7C01

    // case unknown0x7C02 = 0x7C02

    // case unknown0x7C03 = 0x7C03

    // case unknown0x7C04 = 0x7C04

    // case unknown0x7C05 = 0x7C05

    /// [MS-OXPROPS] 2.936 PidTagRoamingDatatypes
    /// Canonical name: PidTagRoamingDatatypes
    /// Description: Contains a bitmask that indicates which stream properties exist on the message.
    /// Property ID: 0x7C06
    /// Data type: PtypInteger32, 0x0003
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.2.1
    /// Alternate names: PR_ROAMING_DATATYPES
    case tagRoamingDatatypes = 0x7C06

    /// [MS-OXPROPS] 2.937 PidTagRoamingDictionary
    /// Canonical name: PidTagRoamingDictionary
    /// Description: Contains a dictionary stream, as specified in [MS-OXOCFG] section 2.2.5.1.
    /// Property ID: 0x7C07
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.2.2
    /// Alternate names: PR_ROAMING_DICTIONARY
    case tagRoamingDictionary = 0x7C07

    /// [MS-OXPROPS] 2.938 PidTagRoamingXmlStream
    /// Canonical name: PidTagRoamingXmlStream
    /// Description: Contains an XML stream, as specified in [MS-OXOCFG] section 2.2.5.2.
    /// Property ID: 0x7C08
    /// Data type: PtypBinary, 0x0102
    /// Area: Configuration
    /// Defining reference: [MS-OXOCFG] section 2.2.2.3
    /// Alternate names: PR_ROAMING_XMLSTREAM
    case tagRoamingXmlStream = 0x7C08

    // case unknown0x7C09 = 0x7C09

    // case unknown0x7C23 = 0x7C23

    /// [MS-OXPROPS] 2.847 PidTagOscSyncEnabled
    /// Canonical name: PidTagOscSyncEnabled
    /// Description: Specifies whether contact synchronization with an external source is handled by the
    /// server.
    /// Property ID: 0x7C24
    /// Data type: PtypBoolean, 0x000B
    /// Area: Contact Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.9.7
    /// Alternate names: PR_OSC_SYNC_ENABLEDONSERVER
    case tagOscSyncEnabled = 0x7C24

    // case unknown0x7C25 = 0x7C25

    // case unknown0x7D00 = 0x7D00

    /// [MS-OXPROPS] 2.872 PidTagProcessed
    /// Canonical name: PidTagProcessed
    /// Description: Indicates whether a client has already processed a received task communication.
    /// Property ID: 0x7D01
    /// Data type: PtypBoolean, 0x000B
    /// Area: Calendar
    /// Defining reference: [MS-OXOCAL] section 2.2.5.7
    /// Consuming references: [MS-OXCICAL], [MS-OXOTASK]
    /// Alternate names: PR_PROCESSED
    case tagProcessed = 0x7D01

    // case unknown0x7D02 = 0x7D02

    // case unknown0x7D0D = 0x7D0D

    case unknown0x7D0E = 0x7D0E

    // case unknown0x7D0F = 0x7D0F

    // case unknown0x7FF8 = 0x7FF8

    /// [MS-OXPROPS] 2.685 PidTagExceptionReplaceTime
    /// Canonical name: PidTagExceptionReplaceTime
    /// Description: Indicates the original date and time, in UTC, at which the instance in the recurrence
    /// pattern would have occurred if it were not an exception.
    /// Property ID: 0x7FF9
    /// Data type: PtypTime, 0x0040
    /// Area: MessageClassDefinedNonTransmittable
    /// Defining reference: [MS-OXOCAL] section 2.2.10.1.6
    /// Alternate names: PR_EXCEPTION_REPLACETIME
    case tagExceptionReplaceTime = 0x7FF9

    /// [MS-OXPROPS] 2.600 PidTagAttachmentLinkId
    /// Canonical name: PidTagAttachmentLinkId
    /// Description: Contains the type of Message object to which an attachment is linked.
    /// Property ID: 0x7FFA
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.22
    /// Consuming references: [MS-OXCICAL], [MS-OXOJRNL], [MS-OXORMDR]
    /// Alternate names: PR_ATTACHMENT_LINKID, ptagAttachmentLinkId
    case tagAttachmentLinkId = 0x7FFA

    /// [MS-OXPROPS] 2.686 PidTagExceptionStartTime
    /// Canonical name: PidTagExceptionStartTime
    /// Description: Contains the start date and time of the exception in the local time zone of the computer
    /// when the exception is created.
    /// Property ID: 0x7FFB
    /// Data type: PtypTime, 0x0040
    /// Area: MessageClassDefinedNonTransmittable
    /// Defining reference: [MS-OXOCAL] section 2.2.10.1.4
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: PR_EXCEPTION_STARTTIME, ptagExceptionStartTime
    case tagExceptionStartTime = 0x7FFB

    /// [MS-OXPROPS] 2.684 PidTagExceptionEndTime
    /// Canonical name: PidTagExceptionEndTime
    /// Description: Contains the end date and time of the exception in the local time zone of the computer
    /// when the exception is created.
    /// Property ID: 0x7FFC
    /// Data type: PtypTime, 0x0040
    /// Area: MessageClassDefinedNonTransmittable
    /// Defining reference: [MS-OXOCAL] section 2.2.10.1.5
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR]
    /// Alternate names: PR_EXCEPTION_ENDTIME, ptagExceptionEndTime
    case tagExceptionEndTime = 0x7FFC

    /// [MS-OXPROPS] 2.598 PidTagAttachmentFlags
    /// Canonical name: PidTagAttachmentFlags
    /// Description: Indicates special handling for an Attachment object.
    /// Property ID: 0x7FFD
    /// Data type: PtypInteger32, 0x0003
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.23
    /// Consuming references: [MS-OXCICAL], [MS-OXORMDR], [MS-OXOCAL], [MS-OXOJRNL]
    /// Alternate names: PR_ATTACHMENT_FLAGS, ptagAttachmentFlags
    case tagAttachmentFlags = 0x7FFD

    /// [MS-OXPROPS] 2.599 PidTagAttachmentHidden
    /// Canonical name: PidTagAttachmentHidden
    /// Description: Indicates whether an Attachment object is hidden from the end user.
    /// Property ID: 0x7FFE
    /// Data type: PtypBoolean, 0x000B
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXCMSG] section 2.2.2.24
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXOCAL], [MS-OXOJRNL], [MSOXORMDR], [MS-OXOSMMS], [MS-OXOTASK], [MS-OXRTFEX]
    /// Alternate names: PR_ATTACHMENT_HIDDEN
    case tagAttachmentHidden = 0x7FFE

    /// [MS-OXPROPS] 2.597 PidTagAttachmentContactPhoto
    /// Canonical name: PidTagAttachmentContactPhoto
    /// Description: Indicates that a contact photo attachment is attached to a Contact object.
    /// Property ID: 0x7FFF
    /// Data type: PtypBoolean, 0x000B
    /// Area: Message Attachment Properties
    /// Defining reference: [MS-OXOCNTC] section 2.2.1.8.2
    /// Consuming references: [MS-OXCFXICS], [MS-OXCICAL], [MS-OXORMDR], [MS-OXVCARD]
    /// Alternate names: PR_ATTACHMENT_CONTACTPHOTO
    case tagAttachmentContactPhoto = 0x7FFF

    // case unknown0x8001 = 0x8000

    // case unknown0x8001 = 0x8001

    // case unknown0x8002 = 0x8002

    // case unknown0x8003 = 0x8003

    /// [MS-OXPROPS] 2.537 PidTagAddressBookFolderPathname
    /// Canonical name: PidTagAddressBookFolderPathname
    /// Description: This property is deprecated and is to be ignored.
    /// Property ID: 0x8004
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.6.4
    /// Alternate names: PR_EMS_AB_FOLDER_PATHNAME, PR_EMS_AB_FOLDER_PATHNAME_A,
    /// PR_EMS_AB_FOLDER_PATHNAME_W
    case tagAddressBookFolderPathname = 0x8004

    /// [MS-OXPROPS] 2.549 PidTagAddressBookManagerDistinguishedName
    /// Canonical name: PidTagAddressBookManagerDistinguishedName
    /// Description: Contains the DN of the mail user's manager.
    /// Property ID: 0x8005
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.9
    /// Alternate names: PR_EMS_AB_MANAGER_T
    /// [MS-OXPROPS] 2.548 PidTagAddressBookManager
    /// Canonical name: PidTagAddressBookManager
    /// Description: Contains one row that references the mail user's manager.
    /// Property ID: 0x8005
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.1
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_MANAGER, PR_EMS_AB_MANAGER_A, PR_EMS_AB_MANAGER_W
    case tagAddressBookManagerOrTagAddressBookManagerDistinguishedName = 0x8005

    /// [MS-OXPROPS] 2.544 PidTagAddressBookHomeMessageDatabase
    /// Canonical name: PidTagAddressBookHomeMessageDatabase
    /// Description: Contains the DN expressed in the X500 DN format. This property is returned from a
    /// name service provider interface (NSPI) server as a PtypEmbeddedTable. Otherwise, the data
    /// type is PtypString8.
    /// Property ID: 0x8006
    /// Data type: PtypString8, 0x001EPtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.37
    /// Consuming references: [MS-OXABREF], [MS-OXLDAP], [MS-OXOAB], [MS-OXODLGT]
    /// Alternate names: PR_EMS_AB_HOME_MDB, PR_EMS_AB_HOME_MDB_A,
    /// PR_EMS_AB_HOME_MDB_W
    case tagAddressBookHomeMessageDatabase = 0x8006

    // case unknown0x8007 = 0x8007

    /// [MS-OXPROPS] 2.546 PidTagAddressBookIsMemberOfDistributionList
    /// Canonical name: PidTagAddressBookIsMemberOfDistributionList
    /// Description: Lists all of the distribution lists for which the object is a member. This property is
    /// returned from an NSPI server as a PtypEmbeddedTable. Otherwise, the data type is PtypString8.
    /// Property ID: 0x8008
    /// Data type: PtypString8, 0x001E; PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.3
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_IS_MEMBER_OF_DL, PR_EMS_AB_IS_MEMBER_OF_DL_A,
    /// PR_EMS_AB_IS_MEMBER_OF_DL_W
    case tagAddressBookIsMemberOfDistributionList = 0x8008

    /// [MS-OXPROPS] 2.550 PidTagAddressBookMember
    /// Canonical name: PidTagAddressBookMember
    /// Description: Contains the members of the distribution list.
    /// Property ID: 0x8009
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.6.1
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_MEMBER, PR_EMS_AB_MEMBER_A, PR_EMS_AB_MEMBER_W
    case tagAddressBookMember = 0x8009

    // case unknown0x800A = 0x800A

    // case unknown0x800B = 0x800B

    /// [MS-OXPROPS] 2.557 PidTagAddressBookOwner
    /// Canonical name: PidTagAddressBookOwner
    /// Description: Contains one row that references the distribution list's owner.
    /// Property ID: 0x800C
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.6.2
    /// Alternate names: PR_EMS_AB_OWNER_O
    case tagAddressBookOwner = 0x800C

    // case unknown0x800D = 0x800D

    /// [MS-OXPROPS] 2.567 PidTagAddressBookReports
    /// Canonical name: PidTagAddressBookReports
    /// Description: Lists all of the mail user’s direct reports.
    /// Property ID: 0x800E
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.2
    /// Alternate names: PR_EMS_AB_REPORTS, PR_EMS_AB_REPORTS_A, PR_EMS_AB_REPORTS_W
    case tagAddressBookReports = 0x800E

    /// [MS-OXPROPS] 2.565 PidTagAddressBookProxyAddresses
    /// Canonical name: PidTagAddressBookProxyAddresses
    /// Description: Contains alternate email addresses for the Address Book object.
    /// Property ID: 0x800F
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.23
    /// Consuming references: [MS-OXLDAP], [MS-OXOAB], [MS-OXCMAIL], [MS-OXODLGT]
    /// Alternate names: PR_EMS_AB_PROXY_ADDRESSES, PR_EMS_AB_PROXY_ADDRESSES_A,
    /// PR_EMS_AB_PROXY_ADDRESSES_W
    case tagAddressBookProxyAddresses = 0x800F

    // case unknown0x8010 = 0x8010

    /// [MS-OXPROPS] 2.573 PidTagAddressBookTargetAddress
    /// Canonical name: PidTagAddressBookTargetAddress
    /// Description: Contains the foreign system email address of an Address Book object.
    /// Property ID: 0x8011
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.22
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_TARGET_ADDRESS, PR_EMS_AB_TARGET_ADDRESS_A,
    /// PR_EMS_AB_TARGET_ADDRESS_W
    case tagAddressBookTargetAddress = 0x8011

    // case unknown0x8012 = 0x8012

    // case unknown0x8013 = 0x8013

    // case unknown0x8014 = 0x8014

    /// [MS-OXPROPS] 2.566 PidTagAddressBookPublicDelegates
    /// Canonical name: PidTagAddressBookPublicDelegates
    /// Description: Contains a list of mail users who are allowed to send email on behalf of the mailbox
    /// owner.
    /// Property ID: 0x8015
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.5
    /// Consuming reference: [MS-OXODLGT]
    /// Alternate names: PR_EMS_AB_PUBLIC_DELEGATES, PR_EMS_AB_PUBLIC_DELEGATES_A,
    /// PR_EMS_AB_PUBLIC_DELEGATES_W
    case tagAddressBookPublicDelegates = 0x8015

    // case unknown0x8016 = 0x8016

    // case unknown0x8023 = 0x8023

    /// [MS-OXPROPS] 2.558 PidTagAddressBookOwnerBackLink
    /// Canonical name: PidTagAddressBookOwnerBackLink
    /// Description: Contains a list of the distribution lists owned by a mail user.
    /// Property ID: 0x8024
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.4
    /// Alternate names: PR_EMS_AB_OWNER_BL_O
    case tagAddressBookOwnerBackLink = 0x8024

    // case unknown0x8025 = 0x8025

    // case unknown0x802C = 0x802C

    /// [MS-OXPROPS] 2.522 PidTagAddressBookExtensionAttribute1
    /// Canonical name: PidTagAddressBookExtensionAttribute1
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x802D
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_1,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_1_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_1_W
    case tagAddressBookExtensionAttribute1 = 0x802D

    /// [MS-OXPROPS] 2.529 PidTagAddressBookExtensionAttribute2
    /// Canonical name: PidTagAddressBookExtensionAttribute2
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x802E
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_2,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_2_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_2_W
    case tagAddressBookExtensionAttribute2 = 0x802E

    /// [MS-OXPROPS] 2.530 PidTagAddressBookExtensionAttribute3
    /// Canonical name: PidTagAddressBookExtensionAttribute3
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x802F
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_3,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_3_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_3_W
    case tagAddressBookExtensionAttribute3 = 0x802F

    /// [MS-OXPROPS] 2.531 PidTagAddressBookExtensionAttribute4
    /// Canonical name: PidTagAddressBookExtensionAttribute4
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8030
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_4,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_4_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_4_W
    case tagAddressBookExtensionAttribute4 = 0x8030

    /// [MS-OXPROPS] 2.532 PidTagAddressBookExtensionAttribute5
    /// Canonical name: PidTagAddressBookExtensionAttribute5
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8031
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_5,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_5_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_5_W
    case tagAddressBookExtensionAttribute5 = 0x8031

    /// [MS-OXPROPS] 2.533 PidTagAddressBookExtensionAttribute6
    /// Canonical name: PidTagAddressBookExtensionAttribute6
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8032
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_6,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_6_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_6_W
    case tagAddressBookExtensionAttribute6 = 0x8032

    /// [MS-OXPROPS] 2.534 PidTagAddressBookExtensionAttribute7
    /// Canonical name: PidTagAddressBookExtensionAttribute7
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8033
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_7,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_7_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_7_W
    case tagAddressBookExtensionAttribute7 = 0x8033

    /// [MS-OXPROPS] 2.535 PidTagAddressBookExtensionAttribute8
    /// Canonical name: PidTagAddressBookExtensionAttribute8
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8034
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_8,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_8_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_8_W
    case tagAddressBookExtensionAttribute8 = 0x8034

    /// [MS-OXPROPS] 2.536 PidTagAddressBookExtensionAttribute9
    /// Canonical name: PidTagAddressBookExtensionAttribute9
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8035
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_9,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_9_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_9_W
    case tagAddressBookExtensionAttribute9 = 0x8035

    /// [MS-OXPROPS] 2.523 PidTagAddressBookExtensionAttribute10
    /// Canonical name: PidTagAddressBookExtensionAttribute10
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8036
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_10,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_10_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_10_W
    case tagAddressBookExtensionAttribute10 = 0x8036

    // case unknown0x8037 = 0x8037

    // case unknown0x803B = 0x803B

    /// [MS-OXPROPS] 2.554 PidTagAddressBookObjectDistinguishedName
    /// Canonical name: PidTagAddressBookObjectDistinguishedName
    /// Description: Contains the DN of the Address Book object.
    /// Property ID: 0x803C
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.15
    /// Consuming reference: [MS-OXNSPI]
    /// Alternate names: PR_EMS_AB_OBJ_DIST_NAME, PR_EMS_AB_OBJ_DIST_NAME_A,
    /// PR_EMS_AB_OBJ_DIST_NAME_W
    case tagAddressBookObjectDistinguishedName = 0x803C

    // case unknown0x803D = 0x803D

    // case unknown0x8C56 = 0x8C56

    /// [MS-OXPROPS] 2.524 PidTagAddressBookExtensionAttribute11
    /// Canonical name: PidTagAddressBookExtensionAttribute11
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8C57
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_11,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_11_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_11_W
    case tagAddressBookExtensionAttribute11 = 0x8C57

    /// [MS-OXPROPS] 2.525 PidTagAddressBookExtensionAttribute12
    /// Canonical name: PidTagAddressBookExtensionAttribute12
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8C58
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_12,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_12_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_12_W
    case tagAddressBookExtensionAttribute12 = 0x8C58

    /// [MS-OXPROPS] 2.526 PidTagAddressBookExtensionAttribute13
    /// Canonical name: PidTagAddressBookExtensionAttribute13
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8C59
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_13,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_13_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_13_W
    case tagAddressBookExtensionAttribute13 = 0x8C59

    // case unknown0x8C5A = 0x8C5A

    // case unknown0x8C5B = 0x8C5B

    // case unknown0x8C5C = 0x8C5C

    // case unknown0x8C5D = 0x8C5D

    // case unknown0x8C5E = 0x8C5E

    // case unknown0x8C5F = 0x8C5F

    /// [MS-OXPROPS]2.527 PidTagAddressBookExtensionAttribute14
    /// Canonical name: PidTagAddressBookExtensionAttribute14
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8C60
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_14,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_14_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_14_W
    case tagAddressBookExtensionAttribute14 = 0x8C60

    /// 2.528 PidTagAddressBookExtensionAttribute15
    /// Canonical name: PidTagAddressBookExtensionAttribute15
    /// Description: Contains custom values defined and populated by the organization that modified the
    /// display templates.
    /// Property ID: 0x8C61
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.34
    /// Alternate names: PR_EMS_AB_EXTENSION_ATTRIBUTE_15,
    /// PR_EMS_AB_EXTENSION_ATTRIBUTE_15_A, PR_EMS_AB_EXTENSION_ATTRIBUTE_15_W
    case tagAddressBookExtensionAttribute15 = 0x8C61

    // case unknown0x8C62 = 0x8C62

    // case unknown0x8069 = 0x8069

    /// [MS-OXPROPS] 2.513 PidTagAddressBookDeliveryContentLength
    /// Canonical name: PidTagAddressBookDeliveryContentLength
    /// Description: Specifies the maximum size, in bytes, of a message that a recipient can receive.
    /// Property ID: 0x806A
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.27
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DELIV_CONT_LENGTH
    case tagAddressBookDeliveryContentLength = 0x806A

    // case unknown0x806B = 0x806B

    // case unknown0x8072 = 0x8072

    /// [MS-OXPROPS] 2.518 PidTagAddressBookDistributionListMemberSubmitAccepted
    /// Canonical name: PidTagAddressBookDistributionListMemberSubmitAccepted
    /// Description: Indicates that delivery restrictions exist for a recipient.
    /// Property ID: 0x8073
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.44
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DL_MEM_SUBMIT_PERMS_BL_O
    case tagAddressBookDistributionListMemberSubmitAccepted = 0x8073

    // case unknown0x8074 = 0x8074

    // case unknown0x816F = 0x816F

    /// [MS-OXPROPS] 2.553 PidTagAddressBookNetworkAddress
    /// Canonical name: PidTagAddressBookNetworkAddress
    /// Description: Contains a list of names by which a server is known to the various transports in use by
    /// the network.
    /// Property ID: 0x8170
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.38
    /// Alternate names: PR_EMS_AB_NETWORK_ADDRESS, PR_EMS_AB_NETWORK_ADDRESS_A,
    /// PR_EMS_AB_NETWORK_ADDRESS_W
    case tagAddressBookNetworkAddress = 0x8170

    // case unknown0x8171 = 0x8171

    // case unknown0x8C69 = 0x8C69

    /// [MS-OXPROPS] 2.575 PidTagAddressBookX509Certificate
    /// Canonical name: PidTagAddressBookX509Certificate
    /// Description: Contains the ASN_1 DER encoded X.509 certificates for the mail user.
    /// Property ID: 0x8C6A
    /// Data type: PtypMultipleBinary, 0x1102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.35
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_X509_CERT
    case tagAddressBookX509Certificate = 0x8C6A

    // case unknown0x8C6B = 0x8C6B

    // case unknown0x8C6C = 0x8C6C

    /// [MS-OXPROPS] 2.555 PidTagAddressBookObjectGuid
    /// Canonical name: PidTagAddressBookObjectGuid
    /// Description: Contains a GUID that identifies an Address Book object.
    /// Property ID: 0x8C6D
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.25
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_OBJECT_GUID
    case tagAddressBookObjectGuid = 0x8C6D

    // case unknown0x8C8E = 0x8C8E

    /// [MS-OXPROPS] 2.563 PidTagAddressBookPhoneticGivenName
    /// Canonical name: PidTagAddressBookPhoneticGivenName
    /// Description: Contains the phonetic representation of the PidTagGivenName property (section
    /// 2.714).
    /// Property ID: 0x8C8E
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.10
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_PHONETIC_GIVEN_NAME, PR_EMS_AB_PHONETIC_GIVEN_NAME_A,
    /// PR_EMS_AB_PHONETIC_GIVEN_NAME_W
    case tagAddressBookPhoneticGivenName = 0x8C8E

    /// [MS-OXPROPS] 2.564 PidTagAddressBookPhoneticSurname
    /// Canonical name: PidTagAddressBookPhoneticSurname
    /// Description: Contains the phonetic representation of the PidTagSurname property (section 2.1036).
    /// Property ID: 0x8C8F
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.11
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_PHONETIC_SURNAME, PR_EMS_AB_PHONETIC_SURNAME_A,
    /// PR_EMS_AB_PHONETIC_SURNAME_W
    case tagAddressBookPhoneticSurname = 0x8C8F

    /// [MS-OXPROPS] 2.561 PidTagAddressBookPhoneticDepartmentName
    /// Canonical name: PidTagAddressBookPhoneticDepartmentName
    /// Description: Contains the phonetic representation of the PidTagDepartmentName property
    /// (section 2.672).
    /// Property ID: 0x8C90
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.13
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_PHONETIC_DEPARTMENT_NAME,
    /// PR_EMS_AB_PHONETIC_DEPARTMENT_NAME_A, PR_EMS_AB_PHONETIC_DEPARTMENT_NAME_W
    case tagAddressBookPhoneticDepartmentName = 0x8C90

    /// [MS-OXPROPS] 2.560 PidTagAddressBookPhoneticCompanyName
    /// Canonical name: PidTagAddressBookPhoneticCompanyName
    /// Description: Contains the phonetic representation of the PidTagCompanyName property (section
    /// 2.639).
    /// Property ID: 0x8C91
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.12
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_PHONETIC_COMPANY_NAME,
    /// PR_EMS_AB_PHONETIC_COMPANY_NAME_A, PR_EMS_AB_PHONETIC_COMPANY_NAME_W
    case tagAddressBookPhoneticCompanyName = 0x8C91

    /// [MS-OXPROPS] 2.562 PidTagAddressBookPhoneticDisplayName
    /// Canonical name: PidTagAddressBookPhoneticDisplayName
    /// Description: Contains the phonetic representation of the PidTagDisplayName property (section
    /// 2.676).
    /// Property ID: 0x8C92
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.9
    /// Consuming references: [MS-OXNSPI], [MS-OXOAB]
    case tagAddressBookPhoneticDisplayName = 0x8C92

    /// [MS-OXPROPS] 2.515 PidTagAddressBookDisplayTypeExtended
    /// Canonical name: PidTagAddressBookDisplayTypeExtended
    /// Description: Contains a value that indicates how to display an Address Book object in a table or as
    /// a recipient on a message.
    /// Property ID: 0x8C93
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.35
    /// Alternate names: PR_EMS_AB_DISPLAY_TYPE_EX
    case tagAddressBookDisplayTypeExtended = 0x8C93

    /// [MS-OXPROPS] 2.543 PidTagAddressBookHierarchicalShowInDepartments
    /// Canonical name: PidTagAddressBookHierarchicalShowInDepartments
    /// Description: Lists all Department objects of which the mail user is a member.
    /// Property ID: 0x8C94
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.5.6
    /// Alternate names: PR_EMS_AB_HAB_SHOW_IN_DEPARTMENTS
    case tagAddressBookHierarchicalShowInDepartments = 0x8C94

    // case unknown0x8C95 = 0x8C95

    /// [MS-OXPROPS] 2.569 PidTagAddressBookRoomContainers
    /// Canonical name: PidTagAddressBookRoomContainers
    /// Description: Contains a list of DNs that represent the address book containers that hold
    /// Resource objects, such as conference rooms and equipment.
    /// Property ID: 0x8C96
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.7.1
    /// Alternate names: PR_EMS_AB_ROOM_CONTAINERS, PR_EMS_AB_ROOM_CONTAINERS_A,
    /// PR_EMS_AB_ROOM_CONTAINERS_W
    case tagAddressBookRoomContainers = 0x8C96

    /// [MS-OXPROPS] 2.539 PidTagAddressBookHierarchicalDepartmentMembers
    /// Canonical name: PidTagAddressBookHierarchicalDepartmentMembers
    /// Description: Contains all of the mail users that belong to this department.
    /// Property ID: 0x8C97
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.8.3
    /// Alternate names: PR_EMS_AB_HAB_DEPARTMENT_MEMBERS
    case tagAddressBookHierarchicalDepartmentMembers = 0x8C97

    /// [MS-OXPROPS] 2.542 PidTagAddressBookHierarchicalRootDepartment
    /// Canonical name: PidTagAddressBookHierarchicalRootDepartment
    /// Description: Contains the distinguished name (DN) of either the root Department object or the
    /// root departmental group in the department hierarchy for the organization.
    /// Property ID: 0x8C98
    /// Data type: PtypString8, 0x001E
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.7.2
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_HAB_ROOT_DEPARTMENT
    case tagAddressBookHierarchicalRootDepartment = 0x8C98

    /// [MS-OXPROPS] 2.541 PidTagAddressBookHierarchicalParentDepartment
    /// Canonical name: PidTagAddressBookHierarchicalParentDepartment
    /// Description: Contains all of the departments to which this department is a child.
    /// Property ID: 0x8C99
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.8.2
    /// Alternate names: PR_EMS_AB_HAB_PARENT_DEPARTMENT
    case tagAddressBookHierarchicalParentDepartment = 0x8C99

    /// [MS-OXPROPS] 2.538 PidTagAddressBookHierarchicalChildDepartments
    /// Canonical name: PidTagAddressBookHierarchicalChildDepartments
    /// Description: Contains the child departments in a hierarchy of departments.
    /// Property ID: 0x8C9A
    /// Data type: PtypEmbeddedTable, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.8.1
    /// Alternate names: PR_EMS_AB_HAB_CHILD_DEPARTMENTS
    case tagAddressBookHierarchicalChildDepartments = 0x8C9A

    // case unknown0x8C9B = 0x8C9B

    // case unknown0x8C9C = 0x8C9C

    // case unknown0x8C9D = 0x8C9D

    /// [MS-OXPROPS] 2.1045 PidTagThumbnailPhoto
    /// Canonical name: PidTagThumbnailPhoto
    /// Description: Contains the mail user's photo in .jpg format.
    /// Property ID: 0x8C9E
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.40
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_THUMBNAIL_PHOTO
    case tagThumbnailPhoto = 0x8C9E

    // case unknown0x8C9F = 0x8C9F

    /// [MS-OXPROPS] 2.572 PidTagAddressBookSeniorityIndex
    /// Canonical name: PidTagAddressBookSeniorityIndex
    /// Description: Contains a signed integer that specifies the seniority order of Address Book objects
    /// that represent members of a department and are referenced by a Department object or
    /// departmental group, with larger values specifying members that are more senior.
    /// Property ID: 0x8CA0
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.24
    case tagAddressBookSeniorityIndex = 0x8CA0

    // case unknown0x8CA1 = 0x8CA1

    // case unknown0x8CA2 = 0x8CA2

    // case unknown0x8CA3 = 0x8CA3

    // case unknown0x8CA4 = 0x8CA4

    // case unknown0x8CA5 = 0x8CA5

    // case unknown0x8CA6 = 0x8CA6

    // case unknown0x8CA7 = 0x8CA7

    /// [MS-OXPROPS] 2.556 PidTagAddressBookOrganizationalUnitRootDistinguishedName
    /// Canonical name: PidTagAddressBookOrganizationalUnitRootDistinguishedName
    /// Description: Contains the DN of the Organization object of the mail user's organization.
    /// Property ID: 0x8CA8
    /// Data type: PtypString, 0x001F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.39
    /// Alternate names: PR_EMS_AB_ORG_UNIT_ROOT_DN, msExchOURoot
    case tagAddressBookOrganizationalUnitRootDistinguishedName = 0x8CA8

    // case unknown0x8CA9 = 0x8CA9

    // case unknown0x8CAB = 0x8CAB

    /// [MS-OXPROPS] 2.571 PidTagAddressBookSenderHintTranslations
    /// Canonical name: PidTagAddressBookSenderHintTranslations
    /// Description: Contains the locale ID and translations of the default mail tip.
    /// Property ID: 0x8CAC
    /// Data type: PtypMultipleString, 0x101F
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.26
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DL_SENDER_HINT_TRANSLATIONS_W
    case tagAddressBookSenderHintTranslations = 0x8CAC

    // case unknown0x8CAD = 0x8CAD

    // case unknown0x8CB4 = 0x8CB4

    /// [MS-OXPROPS] 2.552 PidTagAddressBookModerationEnabled
    /// Canonical name: PidTagAddressBookModerationEnabled
    /// Description: Indicates whether moderation is enabled for the mail user or distribution list.
    /// Property ID: 0x8CB5
    /// Data type: PtypBoolean, 0x000B
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.28
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_ENABLE_MODERATION
    case tagAddressBookModerationEnabled = 0x8CB5

    // case unknown0x8CB6 = 0x8CB6

    // case unknown0x8CC1 = 0x8CC1

    /// [MS-OXPROPS] 2.1023 PidTagSpokenName
    /// Canonical name: PidTagSpokenName
    /// Description: Contains a recording of the mail user's name pronunciation.
    /// Property ID: 0x8CC2
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.41
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_UM_SPOKEN_NAME
    case tagSpokenName = 0x8CC2

    // case unknown0x8CC3 = 0x8CC3

    // case unknown0x8CD7 = 0x8CD7

    /// [MS-OXPROPS] 2.511 PidTagAddressBookAuthorizedSenders
    /// Canonical name: PidTagAddressBookAuthorizedSenders
    /// Description: Indicates whether delivery restrictions exist for a recipient.
    /// Property ID: 0x8CD8
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.42
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_AUTH_ORIG
    case tagAddressBookAuthorizedSenders = 0x8CD8

    /// [MS-OXPROPS] 2.574 PidTagAddressBookUnauthorizedSenders
    /// Canonical name: PidTagAddressBookUnauthorizedSenders
    /// Description: Indicates whether delivery restrictions exist for a recipient.
    /// Property ID: 0x8CD9
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.43
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_UNAUTH_ORIG
    case tagAddressBookUnauthorizedSenders = 0x8CD9

    /// [MS-OXPROPS] 2.519 PidTagAddressBookDistributionListMemberSubmitRejected
    /// Canonical name: PidTagAddressBookDistributionListMemberSubmitRejected
    /// Description: Indicates that delivery restrictions exist for a recipient.
    /// Property ID: 0x8CDA
    /// Data type: PtypObject, 0x000D
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.4.45
    /// Consuming references: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DL_MEM_SUBMIT_PERMS
    case tagAddressBookDistributionListMemberSubmitRejected = 0x8CDA

    /// [MS-OXPROPS] 2.520 PidTagAddressBookDistributionListRejectMessagesFromDLMembers
    /// Canonical name: PidTagAddressBookDistributionListRejectMessagesFromDLMembers
    /// Description: Indicates that delivery restrictions exist for a recipient.
    /// Property ID: 0x8CDB
    /// Data type: PtypObject, 0x000D
    /// Area: Address book
    /// Defining reference: [MS-OXOAB] section 2.9.2.2
    /// Alternate names: PR_EMS_AB_DL_MEM_REJECT_PERMS
    case tagAddressBookDistributionListRejectMessagesFromDLMembers = 0x8CDB

    // case unknown0x8CDC = 0x8CDC

    /// [MS-OXPROPS] 2.540 PidTagAddressBookHierarchicalIsHierarchicalGroup
    /// Canonical name: PidTagAddressBookHierarchicalIsHierarchicalGroup
    /// Description: Indicates whether the distribution list represents a departmental group.
    /// Property ID: 0x8CDD
    /// Data type: PtypBoolean, 0x000B
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.6.5
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_HAB_IS_HIERARCHICAL_GROUP, PR_EMS_AB_IS_ORGANIZATIONAL
    case tagAddressBookHierarchicalIsHierarchicalGroup = 0x8CDD

    // case unknown0x8CDE = 0x8CDE

    // case unknown0x8CDF = 0x8CDF

    // case unknown0x8CDE = 0x8CE0

    // case unknown0x8CE1 = 0x8CE1

    /// [MS-OXPROPS] 2.517 PidTagAddressBookDistributionListMemberCount
    /// Canonical name: PidTagAddressBookDistributionListMemberCount
    /// Description: Contains the total number of recipients in the distribution list.
    /// Property ID: 0x8CE2
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.3.29
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DL_TOTAL_MEMBER_COUNT
    case tagAddressBookDistributionListMemberCount = 0x8CE2

    /// [MS-OXPROPS] 2.516 PidTagAddressBookDistributionListExternalMemberCount
    /// Canonical name: PidTagAddressBookDistributionListExternalMemberCount
    /// Description: Contains the number of external recipients in the distribution list.
    /// Property ID: 0x8CE3
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference:[MS-OXOABK] section 2.2.3.30
    /// Consuming reference: [MS-OXOAB]
    /// Alternate names: PR_EMS_AB_DL_EXTERNAL_MEMBER_COUNT
    case tagAddressBookDistributionListExternalMemberCount = 0x8CE3

    // case unknown0x8CE4 = 0x8CE4

    // case unknown0xFFFA = 0xFFFA

    /// [MS-OXPROPS] 2.545 PidTagAddressBookIsMaster
    /// Canonical name: PidTagAddressBookIsMaster
    /// Description: Contains a Boolean value of TRUE if it is possible to create Address Book objects in
    /// that container, and FALSE otherwise.
    /// Property ID: 0xFFFB
    /// Data type: PtypBoolean, 0x000B
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.2.4
    /// Consuming reference: [MS-OXNSPI]
    /// Alternate names: PR_EMS_AB_IS_MASTER
    case tagAddressBookIsMaster = 0xFFFB

    /// [MS-OXPROPS] 2.559 PidTagAddressBookParentEntryId
    /// Canonical name: PidTagAddressBookParentEntryId
    /// Description: Contains the EntryID of the parent container in a hierarchy of address book
    /// containers.
    /// Property ID: 0xFFFC
    /// Data type: PtypBinary, 0x0102
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.2.5
    /// Consuming reference: [MS-OXNSPI]
    /// Alternate names: PR_EMS_AB_PARENT_ENTRYID
    case tagAddressBookParentEntryId = 0xFFFC

    /// [MS-OXPROPS] 2.512 PidTagAddressBookContainerId
    /// Canonical name: PidTagAddressBookContainerId
    /// Description: Contains the ID of a container on an NSPI server.
    /// Property ID: 0xFFFD
    /// Data type: PtypInteger32, 0x0003
    /// Area: Address Book
    /// Defining reference: [MS-OXOABK] section 2.2.2.3
    /// Consuming references: [MS-OXNSPI]
    /// Alternate names: PR_EMS_AB_CONTAINERID
    case tagAddressBookContainerId = 0xFFFD
}
