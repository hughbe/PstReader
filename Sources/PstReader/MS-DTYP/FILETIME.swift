//
//  FILETIME.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import Foundation

/// [MS-DTYP] 2.3.3 FILETIME
/// The FILETIME structure is a 64-bit value that represents the number of 100-nanosecond intervals that
/// have elapsed since January 1, 1601, Coordinated Universal Time (UTC).
internal struct FILETIME {
    public let dwLowDateTime: UInt32
    public let dwHighDateTime: UInt32
    
    public var rawValue: UInt64 {
        return (UInt64(dwHighDateTime) << 32) + UInt64(dwLowDateTime)
    }
    
    public var date: Date {
        let windowsTicks: UInt64 = 10000000
        let secondsToUnixEpoch: UInt64 = 11644473600
        
        let rawValue = self.rawValue
        let seconds = rawValue / windowsTicks
        let unixTimestamp = seconds - secondsToUnixEpoch
        return Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
    }
    
    public var description: String {
        return String(rawValue)
    }
}
