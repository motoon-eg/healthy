import Foundation
public protocol Logging {
    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt)
}
