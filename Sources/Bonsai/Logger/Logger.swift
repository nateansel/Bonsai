import Foundation

// MARK: - Logger

/// An object that handles log messages.
public class Logger {
    // MARK: Properties

    /// The cache for all of this `Logger`'s messages.
    let cache: MessageCache

    /// The configuration for this `Logger`.
    let config: Config

    // MARK: Initialization

    /// Creates a new `Loggger` with the given configuration.
    ///
    /// - parameter config: The configuration that this logger should be setup with.
    public convenience init(config: Config) {
        self.init(config: config, cache: DefaultMessageCache())
    }

    /// Creates a new `Logger` with the given configuration and cache.
    ///
    /// - parameter config: The configuration that this logger should be setup with.
    /// - parameter cache: The caching object that should back all of this `Logger`'s messages.
    init(config: Config, cache: MessageCache) {
        self.config = config
        self.cache = cache
    }

    // MARK: Methods

    /// If the message's level is allowed with this `Logger`'s configuration, than the message
    /// is cached and output to the console.
    ///
    /// - parameter message: The message to log.
    public func log(message: Message) {
        guard message.level <= config.level else { return }
        cache.add(message)
        print(message)
    }
}
