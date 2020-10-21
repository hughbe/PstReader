//
//  LTP.BTreeOnHeap.swift
//  
//
//  Created by Hugh Bellamy on 09/10/2020.
//

import DataStream

internal extension LTP {
    /// [MS-PST] 2.3.2 BTree-on-Heap (BTH)
    /// A BTree-on-Heap implements a classic BTree on a heap node. A BTH consists of several parts: A
    /// header, the BTree records, and optional BTree data. The following diagram shows a high-level
    /// schematic of a BTH.
    /// The preceding diagram shows a BTH with two levels of indices. The top-level index (Key, HID) value
    /// pairs actually point to heap items that contain the Level 1 Indices, which, in turn, point to heap items
    /// that contain the leaf (Key, data) value pairs. Each of the six boxes in the diagram actually represents
    /// six separate items allocated out of the same HN, as indicated by their associated HIDs.
    struct BTreeOnHeap<T> where T: BTH {
        public let bthList: [T]
        
        public init(heapOnNode: HN, hid: HID, type: PstFileType) throws {
            var dataStream = heapOnNode.getDataStream(hid: hid)
            let header = try BTHHEADER(dataStream: &dataStream, type: type)

            func readBTHIndexHelper<T>(hid: HID, level: UInt8, bthList: inout [T]) throws where T: BTH {
                if level == 0 {
                    /// [MS-PST] 2.3.2.3 Leaf BTH (Data) Records
                    /// Leaf BTH records contain the actual data associated with each key entry. The BTH records are tightly
                    /// packed (that is, byte-aligned), and each record is exactly cbKey + cbEnt bytes in size. The number of
                    /// data records can be determined based on the size of the heap allocation.
                    let recCount = heapOnNode.getSize(hid: hid) / T.size
                    if hid.hidIndex != 0 {
                        bthList.reserveCapacity(bthList.capacity + Int(recCount))

                        // The T record also forms the key of the BTH entry
                        var dataStream = heapOnNode.getDataStream(hid: hid)
                        for _ in 0..<recCount {
                            let bth = try T(dataStream: &dataStream, type: heapOnNode.type)
                            bthList.append(bth)
                        }
                    }
                } else {
                    /// [MS-PST] 2.3.2.2 Intermediate BTH (Index) Records
                    /// Index records do not contain actual data, but point to other index records or leaf records. The format
                    /// of the intermediate index record is as follows. The number of index records can be determined based
                    /// on the size of the heap allocation.
                    let recCount = heapOnNode.getSize(hid: hid) / IntermediateBTH<UInt32>.size
                    var dataStream = heapOnNode.getDataStream(hid: hid)
                    for _ in 0..<recCount {
                        let intermediate = try IntermediateBTH<UInt32>(dataStream: &dataStream, type: heapOnNode.type)
                        try readBTHIndexHelper(hid: intermediate.hidNextLevel, level: level - 1, bthList: &bthList)
                    }
                }
            }
            
            var bthList: [T] = []
            try readBTHIndexHelper(hid: header.hidRoot, level: header.bIdxLevels, bthList: &bthList)
            self.bthList = bthList
        }
    }
}
