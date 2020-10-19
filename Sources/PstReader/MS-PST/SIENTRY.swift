//
//  SIENTRY.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

/// [MS-PST] 2.2.2.8.3.3 Subnode BTree
/// The subnode BTree collectively refers to all the elements that make up a subnode. The subnode BTree
/// is a BTree that is made up of SIBLOCK and SLBLOCK structures, which contain SIENTRY and SLENTRY
/// structures, respectively. These structures are defined in the following sections.
/// [MS-PST] 2.2.2.8.3.3.2 SIBLOCKs
/// An SIBLOCK is a block that contains an array of SIENTRYs. It is used to extend the number of
/// subnodes that a node can reference by chaining SLBLOCKS.
/// [MS-PST] 2.2.2.8.3.3.2.1 SIENTRY (Intermediate Block Entry)
/// SIENTRY are intermediate records that point to SLBLOCKs.
internal struct SIENTRY: CustomDebugStringConvertible {
    public let isUnicode: Bool
    public let nid: NID
    public let dwNidPadding: UInt32?
    public let bid: BID

    public init(dataStream: inout DataStream, isUnicode: Bool) throws {
        self.isUnicode = isUnicode

        /// nid (Unicode: 8 bytes; ANSI: 4 bytes): The key NID value to the next-level child block. This NID is
        /// only unique within the parent node. The NID is extended to 8 bytes in order for Unicode PST files
        /// to follow the general convention of 8-byte indices (see section 2.2.2.7.7.4 for details).
        self.nid = try NID(dataStream: &dataStream)
        
        if isUnicode {
            self.dwNidPadding = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwNidPadding = nil
        }
        
        /// bid (Unicode: 8 bytes; ANSI: 4 bytes): The BID of the SLBLOCK.
        self.bid = try BID(dataStream: &dataStream, isUnicode: isUnicode)
    }

    public var debugDescription: String {
        var s = "SIENTRY\n"
        s += "- nid: \(nid)\n"
        if isUnicode {
            s += "- dwNidPadding: \(dwNidPadding!.hexString)\n"
        }
        s += "- bid: \(bid)\n"
        return s
    }
}
