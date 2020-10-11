//
//  MessageStorageInternal.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import MAPI

internal protocol MessageStorageInternal: MessageStorage {
    var properties: PropertiesReader { get }
    var file: PstFile { get }
}

extension MessageStorageInternal {
    public func getProperty<T>(id: UInt16) -> T? {
        return try? properties.getProperty(id: id) as? T
    }

    public func getProperty<T>(name: NamedProperty) -> T? {
        guard let id = file.namedProperties?.dictionary[name] else {
            return nil
        }
        
        return getProperty(id: 0x8000 + id)
    }
}
