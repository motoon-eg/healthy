import Foundation
final class FileSystemLogger: Logging {
    private var logCache: [String] = []
    private let logFileName = "app.log"
    private let logQueue = DispatchQueue(label: "", qos: .background, attributes: .concurrent)
    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt) {
        let timestamp = DateFormatter.localizedString(from: Date(),
                                                      dateStyle: .medium,
                                                      timeStyle: .medium)
        let logMessage = "\(timestamp) - \(level) - \(file) - \(function) - \(line)"
        logCache.append(logMessage)
        logQueue.async {  [weak self] in self?.flushLogCache()}
        print(logMessage)
    }
    private func flushLogCache() {
        guard let logURL = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?.appendingPathComponent(logFileName) else {
            print("Error getting log URL")
            return
        }
        do {
            let logString = logCache.joined(separator: "\n")
            try logString.appendLineToURL(fileURL: logURL)
            logCache.removeAll()
        } catch {
            print("Error writing log to file:\(error)")
        }
    }
}
