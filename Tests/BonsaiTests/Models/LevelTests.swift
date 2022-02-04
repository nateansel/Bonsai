import XCTest
@testable import Bonsai

final class LevelTests: XCTestCase {
    func testEquatable() {
        XCTAssertEqual(Level.none, .none)
        XCTAssertEqual(Level.error, .error)
        XCTAssertEqual(Level.warning, .warning)
        XCTAssertEqual(Level.info, .info)
        XCTAssertEqual(Level.debug, .debug)
        XCTAssertEqual(Level.verbose, .verbose)
    }

    func testNotEquatable() {
        XCTAssertNotEqual(Level.none, .error)
        XCTAssertNotEqual(Level.none, .warning)
        XCTAssertNotEqual(Level.none, .info)
        XCTAssertNotEqual(Level.none, .debug)
        XCTAssertNotEqual(Level.none, .verbose)

        XCTAssertNotEqual(Level.error, .none)
        XCTAssertNotEqual(Level.error, .warning)
        XCTAssertNotEqual(Level.error, .info)
        XCTAssertNotEqual(Level.error, .debug)
        XCTAssertNotEqual(Level.error, .verbose)

        XCTAssertNotEqual(Level.warning, .none)
        XCTAssertNotEqual(Level.warning, .error)
        XCTAssertNotEqual(Level.warning, .info)
        XCTAssertNotEqual(Level.warning, .debug)
        XCTAssertNotEqual(Level.warning, .verbose)

        XCTAssertNotEqual(Level.info, .none)
        XCTAssertNotEqual(Level.info, .error)
        XCTAssertNotEqual(Level.info, .warning)
        XCTAssertNotEqual(Level.info, .debug)
        XCTAssertNotEqual(Level.info, .verbose)

        XCTAssertNotEqual(Level.debug, .none)
        XCTAssertNotEqual(Level.debug, .error)
        XCTAssertNotEqual(Level.debug, .warning)
        XCTAssertNotEqual(Level.debug, .info)
        XCTAssertNotEqual(Level.debug, .verbose)

        XCTAssertNotEqual(Level.verbose, .none)
        XCTAssertNotEqual(Level.verbose, .error)
        XCTAssertNotEqual(Level.verbose, .warning)
        XCTAssertNotEqual(Level.verbose, .info)
        XCTAssertNotEqual(Level.verbose, .debug)
    }

    func testComparable() {
        XCTAssert(Level.none < .error)
        XCTAssert(Level.error < .warning)
        XCTAssert(Level.warning < .info)
        XCTAssert(Level.info < .debug)
        XCTAssert(Level.debug < .verbose)
    }

    func testEmoji() {
        XCTAssertEqual(Level.none.emoji, "")
        XCTAssertEqual(Level.error.emoji, "🚨")
        XCTAssertEqual(Level.warning.emoji, "⚠️")
        XCTAssertEqual(Level.info.emoji, "ℹ️")
        XCTAssertEqual(Level.debug.emoji, "🐛")
        XCTAssertEqual(Level.verbose.emoji, "🔍")
    }
}
