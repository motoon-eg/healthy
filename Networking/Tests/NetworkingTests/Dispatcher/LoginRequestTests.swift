import XCTest
@testable import Networking

final class LoginRequestTests: XCTestCase {

    func testLoginRequestProperties() {
        // Given
        let email = "test@example.com"
        let password = "secretpassword"
        let loginRequest = LoginRequest(email: email, password: password)

        // Then
        XCTAssertEqual(loginRequest.baseUrl, Constants.mockyBaseUrl)
        XCTAssertEqual(loginRequest.path, "ba2feb33-cc78-4f94-908e-a85fb1a1d262")
        XCTAssertEqual(loginRequest.method, "GET")
        XCTAssertEqual(loginRequest.queryParameters, [
            "email": email,
            "password": password
        ])
    }

    func testLoginRequestResponseDecoder() throws {
        // Given
        let loginResponseAsString = """
        {
            "access_token": "abc123",
            "expires_in": 3600,
            "refresh_token": "def456"
        }
        """
        let loginRequest = LoginRequest(email: "test@example.com", password: "secretpassword")

        // When
        let loginResponseData = try XCTUnwrap(loginResponseAsString.data(using: .utf8))
        let loginResponse = try? loginRequest.responseDecoder(loginResponseData)

        // Then
        XCTAssertNotNil(loginResponse)
        XCTAssertEqual(loginResponse?.accessToken, "abc123")
        XCTAssertEqual(loginResponse?.expiresIn, 3600)
        XCTAssertEqual(loginResponse?.refreshToken, "def456")
    }
}
