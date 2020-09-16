//
//  ClientSignature.swift
//  
//
//  Created by Hugh Bellamy on 27/09/2020.
//

/// bClientSig (1 byte): Client signature. This value describes the higher-level structure that is
/// implemented on top of the HN. This value is intended as a hint for a higher-level structure and has
/// no meaning for structures defined at the HN level. The following values are pre-defined for
/// bClientSig. All other values not described in the following table are reserved and MUST NOT be
/// assigned or used.
internal enum ClientSignature: UInt8 {
    /// Reserved
    case reserved1 = 0x6C
    
    /// Table Context (TC/HN)
    case tc = 0x7C
    
    /// Reserved
    case reserved2 = 0x8C
    
    /// Reserved
    case reserved3 = 0x9C
    
    /// Reserved
    case reserved4 = 0xA5
    
    /// Reserved
    case reserved5 = 0xAC
    
    /// BTree-on-Heap (BTH)
    case bth = 0xB5
    
    /// Property Context (PC/BTH)
    case pc = 0xBC
    
    /// Reserved
    case reserved6 = 0xCC
}
