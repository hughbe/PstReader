//
//  FILETIME+InitDataStream.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import DataStream

internal extension FILETIME {
    init(dataStream: inout DataStream) throws {
        self.dwLowDateTime = try dataStream.read(endianess: .littleEndian)
        self.dwHighDateTime = try dataStream.read(endianess: .littleEndian)
    }
}
