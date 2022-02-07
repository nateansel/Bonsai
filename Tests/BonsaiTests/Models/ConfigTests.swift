import XCTest
@testable import Bonsai

final class ConfigTests: XCTestCase {
    func testInit() {
        let subject = Config(level: .info)
        XCTAssertEqual(subject.level, .info)
    }
}
