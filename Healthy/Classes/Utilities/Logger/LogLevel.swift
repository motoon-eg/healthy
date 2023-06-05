/// A level of logging severity.
///
/// Use the `LogLevel` enum to specify the severity of a log message. The available log levels are:
public enum LogLevel {
    /// Detailed information that can help with debugging.
    case verbose

    /// Information that is useful for debugging.
    case debug

    /// General information about the application's state or functionality.
    case info

    /// An indication that something unexpected or undesirable happened, but the application can continue to function.
    case warn

    /// An indication that something unexpected or undesirable happened and the application cannot continue to function as intended.
    case error
}
