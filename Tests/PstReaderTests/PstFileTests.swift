//
//  OutlookPstFileTests.swift
//
//
//  Created by Hugh Bellamy on 16/09/2020.
//

import XCTest
@testable import PstReader

final class OutlookPstFileTests: XCTestCase {
    func testExample() throws {
        do {
            let data = try getData(name: "backup")
            let pst = try PstFile(data: data)
            print(pst)
        }
    }

    private func getData(name: String) throws -> Data {
        let url = URL(forResource: name, withExtension: "pst")
        return try Data(contentsOf: url)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
