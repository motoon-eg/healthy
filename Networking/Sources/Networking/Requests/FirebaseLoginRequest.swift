import Foundation

// MARK: - FirebaseLoginResponse
public struct FirebaseLoginResponse: Codable {
    let kind, localID, email, displayName: String
    let idToken: String
    let registered: Bool
    let refreshToken, expiresIn: String
}

// MARK: - FirebaseLoginRequest
public struct FirebaseLoginRequest: RequestType {
    public typealias ResponseType = FirebaseLoginResponse
    
    private let email: String
    private let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    public var baseUrl: URL { Constants.firebaseAuth }
    public var path: String { "AIzaSyB0UczrurqM1STyI8tvx4QZVTyQVw4UJ7Q" }
    public var method: String = "POST"
    public var queryParameters: [String: String] {
        [
            "email": email,
            "password": password
        ]
    }
    public var headers: [String : String] {
        [ "Content-Type": "application/json" ]
    }
    
    public let responseDecoder: (Data) throws -> FirebaseLoginResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
}
