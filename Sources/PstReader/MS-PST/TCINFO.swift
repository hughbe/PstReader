//
//  TCINFO.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream

/// [MS-PST] 2.3.4 Table Context (TC)
/// A Table Context represents a table with rows of columns. From an implementation perspective, a TC is
/// a complex, composite structure that is built on top of an HN. The presence of a TC is indicated at both
/// the NDB and LTP Layers. At the NDB Layer, a TC is indicated through one of the special NID_TYPEs,
/// and at the LTP Layer, a value of bTypeTC for bClientSig in the HNHEADER structure is reserved for
/// TCs. The underlying TC data is separated into 3 entries: a header with Column descriptors, a
/// RowIndex (a nested BTH), and the actual table data (known as the Row Matrix).
/// The Row Matrix contains the actual row data for the TC. New rows are appended to the end of the Row
/// Matrix, which means that the rows are not sorted in any meaningful manner. To provide a way to
/// efficiently search the Row Matrix for a particular data row, each TC also contains an embedded BTH,
/// known as the RowIndex, to provide a 32-bit "primary index" for the Row Matrix. Each 32-bit value is a
/// key that uniquely identifies a row within the Row Matrix.
/// In practice, the Row Matrix is stored in a subnode because of its typical size, but in rare cases, a TC
/// can fit into a single data block if it is small enough. To facilitate navigation between rows, each row of
/// data is of the same size, and the size is stored in the TCINFO header structure (section 2.3.4.1). To
/// further help with data packing and alignment, the data values are grouped according to its
/// corresponding data size. DWORD and ULONGLONG values are grouped first, followed by WORD-sized
/// data, and then byte-sized data. The TCINFO structure contains an array of offsets that points to the
/// starting offset of each group of data.
/// The TC also includes a construct known as a Cell Existence Bitmap (CEB), which is used to denote
/// whether a particular column in a particular row actually "exists". A CEB is present at the end of each
/// row of data in the Row Matrix that indicates which columns in that row exists and which columns don't
/// exist.
/// The following diagram depicts the various elements of a TC, and how they relate to each other.
/// The preceding example illustrates a typical TC arrangement, where the metadata is stored in the main
/// data block (a data tree can be used if the TC is large), and the RowMatrix is stored in the
/// corresponding subnode. Note that the numerical values used in the example are for reference
/// purposes only.
/// The hidUserRoot of the HNHDR points to the TC header, which is allocated from the heap with
/// HID=0x20. The TC header contains a TCINFO structure, followed by an array of column descriptors.
/// The TCINFO structure contains pointers that point to the RowIndex (hidRowIndex) and The Row
/// Matrix (hnidRowData). The RowIndex is allocated off the heap, whereas the Row Matrix is stored in
/// the subnode (in rare cases where the TC is very small, the Row Matrix can be stored in a heap
/// allocation instead. Note that the subnode structure in the diagram is significantly simplified for
/// illustrative purposes.
/// The next sections describe actual data structures associated with Table Contexts:
/// [MS-PST] 2.3.4.1 TCINFO
/// TCINFO is the header structure for the TC. The TCINFO is accessed using the hidUserRoot field in the
/// HNHDR structure of the containing HN. The header contains the column definitions and other relevant
/// data.
internal struct TCINFO: CustomDebugStringConvertible {
    public let bType: ClientSignature
    public let cCols: UInt8
    public let rgib: (b4: UInt16, b2: UInt16, b1: UInt16, bm: UInt16)
    public let hidRowIndex: HID
    public let hnidRows: HNID
    public let hidIndex: HID
    public let rgTCOLDESC: [TCOLDESC]

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// bType (1 byte): TC signature; MUST be set to bTypeTC.
        let bTypeRaw: UInt8 = try dataStream.read()
        guard let bType = ClientSignature(rawValue: bTypeRaw), bType == .tc else {
            throw PstReadError.invalidBtype(btype: bTypeRaw)
        }
        
        self.bType = bType
        
        /// cCols (1 byte): Column count. This specifies the number of columns in the TC.
        self.cCols = try dataStream.read()
        
        /// rgib (8 bytes): This is an array of 4 16-bit values that specify the offsets of various groups of data in
        /// the actual row data. The application of this array is specified in section 2.3.4.4, which covers the
        /// data layout of the Row Matrix. The following table lists the meaning of each value:
        /// Index | Friendly name | Meaning of rgib[Index] value
        /// ---------------------------------------------------
        /// 0            | TCI_4b                      | Ending offset of 8- and 4-byte data value group.
        /// 1            | TCI_2b                      | Ending offset of 2-byte data value group.
        /// 2            | TCI_1b                      | Ending offset of 1-byte data value group.
        /// 3            | TCI_bm                     | Ending offset of the Cell Existence Block.
        self.rgib = (
            b4: try dataStream.read(endianess: .littleEndian),
            b2: try dataStream.read(endianess: .littleEndian),
            b1: try dataStream.read(endianess: .littleEndian),
            bm: try dataStream.read(endianess: .littleEndian)
        )
        
        // hidRowIndex (4 bytes): HID to the Row ID BTH. The Row ID BTH contains (RowID, RowIndex)
        // value pairs that correspond to each row of the TC. The RowID is a value that is associated with the
        // row identified by the RowIndex, whose meaning depends on the higher level structure that
        // implements this TC. The RowIndex is the zero-based index to a particular row in the Row Matrix.
        self.hidRowIndex = try HID(dataStream: &dataStream, type: type)
        
        /// hnidRows (4 bytes): HNID to the Row Matrix (that is, actual table data). This value is set to zero if
        /// the TC contains no rows.
        self.hnidRows = try HNID(dataStream: &dataStream, type: type)
        
        /// hidIndex (4 bytes): Deprecated. Implementations SHOULD ignore this value, and creators of a new
        /// PST MUST set this value to zero.
        self.hidIndex = try HID(dataStream: &dataStream, type: type)
        
        /// rgTCOLDESC (variable): Array of Column Descriptors. This array contains cCol entries of type
        /// TCOLDESC structures that define each TC column. The entries in this array MUST be sorted by
        /// the tag field of TCOLDESC.
        var rgTCOLDESC: [TCOLDESC] = []
        rgTCOLDESC.reserveCapacity(Int(cCols))
        for _ in 0..<cCols {
            let coldesc = try TCOLDESC(dataStream: &dataStream)
            rgTCOLDESC.append(coldesc)
        }
        
        self.rgTCOLDESC = rgTCOLDESC
    }
    
    public var debugDescription: String {
        var s = "TCINFO\n"
        s += "- bType: \(bType)\n"
        s += "- rgib: (\(rgib.b4.hexString), \(rgib.b2.hexString), \(rgib.b1.hexString), \(rgib.bm.hexString))\n"
        s += "- hidRowIndex: \(hidRowIndex)\n"
        s += "- hnidRows: \(hnidRows)\n"
        s += "- hidIndex: \(hidIndex)\n"
        for entry in rgTCOLDESC.enumerated() {
            s += "- rgTCOLDESC[\(entry.offset)] \(entry.element)\n"
        }
        return s
    }
}
