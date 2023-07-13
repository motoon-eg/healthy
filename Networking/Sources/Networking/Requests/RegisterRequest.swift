import Foundation

// MARK: - RegisterResponse
public struct RegisterResponse: Decodable {
    let email: String
    let password: String
    let returnSecureToken: Bool
}

// MARK: - RegisterRequest
public struct RegisterRequest: RequestType {
    public typealias ResponseType = RegisterResponse

    private let email: String
    private let password: String

    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    public var baseUrl: URL { Constants.firebaseAuth }
    public var path: String { "/accounts:signInWithPassword?key=AIzaSyB0UczrurqM1STyI8tvx4QZVTyQVw4UJ7Q" }
    public var method: String = "POST"
    public var queryParameters: [String: Any] {
        [
            "email": email,
            "password": password,
            "returnSecureToken": true
        ]
    }

    public let responseDecoder: (Data) throws -> RegisterResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
