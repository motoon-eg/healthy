import Foundation

// MARK: - RegisterResponse
public struct RegisterResponse: Codable {
    let idToken, email, refreshToken, expiresIn: String
    let localID: String

    enum CodingKeys: String, CodingKey {
        case idToken, email, refreshToken, expiresIn
        case localID = "localId"
    }
}

// MARK: - RegisterRequest
public struct RegisterRequest: RequestType {
    public typealias ResponseType = RegisterResponse

    private let email: String
    private let password: String
    private let returnSecureToken: Bool
    
    public init(email: String, password: String, returnSecureToken: Bool = true) {
        self.email = email
        self.password = password
        self.returnSecureToken = returnSecureToken
    }

    public var baseUrl: URL { Constants.firebaseAuth }
    public var path: String { "/accounts:signInWithPassword?key=\(Constants.firebaseKey)" }
    public var method: String = "POST"
    public var queryParameters: [String: Any] {
        [
            "email": email,
            "password": password,
            "returnSecureToken": returnSecureToken
        ]
    }

    public let responseDecoder: (Data) throws -> RegisterResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
