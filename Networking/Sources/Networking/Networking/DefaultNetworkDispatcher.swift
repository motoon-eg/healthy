import Foundation

/// The default implementation of the NetworkDispatcher protocol.
public final class DefaultNetworkDispatcher: NetworkDispatcher {
    private let session: URLSession

    private var defaultHeaders: [String: String] {
        [
            "Accept-Language": "en-US",
        ]
    }

    /// Initializes the DefaultNetworkDispatcher with an optional URLSession instance.
    /// - Parameter session: The URLSession instance to use for network requests. If not provided, a shared URLSession will be used.
    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func dispatch<Request: RequestType>(_ request: Request) async throws -> Request.ResponseType {
        let urlRequest = makeUrlRequest(of: request)
        let (data, _) = try await session.data(for: urlRequest)
        return try request.responseDecoder(data)
    }

    private func makeUrlRequest(of request: any RequestType) -> URLRequest {
        let fullPath = request.baseUrl.appendingPathComponent(request.path)
        var urlRequest = URLRequest(url: fullPath)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.headers.merging(defaultHeaders, uniquingKeysWith: { old, _ in old })

        return urlRequest
    }
}
