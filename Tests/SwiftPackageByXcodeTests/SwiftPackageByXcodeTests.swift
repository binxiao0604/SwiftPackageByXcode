import XCTest
@testable import SwiftPackageByXcode

final class SwiftPackageByXcodeTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPackageByXcode().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
