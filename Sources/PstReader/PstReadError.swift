//
//  PstReadError.swift
//  
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import MAPI

public enum PstReadError: Error {
    case invalidDwMagic(dwMagic: UInt32)
    case invalidWMagicClient(wMagicClient: UInt16)
    case invalidWVer(wVer: UInt16)
    case invalidBPlatformCreate(bPlatformCreate: UInt8)
    case invalidBPlatformAccess(bPlatformAccess: UInt8)
    case invalidFAMapValid(fAMapValid: UInt8)
    case invalidBSentinel(bSentinel: UInt8)
    case invalidBCryptMethod(bCryptMethod: UInt8)
    case invalidRgbReserved(rgbReserved: UInt16)
    case invalidPtype(ptype: UInt8)
    case invalidPtypeRepeat(ptype: UInt8, ptypeRepeat: UInt8)
    case invalidPageEntryType(pageEntryType: UInt8)
    case invalidBtype(btype: UInt8)
    case invalidCLevel(cLevel: UInt8)
    case invalidCEnt(cEnt: UInt16)
    case invalidBSig(bSig: UInt8)
    case invalidBClientSig(bClientSig: UInt8)
    case invalidFillLevel(fillLevel: UInt8)
    case invalidCbKey(cbKey: UInt8)
    case invalidCbEnt(cbEnt: UInt8)
    case invalidHidType(hidType: UInt32)
    
    case invalidBlockNum(blockNum: Int)
    case invalidRowOffset(rowOffset: Int)
    case invalidPropertySize(expected: UInt8, actual: UInt8)
    
    case missingProperty(property: PstPropertyId)
    
    case noSuchNode(nid: UInt32)
    case corruptedHeapNode(dataBid: UInt64)
    case invalidContext(expected: UInt8, actual: UInt8)
}
