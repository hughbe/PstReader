//
//  PstFileType.swift
//  
//
//  Created by Hugh Bellamy on 20/10/2020.
//

internal enum PstFileType {
    case ansi
    case unicode
    case unicode4K
    
    public var isUnicode: Bool {
        switch self {
        case .ansi:
            return false
        case .unicode,
            .unicode4K:
            return true
        }
    }
    
    public var blockSize: UInt32 {
        switch self {
        case .ansi,
             .unicode:
            return 8192
        case .unicode4K:
            return 65536
        }
    }
    
    public var blockTrailerSize: UInt32 {
        switch self {
        case .ansi:
            return 12
        case .unicode:
            return 16
        case .unicode4K:
            return 32
        }
    }
}
