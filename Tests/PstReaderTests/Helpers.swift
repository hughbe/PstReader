//
//  Helpers.swift
//  
//
//  Created by Hugh Bellamy on 19/10/2020.
//

import Foundation

public func getData(name: String) throws -> Data {
    var name = name
    let urlExtension: String
    if name.hasSuffix(".pst") {
        name = String(name.prefix(name.count - 4))
        urlExtension = "pst"
    } else if name.hasSuffix(".ost") {
        name = String(name.prefix(name.count - 4))
        urlExtension = "ost"
    } else {
        urlExtension = "pst"
    }
    
    let url = URL(forResource: name, withExtension: urlExtension)
    if FileManager.default.fileExists(atPath: url.path) {
        return try Data(contentsOf: url)
    }
    
    let url2 = URL(forResource: name, withExtension: "ost")
    return try Data(contentsOf: url2)
}
