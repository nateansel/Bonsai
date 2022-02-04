import XCTest
@testable import Bonsai

final class DateFormatterTests: XCTestCase {
    func testMessageDateFormatter() {
        let date = DateComponents(
            calendar: .current,
            year: 2022,
            month: 2,
            day: 1,
            hour: 14,
            minute: 13,
            second: 12,
            nanosecond: 11000000).date!
        XCTAssertEqual(DateFormatter.message.string(from: date), "2022/02/01 14:13:12.011")
    }
}
