import Foundation

protocol MessageCache {
    func add(_ message: Message)
}

class DefaultMessageCache: MessageCache {
    var messages: [Message] = []

    func add(_ message: Message) {
        messages.append(message)
    }
}
