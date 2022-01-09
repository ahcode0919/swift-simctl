    import XCTest
    @testable import SwiftSimctl

    final class SimctlTests: XCTestCase {
        func testSimctl() {
            let simctl = Simctl()
            XCTAssertNotNil(simctl)
        }
    }
