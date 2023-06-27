import Foundation
import NewRelic

final class NewRelicLogger: Logging {
    private func convertToNewRelicLoggerLevel(form level:
                                              LogLevel) -> UInt32 {
        switch level {
        case .debug:
            return 0
        case .error:
            return 1 << 0
        case .warn:
            return 1 << 1
        case .info:
            return 1 << 2
        case .verbose:
            return 1 << 3
        }
    }

    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt) {
        NRLogger.log(convertToNewRelicLoggerLevel(form: level),
                     inFile: String(describing: file),
                     atLine: UInt32(line),
                     inMethod: String(describing: function),
                     withMessage: String(message))
    }
}
