//
//  PropertyType.swift
//  
//
//  Created by Hugh Bellamy on 27/09/2020.
//

/// [MS-OXCDATA] 2.11.1 Property Data Types
/// For all variants, the structure of a property value is the same and is specified by the property data
/// type, whether or not the property data type is actually encoded in the buffer. The following table lists
/// both the property data type identifiers and the format of the property values. Web Distributed
/// Authoring and Versioning Protocol (WebDAV) property data type identifiers are specified in
/// section 2.11.1.6.
/// There is one variation in the width of count fields. In the context of ROP buffers, such as the
/// RopGetPropertiesSpecific ROP ([MS-OXCROPS] section 2.2.8.3), byte counts for PtypBinary
/// property values and value counts for all PtypMultiple property values are 16 bits wide. However, in
/// the context of extended rules, as specified in [MS-OXORULE] section 2.2.4, byte counts for
/// PtypBinary property values and value counts for PtypMultiple property values are 32 bits wide, and
/// in the context of the MAPI extensions for HTTP, as specified in [MS-OXCMAPIHTTP], byte counts for
/// PtypBinary property values are 32 bits wide. Such count fields have a width designation of COUNT,
/// as specified in section 2.11.1.1, rather than an explicit width, as throughout section 2.11.
/// In the context of a table operation, properties are referred to as columns. The format of property
/// identifiers, types, and values in table operations such as the RopQueryRows ROP ([MS-OXCROPS]
/// section 2.2.5.4) is the same as in property operations such as the RopGetPropertiesSpecific ROP.
/// Property data types are presented in the following table. The property data type values specified are
/// 16-bit integers. The Name Service Provider Interface (NSPI) Protocol, as specified in [MS-NSPI], uses
/// the same numeric values but expresses them as 32-bit integers, with the high-order 16 bits of the 32-
/// bit representation always set to 0x0000.
public enum PropertyType: UInt16 {
    /// Any: this property type value matches any type; a server MUST return the actual type in its response.
    /// Servers MUST NOT return this type in response to a client request other than NspiGetIDsFromNames or the
    /// RopGetPropertyIdsFromNames ROP request ([MS-OXCROPS] section 2.2.8.1).
    case unspecified = 0x0000
    
    /// None: This property is a placeholder.
    case null = 0x0001
    
    /// 2 bytes; a 16-bit integer
    /// [MS-DTYP]: INT16
    case integer16 = 0x0002
    
    /// 4 bytes; a 32-bit integer
    /// [MS-DTYP]: INT32
    case integer32 = 0x00003
    
    /// 4 bytes; a 32-bit floating point number
    /// [MS-DTYP]: FLOAT
    case floating32 = 0x0004
    
    /// 8 bytes; a 64-bit floating point number
    /// [MS-DTYP]: DOUBLE
    case floating64 = 0x0005
    
    /// 8 bytes; a 64-bit signed, scaled integer representation of a decimal currency value, with four places to the right of the decimal point
    /// [MS-DTYP]: LONGLONG
    /// [MS-OAUT]: CURRENCY
    case currency = 0x0006
    
    /// 8 bytes; a 64-bit floating point number in which the whole number part represents the number of days since December 30, 1899, and the fractional part represents the fraction of a day since midnight
    /// [MS-DTYP]: DOUBLE
    /// [MS-OAUT]: DATE
    case floatingTime = 0x0007
    
    /// 4 bytes; a 32-bit integer encoding error information as specified in section 2.4.1.
    case errorCode = 0x000A
    
    /// 1 byte; restricted to 1 or 0
    /// [MS-DTYP]: BOOLEAN
    case boolean = 0x000B
    
    /// The property value is a Component Object Model (COM) object, as specified in section 2.11.1.5.
    case objectOrEmbeddedTable = 0x000D
    
    /// 8 bytes; a 64-bit integer
    /// [MS-DTYP]: LONGLONG
    case integer64 = 0x0014
    
    /// Variable size; a string of multibyte characters in externally specified encoding with terminating null character (single 0 byte).
    case string8 = 0x001E
    
    /// Variable size; a string of Unicode characters in UTF-16LE format encoding with terminating null character (0x0000).
    case string = 0x001F
    
    /// 8 bytes; a 64-bit integer representing the number of 100-nanosecond intervals since January 1, 1601
    /// [MS-DTYP]: FILETIME
    case time = 0x0040
    
    /// 16 bytes; a GUID with Data1, Data2, and Data3 fields in little-endian format
    /// [MS-DTYP]: GUID
    case guid = 0x0048
    
    /// Variable size; a 16-bit COUNT field followed by a structure as specified in section 2.11.1.4.
    case serverId = 0x00FB
    
    /// Variable size; a byte array representing one or more Restriction structures as specified in section 2.12.
    case restriction = 0x00FD
    
    /// Variable size; a 16-bit COUNT field followed by that many rule action structures, as
    /// specified in [MS-OXORULE] section 2.2.5.
    case ruleAction = 0x00FE
    
    /// Variable size; a COUNT field followed by that many bytes.
    case binary = 0x0102
    
    /// Variable size; a COUNT field followed by that many PtypInteger16 values.
    case multipleInteger16 = 0x1002
    
    /// Variable size; a COUNT field followed by that many PtypInteger32 values.
    case multipleInteger32 = 0x1003
    
    /// Variable size; a COUNT field followed by that many PtypFloating32 values.
    case multipleFloating32 = 0x1004
    
    /// Variable size; a COUNT field followed by that many PtypFloating64 values.
    case multipleFloating64 = 0x1005
    
    /// Variable size; a COUNT field followed by that many PtypCurrency values.
    case multipleCurrency = 0x1006
    
    /// Variable size; a COUNT field followed by that many PtypFloatingTime values.
    case multipleFloatingTime = 0x1007
    
    /// Variable size; a COUNT field followed by that many PtypInteger64 values.
    case multipleInteger64 = 0x1014
    
    /// Variable size; a COUNT field followed by that many PtypString8 values.
    case multipleString8 = 0x101E
    
    /// Variable size; a COUNT field followed by that many PtypString values.
    case multipleString = 0x101F
    
    /// Variable size; a COUNT field followed by that many PtypTime values.
    case multipleTime = 0x1040
    
    /// Variable size; a COUNT field followed by that many PtypGuid values.
    case multipleGuid = 0x1048
    
    /// Variable size; a COUNT field followed by that many PtypBinary values.
    case multipleBinary = 0x1102
    
    case unknown = 0xFFFF
}
