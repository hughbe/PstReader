import XCTest
import MAPI
@testable import PstReader

final class PerformanceTests: XCTestCase {
    func testPerformance() throws {
        let data = try getData(name: "hughbe/backup")
        guard #available(iOS 13.0, *) else {
            return
        }
        
        measure(metrics: [XCTClockMetric(), XCTCPUMetric(), XCTMemoryMetric()]) {
            let pst = try! PstFile(data: data)
            let _ = pst.rootFolder?.description
        }
    }
    
    static var allTests = [
        ("testPerformance", testPerformance)
    ]
}
