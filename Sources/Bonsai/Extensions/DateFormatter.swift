import Foundation

extension DateFormatter {
    static let message: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss.SSS"
        return formatter
    }()
}
