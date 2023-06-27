import Foundation
import NewRelic

final class NewRelicLogger: Logging {
    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt) {
      
        let attributes: [String : Any] = [
            "message": "\(level) - \(file) - \(function) - \(line) - \(message)",
            "level": level,
            "file": String(describing: file),
            "function": String(describing: function),
            "line": line
        ]
        
        NewRelic.recordCustomEvent("logEvents",
                                   attributes: attributes)
    }
}
