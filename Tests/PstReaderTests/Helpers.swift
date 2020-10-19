//
//  Helpers.swift
//  
//
//  Created by Hugh Bellamy on 19/10/2020.
//

import Foundation

public func getData(name: String) throws -> Data {
    let urlExtension = name.hasSuffix(".pst") || name.hasSuffix(".ost") ? "" : "pst"
    
    let url = URL(forResource: name, withExtension: urlExtension)
    if FileManager.default.fileExists(atPath: url.path) {
        return try Data(contentsOf: url)
    }
    
    let url2 = URL(forResource: name, withExtension: "ost")
    return try Data(contentsOf: url2)
}
