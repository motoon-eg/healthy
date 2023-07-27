import Foundation

public protocol URLRequestConvertible {
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertible where Self: TargetType {
    public func asURLRequest() throws -> URLRequest {
        let fullPath = baseUrl.appendingPathComponent(path)
        var urlComponents = URLComponents(url: fullPath, resolvingAgainstBaseURL: true)

        // Set query parameters if any
        if !queryParameters.isEmpty {
            urlComponents?.queryItems = queryParameters.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }

        guard let url = urlComponents?.url else {
            throw NetworkError.invalidURL
        }

        // Set body data if any
        var httpBody: Data?
        if !bodyParameters.isEmpty {
            httpBody = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = httpBody

        return urlRequest
    }
}
