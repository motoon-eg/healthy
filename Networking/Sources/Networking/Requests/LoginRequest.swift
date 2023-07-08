import Foundation

// MARK: - LoginResponse
public struct LoginResponse: Codable {
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
}

// MARK: - LoginRequest
public struct LoginRequest: RequestType {
    public typealias ResponseType = LoginResponse

    private let email: String
    private let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    public let baseUrl: URL = Constants.mockyBaseUrl
    public let path: String = "ba2feb33-cc78-4f94-908e-a85fb1a1d262"
    public let method: String = "GET"
    public var parameters: [String: String] {
        [
            "email": email,
            "password": password
        ]
    }

    public let responseDecoder: (Data) throws -> LoginResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
