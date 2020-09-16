//
//  SLENTRY.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.2.2.8.3.3 Subnode BTree
/// The subnode BTree collectively refers to all the elements that make up a subnode. The subnode BTree
/// is a BTree that is made up of SIBLOCK and SLBLOCK structures, which contain SIENTRY and SLENTRY
/// structures, respectively. These structures are defined in the following sections.
/// [MS-PST] 2.2.2.8.3.3.1 SLBLOCKs
/// An SLBLOCK is a block that contains an array of SLENTRYs. It is used to reference the subnodes of a
/// node.
/// [MS-PST] 2.2.2.8.3.3.1.1 SLENTRY (Leaf Block Entry)
/// SLENTRY are records that refer to internal subnodes of a node.
internal struct SLENTRY: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let nid: NID
    public let dwNidPadding: UInt32?
    public let bidData: BID
    public let bidSub: BID

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// nid (Unicode: 8 bytes; ANSI: 4 bytes): Local NID of the subnode. This NID is guaranteed to be
        /// unique only within the parent node.
        self.nid = try NID(dataStream: &dataStream)
        
        if isUnicode {
            self.dwNidPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwNidPadding = nil
        }
        
        /// bidData (Unicode: 8 bytes; ANSI: 4 bytes): The BID of the data block associated with the
        /// subnode.
        self.bidData = try BID(dataStream: &dataStream, isUnicode: isUnicode)
        
        /// bidSub (Unicode: 8 bytes; ANSI: 4 bytes): If nonzero, the BID of the subnode of this subnode.
        self.bidSub = try BID(dataStream: &dataStream, isUnicode: isUnicode)
    }

    public var debugDescription: String {
        var s = "SLENTRY\n"
        s += "- nid: \(nid)\n"
        if isUnicode {
            s += "- dwNidPadding: \(dwNidPadding!.hexString)\n"
        }
        s += "- bidData: \(bidData)\n"
        s += "- bidSub: \(bidSub)\n"
        return s
    }
}
