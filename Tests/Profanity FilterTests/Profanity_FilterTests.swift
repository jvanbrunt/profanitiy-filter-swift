import XCTest
@testable import Profanity_Filter

final class Profanity_FilterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Profanity_Filter().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
