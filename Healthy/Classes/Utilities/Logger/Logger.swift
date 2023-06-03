import Foundation

final class Logger {
    private static let cachLogger = FileSystemLogger()
    private static let logger: Logging = {
        class NoOpLogger: Logging {
            func log(_ message: String,
                     level: LogLevel,
                     file: StaticString,
                     function: StaticString,
                     line: UInt) {
                // NO-OP
            }
        }
        
        if NSClassFromString("XCTest") != nil
        {
            // Unit-test
            return NoOpLogger()
        }
        
        return cachLogger
    }()

        static func logDebug(_ message: String,
                             file: StaticString = #fileID,
                             function: StaticString = #function,
                             line: UInt = #line) {
            logger.log(message,
                       level: .debug,
                       file: file,
                       function: function,
                       line: line)
        }

        static func logInfo(_ message: String,
                            file: StaticString = #fileID,
                            function: StaticString = #function,
                            line: UInt = #line) {
            logger.log(message,
                       level: .info,
                       file: file,
                       function: function,
                       line: line)
        }

        static func logWarn(_ message: String,
                            file: StaticString = #fileID,
                            function: StaticString = #function,
                            line: UInt = #line) {
            logger.log(message,
                       level: .warn,
                       file: file,
                       function: function,
                       line: line)
        }

        static func logVerbose(_ message: String,
                               file: StaticString = #fileID,
                               function: StaticString = #function,
                               line: UInt = #line) {
            logger.log(message,
                       level: .verbose,
                       file: file,
                       function: function,
                       line: line)
        }

        static func logError(_ message: String,
                             file: StaticString = #fileID,
                             function: StaticString = #function,
                             line: UInt = #line) {
            logger.log(message,
                       level: .error,
                       file: file,
                       function: function,
                       line: line)
        }
    }


