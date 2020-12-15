//
//  Helpers.swift
//  
//
//  Created by Hugh Bellamy on 19/10/2020.
//

import Foundation

public func getData(name: String) throws -> Data {
    var name = name
    let fileExtension: String
    if name.hasSuffix(".pst") {
        name = String(name.prefix(name.count - 4))
        fileExtension = "pst"
    } else if name.hasSuffix(".ost") {
        name = String(name.prefix(name.count - 4))
        fileExtension = "ost"
    } else {
        fileExtension = "pst"
    }
    
    
    
    if let url = Bundle.module.url(forResource: name, withExtension: fileExtension) {
        return try Data(contentsOf: url)
    }
    
    let url2 = Bundle.module.url(forResource: name, withExtension: "ost")!
    return try Data(contentsOf: url2)
}
