//
//  FAMapValid.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

/// [MS-PST] fAMapValid (1 byte): Indicates whether all of the AMaps in this PST file are valid. For more details,
/// see section 2.6.1.3.7. This value MUST be set to one of the pre-defined values specified in the
/// following table.
internal enum FAMapValid: UInt8 {
    /// One or more AMaps in the PST are INVALID
    case invalid = 0x00
    
    /// Deprecated. Implementations SHOULD NOT use this value. The AMaps are VALID.<6>
    case valid1 = 0x01
    
    /// The AMaps are VALID.
    case valid2 = 0x02
}
