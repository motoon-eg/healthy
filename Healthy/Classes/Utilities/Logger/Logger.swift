import Foundation

final class Logger {
    private static let loggers: [Logging] = {
        if NSClassFromString("XCTest") != nil {
            // Unit-test
            return []
        }
        return [
            FileSystemLogger(),
            NewRelicLogger()
        ]
    }()

    static func logDebug(_ message: String,
                         file: StaticString = #fileID,
                         function: StaticString = #function,
                         line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message,
                       level: .debug,
                       file: file,
                       function: function,
                       line: line)
        }
    }

    static func logInfo(_ message: String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message,
                       level: .info,
                       file: file,
                       function: function,
                       line: line)
        }
    }

    static func logWarn(_ message: String,
                        file: StaticString = #fileID,
                        function: StaticString = #function,
                        line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message,
                       level: .warn,
                       file: file,
                       function: function,
                       line: line)
        }
    }

    static func logVerbose(_ message: String,
                           file: StaticString = #fileID,
                           function: StaticString = #function,
                           line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message,
                       level: .verbose,
                       file: file,
                       function: function,
                       line: line)
        }
    }

    static func logError(_ message: String,
                         file: StaticString = #fileID,
                         function: StaticString = #function,
                         line: UInt = #line) {
        loggers.forEach { logger in
            logger.log(message,
                       level: .error,
                       file: file,
                       function: function,
                       line: line)
        }
    }
}
