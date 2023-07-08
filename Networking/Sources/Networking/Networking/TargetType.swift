import Foundation

/// A protocol representing a network request.
public protocol TargetType {
    /// The base URL of the request.
    var baseUrl: URL { get }

    /// The path component of the request URL.
    var path: String { get }

    /// The HTTP method of the request.
    var method: String { get }

    /// The query parameters of the request.
    var queryParameters: [String: String] { get }

    /// The body parameters of the request.
    var bodyParameters: [String: Any] { get }

    /// The headers of the request.
    var headers: [String: String] { get }
}

extension TargetType {
    /// Default implementation of headers.
    public var headers: [String: String] { [:] }

    /// Default implementation of query parameters.
    public var queryParameters: [String: String] { [:] }

    /// Default implementation of body parameters.
    public var bodyParameters: [String: Any] { [:] }
}
