//
//  XBLOCK.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.8.3.2 Data Tree
/// A data tree collectively refers to all the elements that are used to store data. In the simplest case, a
/// data tree consists of a single data block, which can hold up to 8,176 bytes. If the data is more than
/// 8,176 bytes, a construct using XBLOCKs and XXBLOCKs is used to store the data in a series of data
/// blocks arranged in a tree format. The layout of the XBLOCK and XXBLOCK structures are defined in
/// the following sections.
/// [MS-PST] 2.2.2.8.3.2.1 XBLOCK
/// XBLOCKs are used when the data associated with a node data that exceeds 8,176 bytes in size. The
/// XBLOCK expands the data that is associated with a node by using an array of BIDs that reference data
/// blocks that contain the data stream associated with the node. A BLOCKTRAILER is present at the end
/// of an XBLOCK, and the end of the BLOCKTRAILER MUST be aligned on a 64-byte boundary.
internal struct XBLOCK: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let btype: UInt8
    public let cLevel: UInt8
    public let cEnt: UInt16
    public let lcbTotal: UInt32
    public let rgbid: [BID]
    public let rgbPadding: [UInt8]
    public let blockTrailer: BLOCKTRAILER
    
    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        let position = dataStream.position

        self.isUnicode = isUnicode

        /// btype (1 byte): Block type; MUST be set to 0x01 to indicate an XBLOCK or XXBLOCK.
        self.btype = try dataStream.read()
        if btype != 0x01 {
            throw PstReadError.invalidBtype(btype: btype)
        }
        
        /// cLevel (1 byte): MUST be set to 0x01 to indicate an XBLOCK.
        self.cLevel = try dataStream.read()
        if cLevel != 0x01 {
            throw PstReadError.invalidCLevel(cLevel: cLevel)
        }
        
        /// cEnt (2 bytes): The count of BID entries in the XBLOCK.
        self.cEnt = try dataStream.read(endianess: .littleEndian)
        
        /// lcbTotal (4 bytes): Total count of bytes of all the external data stored in the data blocks referenced
        /// by XBLOCK.
        self.lcbTotal = try dataStream.read(endianess: .littleEndian)
        
        /// rgbid (variable): Array of BIDs that reference data blocks. The size is equal to the number of entries
        /// indicated by cEnt multiplied by the size of a BID (8 bytes for Unicode PST files, 4 bytes for ANSI
        /// PST files).
        var rgbid = [BID]()
        rgbid.reserveCapacity(Int(self.cEnt))
        for _ in 0..<self.cEnt {
            let entry = try BID(dataStream: &dataStream, isUnicode: isUnicode)
            rgbid.append(entry)
        }
        
        self.rgbid = rgbid
        
        /// rgbPadding (variable, optional): This field is present if the total size of all of the other fields is not
        /// a multiple of 64. The size of this field is the smallest number of bytes required to make the size of
        /// the XBLOCK a multiple of 64. Implementations MUST ignore this field.
        let totalSize = (dataStream.position - position) + (isUnicode ? 16 : 12)
        if (totalSize % 64) != 0 {
            let paddingSize = 64 - (totalSize % 64)
            self.rgbPadding = try dataStream.readBytes(count: paddingSize)
        } else {
            self.rgbPadding = []
        }
        
        /// blockTrailer (ANSI: 12 bytes; Unicode: 16 bytes): A BLOCKTRAILER structure (section
        /// 2.2.2.8.1).
        self.blockTrailer = try BLOCKTRAILER(dataStream: &dataStream, isUnicode: isUnicode)
    }

    public var debugDescription: String {
        var s = "XBLOCK\n"
        s += "- btype: \(btype.hexString)\n"
        s += "- cLevel: \(cLevel.hexString)\n"
        s += "- cEnt: \(cEnt.hexString)\n"
        s += "- lcbTotal: \(lcbTotal.hexString)\n"
        for entry in rgbid.enumerated() {
            s += " - rgbid[\(entry.offset)] \(entry.element)"
        }
        s += "- blockTrailer: \(blockTrailer)"
        return s
    }
}
