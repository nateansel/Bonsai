import XCTest
@testable import Bonsai

final class MessageTests: XCTestCase {
    func testInit() {
        let message = Message(domain: "Test", level: .verbose, value: "Message")
        let beforeDateWithForgivness = Date(timeIntervalSinceNow: -2)
        let afterDateWithForgivness = Date(timeIntervalSinceNow: 2)
        XCTAssertLessThanOrEqual(beforeDateWithForgivness, message.created)
        XCTAssertGreaterThanOrEqual(afterDateWithForgivness, message.created)
    }

    func testDescription() {
        let date = DateComponents(
            calendar: .current,
            year: 2022,
            month: 2,
            day: 1,
            hour: 14,
            minute: 13,
            second: 12,
            nanosecond: 11000000).date!
        let message = Message(created: date, domain: "Test", level: .verbose, value: "Message")
        let messageDescription = "2022/02/01 14:13:12.011: 🔍 - Test: Message"
        XCTAssertEqual(message.description, messageDescription)
    }
}
