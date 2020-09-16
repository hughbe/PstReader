//
//  FillLevel.swift
//  
//
//  Created by Hugh Bellamy on 27/09/2020.
//

import Foundation

/// rgbFillLevel (4 bytes): Per-block Fill Level Map. This array consists of eight 4-bit values that indicate
/// the fill level for each of the first 8 data blocks (including this header block). If the HN has fewer
/// than 8 data blocks, then the values corresponding to the non-existent data blocks MUST be set to
/// zero. The following table explains the values indicated by each 4-bit value.
internal enum FillLevel: UInt8 {
    /// At least 3584 bytes free / data block does not exist
    case empty = 0x0
    
    /// 2560-3584 bytes free
    case level1 = 0x1
    
    /// 2048-2560 bytes free
    case level2 = 0x2
    
    /// 1792-2048 bytes free
    case level3 = 0x3
    
    /// 1536-1792 bytes free
    case level4 = 0x4
    
    /// 1280-1536 bytes free
    case level5 = 0x5
    
    /// 1024-1280 bytes free
    case level6 = 0x6
    
    /// 768-1024 bytes free
    case level7 = 0x7
    
    /// 512-768 bytes free
    case level8 = 0x8
    
    /// 256-512 bytes free
    case level9 = 0x9
    
    /// 128-256 bytes free
    case level10 = 0xA
    
    /// 64-128 bytes free
    case level11 = 0xB
    
    /// 32-64 bytes free
    case level12 = 0xC
    
    /// 16-32 bytes free
    case level13 = 0xD
    
    /// 8-16 bytes free
    case level14 = 0xE
    
    /// Data block has less than 8 bytes free
    case full = 0xF
}
