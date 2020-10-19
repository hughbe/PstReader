//
//  NBTENTRY.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 2.2.2.7.7.4 NBTENTRY (Leaf NBT Entry)
/// NBTENTRY records contain information about nodes and are found in BTPAGES with cLevel equal to 0,
/// with the ptype of ptypeNBT. These are the leaf entries of the NBT.
internal struct NBTENTRY: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let nid: NID
    public let dwNidExtended: UInt32?
    public let bidData: BID
    public let bidSub: BID
    public let nidParent: NID
    public let dwPadding: UInt32?

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// nid (Unicode: 8 bytes; ANSI: 4 bytes): The NID (section 2.2.2.1) of the entry. Note that the NID is
        /// a 4-byte value for both Unicode and ANSI formats. However, to stay consistent with the size of
        /// the btkey member in BTENTRY, the 4-byte NID is extended to its 8-byte equivalent for Unicode
        /// PST files.
        self.nid = try NID(dataStream: &dataStream)
        
        if isUnicode {
            self.dwNidExtended = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwNidExtended = nil
        }
        
        /// bidData (Unicode: 8 bytes; ANSI: 4 bytes): The BID of the data block for this node.
        self.bidData = try BID(dataStream: &dataStream, isUnicode: isUnicode)
        
        /// bidSub (Unicode: 8 bytes; ANSI: 4 bytes): The BID of the subnode block for this node. If this
        /// value is zero, a subnode block does not exist for this node.
        self.bidSub = try BID(dataStream: &dataStream, isUnicode: isUnicode)
        
        /// nidParent (4 bytes): If this node represents a child of a Folder object defined in the Messaging
        /// Layer, then this value is nonzero and contains the NID of the parent Folder object's node.
        /// Otherwise, this value is zero. See section 2.2.2.7.7.4.1 for more information. This field is not
        /// interpreted by any structure defined at the NDB Layer.
        self.nidParent = try NID(dataStream: &dataStream)
        
        /// dwPadding (Unicode file format only, 4 bytes): Padding; MUST be set to zero.
        if isUnicode {
            self.dwPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwPadding = nil
        }
    }

    public var debugDescription: String {
        var s = "NBTENTRY\n"
        s += "- nid: \(nid)\n"
        if isUnicode {
            s += "- dwNidExtended: \(dwNidExtended!.hexString)\n"
        }
        s += "- bidData: \(bidData)\n"
        s += "- bidSub: \(bidSub)\n"
        s += "- nidParent: \(bidData)\n"
        if isUnicode {
            s += "- dwPadding: \(dwPadding!.hexString)\n"
        }
        
        return s
    }
}
