import Foundation

/// Logging the messages in the file that exists in the file system
final class FileSystemLogger: Logging {
    private var logCache: [String] = []
    private let logFileName = "app.log"
    private let logQueue = DispatchQueue(label: "com.motoon.default-logger", qos: .background, attributes: .concurrent)

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
            assertionFailure("Error writing log to file:\(error)")
        }
    }
}

// MARK: - String+Helpers
private extension String {
    func appendLineToURL(fileURL: URL) throws {
        let data = self + "\n"
        try data.appendToURL(fileURL: fileURL)
    }

    func appendToURL(fileURL: URL) throws {
        if let data = self.data(using: String.Encoding.utf8) {
            if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
                defer {
                    fileHandle.closeFile()
                }
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
            } else {
                try data.write(to: fileURL, options: .atomic)
            }
        }
    }
}
