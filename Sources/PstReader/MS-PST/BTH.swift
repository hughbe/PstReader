//
//  BTH.swift
//  
//
//  Created by Hugh Bellamy on 27/09/2020.
//

import DataStream

internal protocol BTH {
    init(dataStream: inout DataStream, type: PstFileType) throws
    static var size: UInt16 { get }
}
