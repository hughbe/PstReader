//
//  DumpExtensions.swift
//  
//
//  Created by Hugh Bellamy on 28/09/2020.
//

import Foundation

private extension OptionSet where RawValue: FixedWidthInteger {
    func elements() -> AnySequence<Self> {
        var remainingBits = rawValue
        var bitMask: RawValue = 1
        return AnySequence {
            return AnyIterator {
                while remainingBits != 0 {
                    defer { bitMask = bitMask &* 2 }
                    if remainingBits & bitMask != 0 {
                        remainingBits = remainingBits & ~bitMask
                        return Self(rawValue: bitMask)
                    }
                }

                return nil
            }
        }
    }
    
    func dump() -> String {
        var s = ""
        let allElements = [Self](elements())
        for entry in allElements.enumerated() {
            s += "\(entry.element.rawValue.hexString)"
            if entry.offset != allElements.count - 1 {
                s += " | "
            }
        }
        
        return s
    }
}

internal func dump(properties: [UInt16: Any?]) {
    func keyString(key: UInt16) -> String {
        if let type = PstPropertyId(rawValue: key) {
            return "\(type)"
        } else if let type = PropertyId(rawValue: key) {
            return "\(type)"
        }
        
        fatalError("Unknown property ID: \(key.hexString)")
        //return key.hexString
    }
    
    func valueString(key: UInt16, value: Any?) -> String {
        guard let value = value else {
            return "nil"
        }
        
        func hexDump(bytes: [UInt8]) -> String {
            return "[\(bytes.map { $0.hexString }.joined(separator: ", "))]"
        }
        
        if let binary = value as? [UInt8] {
            return hexDump(bytes: binary)
        } else if let multipleBinary = value as? [[UInt8]] {
            var s = "[\n"
            for entry in multipleBinary.enumerated() {
                s += "- [\(entry.offset)] \(valueString(key: key, value: entry.element))\n"
            }
            
            s += "]"
            return s
        } else if let valueAsUInt32 = value as? UInt32 {
            if key == PstPropertyId.tagValidFolderMask.rawValue {
                let mask = FolderMask(rawValue: valueAsUInt32)
                return mask.dump()
            }
            
            return "\(valueAsUInt32.hexString)"
        } else if let valueAsString = value as? String {
            return "\"\(valueAsString)\""
        } else {
            return "\(value)"
        }
    }
    
    var s = ""
    for prop in properties {
        s += "- \(keyString(key: prop.key)): \(valueString(key: prop.key, value: prop.value))\n"
    }
    
    print(s)
}
