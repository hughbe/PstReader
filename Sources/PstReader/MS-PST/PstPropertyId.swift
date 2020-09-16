//
//  PstPropertyId.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import Foundation

internal enum PstPropertyId: UInt16 {
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketCount 0x0001 PtypInteger32
    case tagNameidBucketCount = 0x0001
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamGuid 0x0002 PtypBinary
    case tagNameidStreamGuid = 0x0002
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamEntry 0x0003 PtypBinary
    case tagNameidStreamEntry = 0x0003
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidStreamString 0x0004 PtypBinary
    case tagNameidStreamString = 0x0004
    
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
    /// 0x0017 PtypInteger32 PidTagImportance Importance Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0017 PtypInteger32 PidTagImportance Importance
    case tagImportance = 0x0017
    
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
    /// 0x001A PtypString PidTagMessageClassW Message class. This property has an alternate name of PidTagMessageClass_W. Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x001A PtypString PidTagMessageClass Message class. And it has an alternate name PidTagMessageClass_W. Y
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x001A PtypString PidTagMessageClass Message class. And it has an alternate name PidTagMessageClassW.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x001A PtypString PidTagMessageClassW Message class. This property has an alternate name of PidTagMessageClass_W.
    case tagMessageClass = 0x001A
    
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
    /// 0x0036 PtypInteger32 PidTagSensitivity Sensitivity Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0036 PtypInteger32 PidTagSensitivity Sensitivity
    case tagSensitivity = 0x0036
    
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
    /// 0x0037 PtypString PidTagSubjectW Subject. This property has an alternate name ofPidTagSubject_W. Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0037 PtypString PidTagSubjectW Subject. This property has an alternate name of PidTagSubject_W.
    case tagSubjectW = 0x0037
    
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
    /// 0x0039 PtypTime PidTagClientSubmitTime Submit timestamp Y
    case tagClientSubmitTime = 0x0039
    
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
    /// 0x0042 PtypString PidTagSentRepresentingNameW Sender representative name. This property has an alternate name of PidTagSentRepresentingName_W. Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0042 PtypString PidTagSentRepresentingNameW Sender representative name. This property has an alternate name of PidTagSentRepresentingName_W.
    case tagSentRepresentingName = 0x0042
    
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
    /// 0x0057 PtypBoolean PidTagMessageToMe Whether recipient is in To: line Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0057 PtypBoolean PidTagMessageToMe Whether recipient is in the To: line
    case tagMessageToMe = 0x0057
    
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
    /// 0x0058 PtypBoolean PidTagMessageCcMe Whether recipient is in Cc: line Y
    case tagMessageCcMe = 0x0058
    
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
    /// 0x0070 PtypString PidTagConversationTopicW Conversation topic. This property has an alternate name of PidTagConversationTopic_W. Y
    case tagConversationTopicW = 0x0070
    
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
    /// 0x0071 PtypBinary PidTagConversationIndex Conversation index Y
    case tagConversationIndex = 0x0071
    
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
    /// 0x0c15 PtypInteger32 PidTagRecipientType Type of recipient.
    case tagRecipientType = 0x0C15
    
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
    /// 0x0E03 PtypString PidTagDisplayCcW Cc: line. This property has an alternate name of PidTagDisplayCc_W. Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E03 PtypString PidTagDisplayCcW Cc: line. This property has an alternate name of PidTagDisplayCc_W.
    case tagDisplayCc = 0x0E03
    
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
    /// 0x0E04 PtypString PidTagDisplayToW To: line. This property has an alternate name of PidTagDisplayTo_W. Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E04 PtypString PidTagDisplayToW To: line. This property has an alternate name of PidTagDisplayTo_W.
    case tagDisplayTo = 0x0E04
    
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E05 PtypString PidTagParentDisplayW Parent Display name. This property has an alternate name of PidTagParentDisplay_W.
    case tagParentDisplay = 0x0E05
    
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
    /// 0x0E06 PtypTime PidTagMessageDeliveryTime Message delivery timestamp Y
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E06 PtypTime PidTagMessageDeliveryTime Message delivery timestamp
    case tagMessageDeliveryTime = 0x0E06
    
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
    /// 0x0E07 PtypInteger32 PidTagMessageFlags Message flags Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x0E07 PtypInteger32 PidTagMessageFlags Message flags. Y
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x0E07 PtypInteger32 PidTagMessageFlags Message flags.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E07 PtypInteger32 PidTagMessageFlags Message flags
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E07 PtypInteger32 PidTagMessageFlags Message flags
    case tagMessageFlags = 0x0E07
    
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
    /// 0x0E08 PtypInteger32 PidTagMessageSize Message size Y
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x0E08 PtypInteger32 PidTagMessageSize Message size
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E08 PtypInteger32 PidTagMessageSize Message size
    case tagMessageSize = 0x0E08
    
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
    /// 0x0E0F PtypBoolean PidTagResponsibility Handling Responsibility.
    case tagResponsibility = 0x0E0F
    
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
    /// 0x0E17 PtypInteger32 PidTagMessageStatus Message status Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x0E17 PtypInteger32 PidTagMessageStatus Message status. Y
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x0E17 PtypInteger32 PidTagMessageStatus Message status.
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E17 PtypInteger32 PidTagMessageStatus Message status
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E17 PtypInteger32 PidTagMessageStatus Message status
    case tagMessageStatus = 0x0E17
    
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
    /// 0x0E20 PtypInteger32 PidTagAttachmentSize Size of Attachment object.
    /// [MS-PST] 2.4.6.2 Attachment Object PC
    /// An Attachment object PC is a subnode with an NID_TYPE of NID_TYPE_ATTACHMENT, which
    /// contains all the information about an Attachment object. Because of the size of most Attachment
    /// objects being quite large, the binary data of the Attachment objects are stored in the subnode of the
    /// Attachment object node (which is itself a subnode of the Message object node), and often, a data
    /// tree is used to store the binary content. The number of Attachment object subnodes in a Message
    /// object MUST equal the number of rows in the Attachment Table.
    /// [MS-PST] 2.4.6.2.1 Property Schema of an Attachment Object PC
    /// The basic property schema of a general Message object is specified in [MS-OXCMSG] and [MSOXPROPS]. From the PST perspective, the following properties MUST be present in any valid
    /// Attachment object PC.
    /// 0x0E20 PtypInteger32 PidTagAttachmentSize Size of Attachment object.
    case tagAttachmentSize = 0x0E20

    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x0E2A PtypBoolean PidTagExchangeRemoteHeader Has Exchange Remote Header
    case tagExchangeRemoteHeader = 0x0E2A

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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E30 PtypInteger32 PidTagReplItemid Replication Item ID. N
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
    /// 0x0E30 PtypInteger32 PidTagReplItemid Replication item ID Y
    case tagReplItemid = 0x0E30
    
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E33 PtypInteger64 PidTagReplChangenum Replication Change Number. N
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
    /// 0x0E33 PtypInteger64 PidTagReplChangenum Replication change number Y
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication Version History. N
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
    /// 0x0E34 PtypBinary PidTagReplVersionHistory Replication version history Y
    case tagReplVersionHistory = 0x0E34
    
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x0E38 PtypInteger32 PidTagReplFlags Replication flags. Y
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
    /// 0x0E38 PtypInteger32 PidTagReplFlags Replication flags Y
    case tagReplFlags = 0x0E38
    
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
    
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x0FF9 PtypBinary PidTagRecordKey Record key. This is the Provider UID of this PST.
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
    /// 0x0FF9 PtypBinary PidTagRecordKey Record Key.
    case tagRecordKey = 0x0FF9
    
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
    /// 0x0FFE PtypInteger32 PidTagObjectType Recipient Object type.
    case tagObjectType = 0x0FFE
    
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
    /// 0x0FFF PtypBinary PidTagEntryID EntryID of the recipient.
    case tagEntryID = 0x0FFF
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagNameidBucketBase 0x1000 PtypBinary
    case tagNameidBucketBase = 0x1000
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagItemTemporaryFlags 0x1097 PtypInteger32
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
    /// 0x1097 PtypInteger32 PidTagItemTemporaryFlags Temporary flags Y
    case tagItemTemporaryFlags = 0x1097
    
    /// [MS-PST] 2.4.3 Message Store
    /// At the PST level, the message store is the root of the PST, which is the rough equivalent of the top
    /// of a Mailbox. The message store contains the top-level PST settings and metadata that are required to
    /// access and manage the PST contents.
    /// At the LTP Level, the message store is implemented as a regular PC. At the NDB Layer, the message
    /// store is identified with a special internal NID value of NID_MESSAGE_STORE (0x21) (see section
    /// 2.4.1). Any valid PST MUST have exactly one message store node.
    /// [MS-PST] 2.4.3.1 Minimum Set of Required Properties
    /// The following properties MUST be present in any valid message store PC.
    /// 0x3001 PtypString PidTagDisplayName Display name of PST
    /// [MS-PST] 2.4.4 Folders
    /// Folder objects are hierarchical containers that are used to create a storage hierarchy for the
    /// message store. In the PST architecture, a single root Folder object exists at the top of the message
    /// store, from which an arbitrarily complex hierarchy of Folder objects descends to provide structured
    /// storage for all the Messaging objects.
    /// At the LTP level, a Folder object is a composite entity that is represented using four LTP constructs.
    /// Specifically, each Folder object consists of one PC, which contains the properties directly associated
    /// with the Folder object, and three TCs for information about the contents, hierarchy and other
    /// associated information of the Folder object. Some Folder objects MAY have additional nodes that
    /// pertain to Search, which is discussed in section 2.4.8.6.
    /// At the NDB level, the 4 LTP constructs are persisted as 4 separate top-level nodes (that is, 4 different
    /// NIDs). For identification purposes, the nidIndex portion for each of the NIDs is the same to indicate
    /// that these nodes collectively make up a Folder object. However, each of the 4 NIDs has a different
    /// nidType value to differentiate their respective function. The following diagram indicates the
    /// relationships among these elements.
    /// The following sections explain the structure and function of each of the 4 composite elements of a
    /// Folder object,
    /// [MS-PST] 2.4.4.1 Folder object PC
    /// The Folder object PC is a PC that contains the immediate properties of the Folder object. The NID of
    /// a Folder object PC MUST have an NID_TYPE of NID_TYPE_NORMAL_FOLDER.
    /// [MS-PST] 2.4.4.1.1 Property Schema of a Folder object PC
    /// The default property schema of a Folder object is specified in [MS-OXCFOLD] and [MS-OXPROPS].
    /// However, the following properties MUST be present in any valid Folder object PC.
    /// 0x3001 PtypString PidTagDisplayName Display name of the Folder object.
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x3001 PtypString PidTagDisplayName Display name of sub-Folder object. This property has an alternate name of PidTagDisplayName_W. Y
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x3001 PtypString PidTagDisplayName Display name. And it has an alternate name PidTagDisplayName_W. Y
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
    /// 0x3001 PtypString PidTagDisplayName Display name of the recipient.  And it has an alternate name PidTagDisplayName_W.
    case tagDisplayName = 0x3001

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
    /// 0x3002 PtypString PidTagAddressType Type of recipient address.
    case tagAddressType = 0x3002
    
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
    /// 0x3003 PtypString PidTagEmailAddress E-mail address of recipient.
    case tagEmailAddress = 0x3003
    
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x3007 PtypTime PidTagCreationTime Creation time.
    case tagCreationTime = 0x3007
    
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
    /// 0x3008 PtypTime PidTagLastModificationTime Last modification time of Message object Y
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x3008 PtypTime PidTagLastModificationTime Last modification time
    /// [MS-PST] 2.4.8.6.2 Search Folder Object Contents Table (SFCT)
    /// The Search Folder Object Contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_SEARCH_CONTENTS_TABLE. Its function is to list the Search Message objects in the
    /// Folder object, which are Message objects that match the search Folder object's search criteria.
    /// [MS-PST] 2.4.8.6.2.1 Search Folder Contents Table Template
    /// Each PST MUST have one search folder contents table template, which is identified with an NID value
    /// of NID_SEARCH_CONTENTS_TABLE_TEMPLATE (0x610). The search contents table template MUST
    /// have no data rows, and MUST contain the following property columns.
    /// 0x3008 PtypTime PidTagLastModificationTime Last modification time of Message object
    case tagLastModificationTime = 0x3008
    
    /// [MS-PST] 2.4.5.1 Message Object PC
    /// The Message object PC is a standard Property Context structure that contains the properties
    /// associated with the Message object. Message object PC nodes are identified with an NID_TYPE of
    /// NID_TYPE_NORMAL_MESSAGE.
    /// [MS-PST] 2.4.5.1.1 Property Schema of a Message Object PC
    /// Message objects have a rather complicated set of schemas and are out of the scope of discussion of
    /// this document. However, the basic property schema of a general Message object is specified in [MSOXCMSG], [MS-OXOMSG] and [MS-OXPROPS]. From the PST perspective, the following properties
    /// MUST be present in any valid Message object PC.
    /// 0x300B PtypBinary PidTagSearchKey Message Search Key.
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
    /// 0x300B PtypBinary PidTagSearchKey Search Key.
    case tagSearchKey = 0x300B
    
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
    /// 0x3704 PtypString PidTagAttachFilenameW File name of Attachment object.
    case tagAttachFilename = 0x3704
    
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
    /// 0x3705 PtypInteger32 PidTagAttachMethod Attachment method.
    /// [MS-PST] 2.4.6.2 Attachment Object PC
    /// An Attachment object PC is a subnode with an NID_TYPE of NID_TYPE_ATTACHMENT, which
    /// contains all the information about an Attachment object. Because of the size of most Attachment
    /// objects being quite large, the binary data of the Attachment objects are stored in the subnode of the
    /// Attachment object node (which is itself a subnode of the Message object node), and often, a data
    /// tree is used to store the binary content. The number of Attachment object subnodes in a Message
    /// object MUST equal the number of rows in the Attachment Table.
    /// [MS-PST] 2.4.6.2.1 Property Schema of an Attachment Object PC
    /// The basic property schema of a general Message object is specified in [MS-OXCMSG] and [MSOXPROPS]. From the PST perspective, the following properties MUST be present in any valid
    /// Attachment object PC.
    /// 0x3705 PtypInteger32 PidTagAttachMethod Attachment method.
    case tagAttachMethod = 0x3705
    
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
    /// 0x370B PtypInteger32 PidTagRenderingPosition Rendering position of Attachment object.
    /// [MS-PST] 2.4.6.2 Attachment Object PC
    /// An Attachment object PC is a subnode with an NID_TYPE of NID_TYPE_ATTACHMENT, which
    /// contains all the information about an Attachment object. Because of the size of most Attachment
    /// objects being quite large, the binary data of the Attachment objects are stored in the subnode of the
    /// Attachment object node (which is itself a subnode of the Message object node), and often, a data
    /// tree is used to store the binary content. The number of Attachment object subnodes in a Message
    /// object MUST equal the number of rows in the Attachment Table.
    /// [MS-PST] 2.4.6.2.1 Property Schema of an Attachment Object PC
    /// The basic property schema of a general Message object is specified in [MS-OXCMSG] and [MSOXPROPS]. From the PST perspective, the following properties MUST be present in any valid
    /// Attachment object PC.
    /// 0x370B PtypInteger32 PidTagRenderingPosition Rendering position of Attachment object.
    case tagRenderingPosition = 0x370A
    
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
    /// 0x65C6 PtypInteger32 PidTagSecureSubmitFlags Secure submit flags Y
    case tagSecureSubmitFlags = 0x65C6
    
    /// [MS-PST] 2.4.4 Folders
    /// Folder objects are hierarchical containers that are used to create a storage hierarchy for the
    /// message store. In the PST architecture, a single root Folder object exists at the top of the message
    /// store, from which an arbitrarily complex hierarchy of Folder objects descends to provide structured
    /// storage for all the Messaging objects.
    /// At the LTP level, a Folder object is a composite entity that is represented using four LTP constructs.
    /// Specifically, each Folder object consists of one PC, which contains the properties directly associated
    /// with the Folder object, and three TCs for information about the contents, hierarchy and other
    /// associated information of the Folder object. Some Folder objects MAY have additional nodes that
    /// pertain to Search, which is discussed in section 2.4.8.6.
    /// At the NDB level, the 4 LTP constructs are persisted as 4 separate top-level nodes (that is, 4 different
    /// NIDs). For identification purposes, the nidIndex portion for each of the NIDs is the same to indicate
    /// that these nodes collectively make up a Folder object. However, each of the 4 NIDs has a different
    /// nidType value to differentiate their respective function. The following diagram indicates the
    /// relationships among these elements.
    /// The following sections explain the structure and function of each of the 4 composite elements of a
    /// Folder object,
    /// [MS-PST] 2.4.4.1 Folder object PC
    /// The Folder object PC is a PC that contains the immediate properties of the Folder object. The NID of
    /// a Folder object PC MUST have an NID_TYPE of NID_TYPE_NORMAL_FOLDER.
    /// [MS-PST] 2.4.4.1.1 Property Schema of a Folder object PC
    /// The default property schema of a Folder object is specified in [MS-OXCFOLD] and [MS-OXPROPS].
    /// However, the following properties MUST be present in any valid Folder object PC.
    /// 0x3602 PtypInteger32 PidTagContentCount Total number of items in the Folder
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x3602 PtypInteger32 PidTagContentCount Total number of items in the Folder object. Y
    case tagContentCount = 0x3602
    
    /// [MS-PST] 2.4.4 Folders
    /// Folder objects are hierarchical containers that are used to create a storage hierarchy for the
    /// message store. In the PST architecture, a single root Folder object exists at the top of the message
    /// store, from which an arbitrarily complex hierarchy of Folder objects descends to provide structured
    /// storage for all the Messaging objects.
    /// At the LTP level, a Folder object is a composite entity that is represented using four LTP constructs.
    /// Specifically, each Folder object consists of one PC, which contains the properties directly associated
    /// with the Folder object, and three TCs for information about the contents, hierarchy and other
    /// associated information of the Folder object. Some Folder objects MAY have additional nodes that
    /// pertain to Search, which is discussed in section 2.4.8.6.
    /// At the NDB level, the 4 LTP constructs are persisted as 4 separate top-level nodes (that is, 4 different
    /// NIDs). For identification purposes, the nidIndex portion for each of the NIDs is the same to indicate
    /// that these nodes collectively make up a Folder object. However, each of the 4 NIDs has a different
    /// nidType value to differentiate their respective function. The following diagram indicates the
    /// relationships among these elements.
    /// The following sections explain the structure and function of each of the 4 composite elements of a
    /// Folder object,
    /// [MS-PST] 2.4.4.1 Folder object PC
    /// The Folder object PC is a PC that contains the immediate properties of the Folder object. The NID of
    /// a Folder object PC MUST have an NID_TYPE of NID_TYPE_NORMAL_FOLDER.
    /// [MS-PST] 2.4.4.1.1 Property Schema of a Folder object PC
    /// The default property schema of a Folder object is specified in [MS-OXCFOLD] and [MS-OXPROPS].
    /// However, the following properties MUST be present in any valid Folder object PC.
    /// 0x3603 PtypInteger32 PidTagContentUnreadCount Number of unread items in the Folder object.
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x3603 PtypInteger32 PidTagContentUnreadCount Number of unread items in the Folder object. Y
    case tagContentUnreadCount = 0x3603
    
    /// [MS-PST] 2.4.4 Folders
    /// Folder objects are hierarchical containers that are used to create a storage hierarchy for the
    /// message store. In the PST architecture, a single root Folder object exists at the top of the message
    /// store, from which an arbitrarily complex hierarchy of Folder objects descends to provide structured
    /// storage for all the Messaging objects.
    /// At the LTP level, a Folder object is a composite entity that is represented using four LTP constructs.
    /// Specifically, each Folder object consists of one PC, which contains the properties directly associated
    /// with the Folder object, and three TCs for information about the contents, hierarchy and other
    /// associated information of the Folder object. Some Folder objects MAY have additional nodes that
    /// pertain to Search, which is discussed in section 2.4.8.6.
    /// At the NDB level, the 4 LTP constructs are persisted as 4 separate top-level nodes (that is, 4 different
    /// NIDs). For identification purposes, the nidIndex portion for each of the NIDs is the same to indicate
    /// that these nodes collectively make up a Folder object. However, each of the 4 NIDs has a different
    /// nidType value to differentiate their respective function. The following diagram indicates the
    /// relationships among these elements.
    /// The following sections explain the structure and function of each of the 4 composite elements of a
    /// Folder object,
    /// [MS-PST] 2.4.4.1 Folder object PC
    /// The Folder object PC is a PC that contains the immediate properties of the Folder object. The NID of
    /// a Folder object PC MUST have an NID_TYPE of NID_TYPE_NORMAL_FOLDER.
    /// [MS-PST] 2.4.4.1.1 Property Schema of a Folder object PC
    /// The default property schema of a Folder object is specified in [MS-OXCFOLD] and [MS-OXPROPS].
    /// However, the following properties MUST be present in any valid Folder object PC.
    /// 0x360A PtypBoolean PidTagSubfolders Whether the Folder object has any sub-Folder objects.
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x360A PtypBoolean PidTagSubfolders Whether the Folder object has any sub-Folder objects. Y
    case tagSubfolders = 0x360A
    
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
    /// 0x3613 PtypBinary PidTagContainerClass Container class of the sub-Folder object alternate name of PidTagContainerClass_W. This property has an Y
    case tagContainerClass = 0x3613

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
    /// 0x3900 PtypInteger32 PidTagDisplayType Display type.
    case tagDisplayType = 0x3900
    
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
    /// 0x39FF PtypString PidTag7BitDisplayName 7-bit Display name.
    case tag7BitDisplayName = 0x39FF
    
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
    /// 0x3A40 PtypBoolean PidTagSendRichInfo Send Rich info for recipient.
    case tagSendRichInfo = 0x3A40
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBodyPrefix 0x6619 PtypString
    case tagPstBodyPrefix = 0x6619
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstBestBodyProptag 0x661D PtypInteger32
    case tagPstBestBodyProptag = 0x661D
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagPstLrNoRestrictions 0x6633 PtypBoolean
    case tagPstLrNoRestrictions = 0x6633
    
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x6636 PtypInteger32 PidTagPstHiddenUnread Unread hidden items in sub-Folder object. Y
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
    /// The right-most column indicates whether the property is copied from the child Folder object PC into
    /// the hierarchy TC row when a new child Folder object is created.
    /// 0x6636 PtypInteger32 PidTagPstHiddenUnread Unread hidden items in sub-Folder object. Y
    case tagPstHiddenUnread = 0x6636
    
    /// Removed from specification
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9
    /// PidTagLatestPstEnsure 0x66FA PtypInteger32
    case tagLatestPstEnsure = 0x66FA
    
    /// Unknown - seen in PST files
    case unknown0x66FC = 0x66FC
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstIpmsubTreeDescendant 0x6705 PtypBoolean
    case tagPstIpmsubTreeDescendant = 0x6705
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstSubTreeContainer 0x6772 PtypInteger32
    case tagPstSubTreeContainer = 0x6772
    
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
    
    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagPstPassword 0x67FF PtypInteger32
    case tagPstPassword = 0x67FF
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x6800 PtypString PidTagOfflineAddressBookName OAB name. And it hasan alternate name PidTagOfflineAddressBookName_W. Y
    case tagOfflineAddressBookName = 0x6800
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x6803 PtypBoolean PidTagSendOutlookRecallReport Send recall report. Y
    case tagSendOutlookRecallReport = 0x6803
    
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x6805 PtypMultipleInteger32 PidTagOfflineAddressBookTruncatedProperties OAB truncated properties. Y
    case tagOfflineAddressBookTruncatedProperties = 0x6805

    /// [MS-PST] 2.1.2 Properties
    /// This file format specification defines the property tags described in the following table. The
    /// PropertyTag structure is specified in [MS-OXCDATA] section 2.9.
    /// PidTagMapiFormComposeCommand 0x682F PtypString
    case tagMapiFormComposeCommand = 0x682F
    
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
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7006 PtypString PidTagViewDescriptorName View descriptor name. And it has an alternate name PidTagViewDescriptorName_W. Y
    case tagViewDescriptorName = 0x7006
    
    /// [MS-OXPROPS] 2.1058 PidTagViewDescriptorVersion
    /// Canonical name: PidTagViewDescriptorVersion
    /// Description: Contains the View Descriptor version.
    /// Property ID: 0x7007
    /// Data type: PtypInteger32, 0x0003
    /// Area: Miscellaneous Properties
    /// Defining reference:[MS-OXOCFG] section 2.2.6.4
    /// Alternate names: PR_VD_VERSION
    /// [MS-PST] 2.4.4.6 FAI Contents Table
    /// The FAI contents table is a TC node identified with an NID_TYPE of
    /// NID_TYPE_ASSOC_CONTENTS_TABLE. Its function is to list the FAI Message objects in the Folder
    /// object.
    /// [MS-PST] 2.4.4.6.1 FAI Contents Table Template
    /// Each PST MUST have one FAI contents table template, which is identified with an NID value of
    /// NID_ASSOC_CONTENTS_TABLE_TEMPLATE (0x60F). The FAI contents table template MUST have no
    /// data rows, and MUST contain the following property columns.
    /// 0x7007 PtypInteger32 PidTagViewDescriptorVersion View descriptor version. Y
    case tagViewDescriptorVersion = 0x7007
}
