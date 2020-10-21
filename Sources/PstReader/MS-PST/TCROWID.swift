//
//  TCROWID.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import DataStream
import MAPI

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
/// [MS-PST] 2.3.4.3 The RowIndex
/// The hidRowIndex member in TCINFO points to an embedded BTH that contains an array of
/// (dwRowID, dwRowIndex) value pairs, which provides a 32-bit primary index for searching the Row
/// Matrix. Simply put, the RowIndex maps dwRowID, a unique identifier, to the index of a particular
/// row in the Row Matrix.
/// The RowIndex itself is a generic mechanism to provide a 32-bit primary key and therefore it is up to
/// the implementation to decide what value to use for the primary key. However, an NID value is used as
/// the primary key because of its uniqueness within a PST.
/// The following is the layout of the BTH data record used in the RowIndex.
/// [MS-PST] 2.3.4.3.1 TCROWID
/// The TCROWID structure is a manifestation of the BTH data record (section 2.3.2.3). The size of the
/// TCROWID structure varies depending on the version of the PST. For the Unicode PST, each record in
/// the BTH are 8 bytes in size, where cbKey is set to 4 and cEnt is set to 4. For an ANSI PST, each
/// record is 6 bytes in size, where cbKey is set to 4 and cEnt is set to 2. The following is the binary
/// layout of the TCROWID structure.
internal struct TCROWID: BTH, CustomDebugStringConvertible {
    public static var size: UInt16 = 8
    
    public let dwRowID: NID
    public let dwRowIndex: UInt32

    public init(dataStream: inout DataStream, type: PstFileType) throws {
        /// dwRowID (4 bytes): This is the 32-bit primary key value that uniquely identifies a row in the Row Matrix.
        self.dwRowID = try NID(dataStream: &dataStream)
        
        /// dwRowIndex (Unicode: 4 bytes; ANSI: 2 bytes): The 0-based index to the corresponding row in the Row Matrix.
        /// Note that for ANSI PSTs, the maximum number of rows is 2^16.
        if type.isUnicode {
            self.dwRowIndex = try dataStream.read(endianess: .littleEndian)
        } else {
            self.dwRowIndex = UInt32(try dataStream.read(endianess: .littleEndian) as UInt16)
        }
    }
    
    public var debugDescription: String {
        var s = "TCROWID\n"
        s += "- dwRowID: \(dwRowID)\n"
        s += "- dwRowIndex: \(dwRowIndex)\n"
        return s
    }
}
