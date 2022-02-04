# Bonsai

Bonsai is a simple, yet elegant, logging framework for Swift projects.

Bonsai uses colorful emoji to visually separate the different levels of log messages. This makes it easier to spot warnings and errors when scanning through logs.

Sample log messages created by Bonsai:
```bash
2022/02/03 01:37:49.874: 🚨 - Sync: The server returned a 403 forbidden error when logging in.
2022/02/03 01:39:24.019: ⚠️ - Watch: Heart rate could not be determined.
2022/02/03 01:39:25.184: ℹ️ - Watch: Complication updated successfully.
2022/02/03 01:39:25.663: 🐛 - RecipeListView: SearchBarView size: (16.0, 48.0, 130.0, 19.0)
2022/02/03 01:37:49.874: 🔍 - RecipeListView: SearchBarView text updated to "Sourdough"
```

# Installation

## Swift Package Manager

```swift
.package(url: "https://github.com/nateansel/bonsai.git", from: "1.0.0"),
```

# Usage

Bonsai works by utilizing it's `Logger` objects to log messages from your project.

While most projects will utilize only once instance of `Logger` for the entire project, Bonsai is designed to support multiple loggers in case your project has separate logging needs for different areas of your project.

## Creation

Create a `Logger` with a desired logging level. This logging level determines which messages actually get logged. Any messages that are passed into a `Logger` that does not support that logging level will be ignored.

```swift
let config = Config(level: .verbose)
let logger = Logger(config: config)
```

## Logging

Once a `Logger` has been created, messages can be logged with that logger.

```swift
let message = Message(domain: "Sync", level: .error, "The server returned a 403 forbidden error when logging in.")
logger.log(message)
```

By default, all valid messages passed into a `Logger` are cached and then printed out to the console.

# Attributions

This project was inspired by [this tweet](https://twitter.com/parrots/status/1486731248420593686) by Curtis Herbert, along with the replies to his initial tweet.
