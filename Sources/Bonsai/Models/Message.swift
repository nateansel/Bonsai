import Foundation

// MARK: - MessageError

enum MessageError: LocalizedError {
    case noneLevelNotAllowed

    var errorDescription: String? {
        switch self {
        case .noneLevelNotAllowed:
            return "Messages are not allowed to have a level of `.none`."
                + " Please give this message an accepted level (`.error` or above) and try again."
        }
    }
}

// MARK: - Message

public struct Message {
    // MARK: Public Properties

    /// The domain for this message.
    ///
    /// Typically used to denote the area in a project where this message was
    /// created (e.g. "Sync", "Boot", "Watch").
    public let domain: String

    /// The level at which to log this message.
    ///
    /// This determines if the message should be logged or not given the `Logger`'s
    /// configuration.
    public let level: Level

    /// The value that should be logged in this message.
    public let value: String

    // MARK: Internal Properties

    /// The creation date of this message.
    let created: Date

    // MARK: Initialization

    /// Creates a new `Message` using the provided values.
    ///
    /// - parameters:
    ///   - domain: The domain for this message.
    ///   - level: The logging level of this message.
    ///   - value: The String representation to be logged.
    public init(domain: String, level: Level, value: String) {
        self.init(created: Date(), domain: domain, level: level, value: value)
    }

    /// Creates a new `Message` using the provided values.
    ///
    /// - parameters:
    ///   - created: When this message was created.
    ///   - domain: The domain for this message.
    ///   - level: The logging level of this message.
    ///   - value: The String representation to be logged.
    init(created: Date, domain: String, level: Level, value: String) {
        guard level > .none else { fatalError(MessageError.noneLevelNotAllowed.errorDescription ?? "") }
        self.created = created
        self.domain = domain
        self.level = level
        self.value = value
    }
}

// MARK: - Message:CustomStringConvertible

extension Message: CustomStringConvertible {
    public var description: String {
        "\(DateFormatter.message.string(from: created)): \(level.emoji) - \(domain): \(value)"
    }
}

// MARK: - Message:Equatable

extension Message: Equatable {}
