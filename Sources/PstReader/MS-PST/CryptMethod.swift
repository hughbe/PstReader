//
//  CryptMethod.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

/// [MS-PST] bCryptMethod (1 byte): Indicates how the data within the PST file is encoded. MUST be set to one
/// of the pre-defined values described in the following table.
internal enum CryptMethod: UInt8 {
    /// Data blocks are not encoded.
    case none = 0x00
    
    /// Encoded with the Permutation algorithm (section 5.1).
    case permute = 0x01
    
    /// Encoded with the Cyclic algorithm (section 5.2).
    case cyclic = 0x02
    
    /// Encrypted with Windows Information Protection.
    case edpcrypted = 0x10
}
