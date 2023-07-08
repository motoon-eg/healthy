import Foundation

/// A protocol representing a URLSession with async data fetching capabilities.
public protocol URLSessionProtocol {
    /// Fetches the data and URL response for the given request.
    /// - Parameters:
    ///   - request: The URL request to be sent.
    /// - Returns: A tuple containing the retrieved data and the URL response.
    /// - Throws: An error if an error occurs during the network request.
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

/// Extension to make URLSession conform to URLSessionProtocol.
extension URLSession: URLSessionProtocol {}
