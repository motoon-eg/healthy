import Foundation

/// A protocol representing a network request.
public protocol RequestType {
    /// The type of the response expected from the request.
    associatedtype ResponseType: Decodable

    /// The base URL of the request.
    var baseUrl: URL { get }

    /// The path component of the request URL.
    var path: String { get }

    /// The HTTP method of the request.
    var method: String { get }

    /// The parameters of the request.
    var parameters: [String: String] { get }

    /// The headers of the request.
    var headers: [String: String] { get }

    /// The closure that handles the decoding of the response data.
    var responseDecoder: (Data) throws -> ResponseType { get }
}

extension RequestType {
    /// Default implementation of headers.
    public var headers: [String: String] { [:] }

    /// Default implementation of responseDecoder that uses JSONDecoder to decode the response data.
    public var responseDecoder: (Data) throws -> ResponseType {
        { try JSONDecoder().decode(ResponseType.self, from: $0) }
    }
}
