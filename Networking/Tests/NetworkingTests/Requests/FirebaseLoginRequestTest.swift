import XCTest
@testable import Networking

final class FirebaseLoginRequestTests: XCTestCase {

    func testFirebaseLoginRequestProperties() {
        // Given
        let email = "test@example.com"
        let password = "secretpassword"
        let loginRequest = FirebaseLoginRequest(email: email, password: password)

        // Then
        XCTAssertEqual(loginRequest.baseUrl, Constants.firebaseAuth)
        XCTAssertEqual(loginRequest.path, "/v1/accounts:signInWithPassword")
        XCTAssertEqual(loginRequest.method, "POST")
        XCTAssertEqual(loginRequest.queryParameters, [
            "key": Constants.fireBaseAuthKey
        ])
        XCTAssertEqual(loginRequest.headers, [
            "Content-Type": "application/json"
        ])
    }

    func testFirebaseLoginRequestBody() {
        // Given
        let email = "test@example.com"
        let password = "secretpassword"
        let loginRequest = FirebaseLoginRequest(email: email, password: password)

        // When
        let requestBody = loginRequest.requestBody

        // Then
        XCTAssertEqual(requestBody["email"] as? String, email)
        XCTAssertEqual(requestBody["password"] as? String, password)
        XCTAssertEqual(requestBody["returnSecureToken"] as? Bool, true)
    }

    func testFirebaseLoginRequestResponseDecoder() throws {
        // Given
        let loginResponseAsString = """
        {
            "kind": "identitytoolkit#VerifyPasswordResponse",
            "localId": "1234567890",
            "email": "test@example.com",
            "displayName": "John Doe",
            "idToken": "abcdefghijk",
            "registered": true,
            "refreshToken": "qrstuvwxyz",
            "expiresIn": "3600"
        }
        """
        let loginRequest = FirebaseLoginRequest(email: "test@example.com", password: "secretpassword")

        // When
        let loginResponseData = try XCTUnwrap(loginResponseAsString.data(using: .utf8))
        guard let loginResponse = try? loginRequest.responseDecoder(loginResponseData) else { return }
        // Then
        XCTAssertNotNil(loginResponse)
        XCTAssertEqual(loginResponse.kind, "identitytoolkit#VerifyPasswordResponse")
        XCTAssertEqual(loginResponse.localID, "1234567890")
        XCTAssertEqual(loginResponse.email, "test@example.com")
        XCTAssertEqual(loginResponse.displayName, "John Doe")
        XCTAssertEqual(loginResponse.idToken, "abcdefghijk")
        XCTAssertEqual(loginResponse.registered, true)
        XCTAssertEqual(loginResponse.refreshToken, "qrstuvwxyz")
        XCTAssertEqual(loginResponse.expiresIn, "3600")
    }
}
