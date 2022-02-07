import Foundation

// MARK: - Config

/// A configuration object used to setup a `Logger`.
public struct Config {
    // MARK: Properties

    /// The level at which the `Logger` should be logging messages.
    public let level: Level

    /// Creates a new `Config` object.
    ///
    /// - parameter level: The level at which the `Logger` should be logging messages.
    public init(level: Level) {
        self.level = level
    }
}
