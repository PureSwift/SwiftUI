import XCTest
@testable import SwiftUI

final class SwiftUITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftUI().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
