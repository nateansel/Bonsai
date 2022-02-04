import XCTest
@testable import Bonsai

final class DefaultMessageCacheTests: XCTestCase {
    var subject: DefaultMessageCache!

    override func setUp() {
        subject = DefaultMessageCache()
    }

    func testAdd() {
        let message = Message(domain: "Test", level: .verbose, value: "Message")
        subject.add(message)
        XCTAssertEqual(subject.messages, [message])
    }
}
