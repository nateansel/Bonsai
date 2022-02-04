import Foundation

// MARK: - Level

/// How `Message`s are categorized, and how `Logger` determines which messages to log and
/// which to ignore.
public enum Level: Int {
    // MARK: Cases

    /// This value should be used exclusively in `Logger` configuration when you want all
    /// messages to be ignored. Using this value when creating a `Message` will result in
    /// an error.
    case none = 0

    /// An error message, with an emoji representation of 🚨.
    ///
    /// Used to mark errors that occur in a project.
    ///
    /// E.g. Syncing errors.
    case error = 1

    /// A warning, with an emoji representation of ⚠️.
    ///
    /// Typically used to warn a developer of undesired results before an error occurs.
    ///
    /// E.g. The server returning a `500` error before your networking code retries that
    /// request.
    case warning = 2

    /// General information, with an emoji representation of ℹ️.
    ///
    /// Anything that isn't used exclusively for debugging but that should be included in
    /// general logging.
    case info = 3

    /// Used for debugging purposes, with an emoji representation of 🐛.
    ///
    /// Might be used to log network request sending and recieving, view reloading, or
    /// user interactions.
    case debug = 4

    /// Used for logging everything that might want to be logged, with an emoji representation
    /// of 🔍.
    ///
    /// Used when logging anything not described in the other cases.
    case verbose = 5

    // MARK: Properties

    /// An emoji representation of this level. This is used to more easily scan logs to
    /// find messages of certain levels.
    public var emoji: String {
        switch self {
        case .none: return ""
        case .error: return "🚨"
        case .warning: return "⚠️"
        case .info: return "ℹ️"
        case .debug: return "🐛"
        case .verbose: return "🔍"
        }
    }
}

// MARK: - Level:Comparable

extension Level: Comparable {
    public static func < (lhs: Level, rhs: Level) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

// MARK: - Level:Equatable

extension Level: Equatable {}
