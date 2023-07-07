import Foundation

protocol NetworkRequest {
    associatedtype Response: Decodable

    var baseUrl: URL { get }
    var method: String { get }
    var path: String { get }
    var headers: [String: String] { get }
    var responseDecoder: (Data) throws -> Response { get }
}

extension NetworkRequest {
    var responseDecoder: (Data) throws -> Response {
        return { data in
            return try JSONDecoder().decode(Response.self, from: data)
        }
    }
}

enum APIConstants {
    static let mockyUrl: URL = {
        guard let url = URL(string: "https://run.mocky.io/v3/") else {
            fatalError()
        }
        
        return url
    }()
}

struct LoginResponse: Codable {
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String
    // Additional properties related to the login response

    // Coding keys if the response keys differ from the struct property names
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
}

struct LoginRequest: NetworkRequest {
    let baseUrl: URL = APIConstants.mockyUrl
    let method: String = "GET"
    let path: String = "ba2feb33-cc78-4f94-908e-a85fb1a1d262"
    let headers: [String: String] = [:]
    let responseDecoder: (Data) throws -> LoginResponse = { data in
        try JSONDecoder().decode(Response.self, from: data)
    }
}

protocol NetworkDispatcher {
    func dispatch<Request: NetworkRequest, Response>(
        _ request: Request
    ) async throws -> Response where Request.Response == Response
}

final class DefaultNetworkDispatcher: NetworkDispatcher {
    func dispatch<Request, Response>(
        _ request: Request
    ) async throws -> Response where Request: NetworkRequest, Response == Request.Response {
        let urlRequest = makeUrlRequest(from: request)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return try request.responseDecoder(data)
    }

    private var authorizationHeaders: [String: String] {
        [
            "Token": "Bearer eyJhbGciOiJIUzI1.IiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0Ijox.SflKxwRJSMeK"
        ]
    }
    
    private func makeUrlRequest(from request: any NetworkRequest) -> URLRequest {
        let url = request.baseUrl.appendingPathComponent(request.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.headers.merging(authorizationHeaders) { _, new in new }
        return urlRequest
    }
}
