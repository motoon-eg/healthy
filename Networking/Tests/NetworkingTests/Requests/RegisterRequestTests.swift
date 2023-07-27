import XCTest
@testable import Networking

final class RegisterRequestTests: XCTestCase {

    // MARK: - Tests
    func testRegisterRequestProperties() {
        // Given
        let email = "test@example.com"
        let password = "newPassword"
        let registerRequest = RegisterRequest(email: email, password: password)

        // Then
        XCTAssertEqual(registerRequest.baseUrl, Constants.firebaseAuth)
        XCTAssertEqual(registerRequest.path, "/accounts:signInWithPassword?key=\(Constants.firebaseKey)")
        XCTAssertEqual(registerRequest.method, "POST")
    }

    func testRegisterRequestResponseDecoder() throws {
        // Given
        let registerResponseAsString = """
        {
          "idToken": "[ID_TOKEN]",
          "email": "test@example.com",
          "refreshToken": "[REFRESH_TOKEN]",
          "expiresIn": "3600",
          "localId": "tRcfmLH7..."
        }
        """
        let registerRequest = RegisterRequest(email: "test@example.com", password: "newPassword")

        // When
        let registerResponseData = try XCTUnwrap(registerResponseAsString.data(using: .utf8))
        let registerResponse = try? registerRequest.responseDecoder(registerResponseData)

        // Then
        XCTAssertNotNil(registerResponse)
        XCTAssertEqual(registerResponse?.email, "test@example.com")
        XCTAssertEqual(registerResponse?.expiresIn, "3600")
    }
}
