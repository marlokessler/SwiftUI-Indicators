import XCTest
@testable import Indicators

final class IndicatorsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Indicators().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
