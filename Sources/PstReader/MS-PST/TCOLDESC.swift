//
//  TCOLDESC.swift
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
/// [MS-PST] 2.3.4.2 TCOLDESC
/// The TCOLDESC structure describes a single column in the TC, which includes metadata about the size
/// of the data associated with this column, as well as whether a column exists, and how to locate the
/// column data from the Row Matrix.
internal struct TCOLDESC: CustomDebugStringConvertible {
    public let tag: PropertyTag
    public let ibData: UInt16
    public let cbData: UInt8
    public let iBit: UInt8

    public init(dataStream: inout DataStream) throws {
        /// tag (4 bytes): This field specifies that 32-bit tag that is associated with the column.
        self.tag = try PropertyTag(dataStream: &dataStream)
        
        /// ibData (2 bytes): Data Offset. This field indicates the offset from the beginning of the row data (in
        /// the Row Matrix) where the data for this column can be retrieved. Because each data row is laid
        /// out the same way in the Row Matrix, the Column data for each row can be found at the same
        /// offset.
        self.ibData = try dataStream.read(endianess: .littleEndian)
        
        /// cbData (1 byte): Data size. This field specifies the size of the data associated with this column (that
        /// is, "width" of the column), in bytes per row. However, in the case of variable-sized data, this value
        /// is set to the size of an HNID instead. This is explained further in section 2.3.4.4.
        self.cbData = try dataStream.read()
        
        /// iBit (1 byte): Cell Existence Bitmap Index. This value is the 0-based index into the CEB bit that
        /// corresponds to this Column. A detailed explanation of the mapping mechanism will be discussed in
        /// section 2.3.4.4.1.
        self.iBit = try dataStream.read()
    }
    
    public var debugDescription: String {
        var s = "TCOLDESC\n"
        s += "- tag: \(tag)\n"
        s += "- ibData: \(ibData.hexString)\n"
        s += "- cbData: \(cbData.hexString)\n"
        s += "- iBit: \(iBit)\n"
        return s
    }
}
