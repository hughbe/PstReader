//
//  PropertiesReader.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import Foundation

public class PropertiesReader {
    public init(propertyFactories: [UInt16: () throws -> Any?]) {
        self.propertyFactories = propertyFactories
    }
    
    private var propertyFactories: [UInt16: () throws -> Any?]
    private var cachedProperties: [UInt16: Any?] = [:]
    
    public func getAllProperties() throws -> [UInt16: Any?] {
        var properties: [UInt16: Any] = [:]
        properties.reserveCapacity(propertyFactories.count)
        
        for entry in propertyFactories.sorted(by: { $0.key < $1.key }) {
            properties[entry.key] = try entry.value()
        }
        
        return properties
    }

    public func getProperty(id: UInt16) throws -> Any? {
        if let cachedProperty = cachedProperties[id] {
            return cachedProperty
        }
        
        guard let propertyFactory = propertyFactories[id] else {
            cachedProperties[id] = nil
            return nil
        }
        
        let value = try propertyFactory()
        cachedProperties[id] = value
        return value
    }
}
