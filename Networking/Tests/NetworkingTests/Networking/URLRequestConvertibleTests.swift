import XCTest
@testable import Networking

// swiftlint:disable force_unwrapping
final class URLRequestConvertibleTests: XCTestCase {

    // MARK: - Mock Types

    private struct MockTargetType: TargetType {
        var baseUrl: URL = URL(string: "https://example.com")!
        var path: String = "api/endpoint"
        var method: String = "GET"
        var queryParameters: [String: String] = [:]
        var headers: [String: String] = [:]
        var bodyParameters: [String: Any] = [:]
    }

    // MARK: - Tests

    func testAsURLRequestWithValidTargetType() {
        // Given
        var targetType = MockTargetType()
        targetType.baseUrl = URL(string: "https://example.com")!
        targetType.queryParameters = ["param1": "value1"]
        targetType.bodyParameters = [:]
        targetType.headers = ["Content-Type": "application/json"]

        // When
        let urlRequest = try? targetType.asURLRequest()

        // Then
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://example.com/api/endpoint?param1=value1")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?["Content-Type"], "application/json")
        XCTAssertEqual(urlRequest?.httpBody, nil)
    }

    func testAsURLRequestWithEmptyQueryParameters() {
        // Given
        var targetType = MockTargetType()
        targetType.queryParameters = [:]

        // When
        let urlRequest = try? targetType.asURLRequest()

        // Then
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://example.com/api/endpoint")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields, [:])
        XCTAssertEqual(urlRequest?.httpBody, nil)
    }

    func testAsURLRequestWithBodyParameters() {
        // Given
        var targetType = MockTargetType()
        targetType.method = "POST"
        targetType.headers["Content-Type"] = "application/x-www-form-urlencoded"
        targetType.queryParameters = ["param2": "value2"]
        targetType.bodyParameters = ["key2": "value2"]

        // When
        let urlRequest = try? targetType.asURLRequest()

        // Then
        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.absoluteString, "https://example.com/api/endpoint?param2=value2")
        XCTAssertEqual(urlRequest?.httpMethod, "POST")
        XCTAssertEqual(urlRequest?.allHTTPHeaderFields?["Content-Type"], "application/x-www-form-urlencoded")

        let expectedJson = ["key2": "value2"]
        let expectedBodyData = try? JSONSerialization.data(withJSONObject: expectedJson, options: [])
        XCTAssertEqual(urlRequest?.httpBody, expectedBodyData)
    }
}
// swiftlint:enable force_unwrapping
