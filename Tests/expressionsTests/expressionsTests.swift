import XCTest
import LogicKit
@testable import expressions

class expressionsTests: XCTestCase {

    func testToNumber() {
        let expected : Term = List.cons (Value (5), List.cons (Value (1), List.empty))
        XCTAssert (toNumber (51).equals (expected), "toNumber is incorrect")
    }

    static var allTests : [(String, (expressionsTests) -> () throws -> Void)] {
        return [
            ("testToNumber", testToNumber),
        ]
    }

}
