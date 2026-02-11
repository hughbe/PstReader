//
//  Helpers.swift
//  
//
//  Created by Hugh Bellamy on 19/10/2020.
//

import Foundation

public func getURL(name: String) throws -> URL {
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

    let otherExtension = fileExtension == "pst" ? "ost" : "pst"

    if let url = Bundle.module.url(forResource: name, withExtension: fileExtension) {
        return url
    }

    if let url = Bundle.module.url(forResource: name, withExtension: otherExtension) {
        return url
    }

    throw CocoaError(.fileNoSuchFile, userInfo: [
        NSLocalizedDescriptionKey: "Test resource '\(name)' not found with .pst or .ost extension"
    ])
}

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

    let otherExtension = fileExtension == "pst" ? "ost" : "pst"

    if let url = Bundle.module.url(forResource: name, withExtension: fileExtension) {
        return try Data(contentsOf: url, options: .mappedIfSafe)
    }

    if let url = Bundle.module.url(forResource: name, withExtension: otherExtension) {
        return try Data(contentsOf: url, options: .mappedIfSafe)
    }

    throw CocoaError(.fileNoSuchFile, userInfo: [
        NSLocalizedDescriptionKey: "Test resource '\(name)' not found with .pst or .ost extension"
    ])
}
