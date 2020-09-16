//
//  PageType.swift
//  
//
//  Created by Hugh Bellamy on 25/09/2020.
//

/// ptype (1 byte): This value indicates the type of data contained within the page. This field MUST
/// contain one of the following values.
internal enum PageType: UInt8 {
    /// Block BTree page. wSig value: Block or page signature (section 5.5).
    case blockBTree = 0x80
    
    /// Node BTree page. wSig value: Block or page signature (section 5.5).
    case nodeBTree = 0x81
    
    /// Free Map page. wSig value: 0x0000
    case freeMap = 0x82
    
    /// Allocation Page Map page. wSig value: 0x0000
    case allocationPageMap = 0x83
    
    /// Allocation Map page. wSig value: 0x0000
    case allocationMap = 0x84
    
    /// Free Page Map page. wSig value: 0x0000
    case freePageMap = 0x85
    
    /// Density List page. wSig value: Block or page signature (section 5.5).
    case densityList = 0x86
}
