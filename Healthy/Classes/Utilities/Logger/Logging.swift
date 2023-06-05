import Foundation

/// The Logging protocol defines a standardized way of logging messages in an application or system.
public protocol Logging {
    func log(_ message: String,
             level: LogLevel,
             file: StaticString,
             function: StaticString,
             line: UInt)
}
