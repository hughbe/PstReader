//
//  BTH.swift
//  
//
//  Created by Hugh Bellamy on 27/09/2020.
//

import DataStream

public protocol BTH {
    init(dataStream: inout DataStream, isUnicode: Bool) throws
    static var size: UInt16 { get }
}
