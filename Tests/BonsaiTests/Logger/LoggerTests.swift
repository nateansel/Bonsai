import XCTest
@testable import Bonsai

final class LoggerTests: XCTestCase {
    var config: Config!
    var messageCache: MockMessageCache!
    var subject: Logger!

    override func setUp() {
        config = Config(level: .verbose)
        messageCache = MockMessageCache()
        subject = Logger(config: config, cache: messageCache)
    }

    func testInitWithConfig() {
        let config = Config(level: .debug)
        let bonsai = Logger(config: config)

        XCTAssertEqual(bonsai.config.level, config.level)
        XCTAssert(bonsai.cache is DefaultMessageCache)
    }

    func testLogAddsToMessageCache() {
        let message = Message(domain: "Test", level: .error, value: "Message")
        subject.log(message: message)
        XCTAssertEqual(messageCache.messages, [message])
    }

    func testLogIgnoresMessagesAboveConfig() {
        config = Config(level: .warning)
        subject = Logger(config: config, cache: messageCache)
        let message = Message(domain: "Test", level: .verbose, value: "Message")
        subject.log(message: message)
        XCTAssertEqual(messageCache.messages, [])
    }
}

class MockMessageCache: MessageCache {
    var messages: [Message] = []

    func add(_ message: Message) {
        messages.append(message)
    }
}
