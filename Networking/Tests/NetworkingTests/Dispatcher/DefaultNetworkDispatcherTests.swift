import Foundation
import XCTest
@testable import Networking

// swiftlint:disable force_unwrapping
final class DefaultNetworkDispatcherTests: XCTestCase {

    // MARK: - Mock Types

    private struct MockRequest: RequestType {
        let baseUrl: URL = URL(string: "https://example.com")!
        let path: String = "/api/endpoint"
        let method: String = "GET"
        let parameters: [String: String] = [:]

        let responseDecoder: (Data) throws -> Int = { data in
            guard let responseString = String(data: data, encoding: .utf8),
                  let responseInt = Int(responseString) else {
                throw NetworkError.invalidResponse
            }
            return responseInt
        }
    }

    // MARK: - Tests

    func testDispatchWithValidRequest() async {
        // Given
        let request = MockRequest()
        let mockData = "42".data(using: .utf8)!
        let mockURLResponse = HTTPURLResponse(
            url: request.baseUrl,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil)!
        let mockSession = URLSessionMock(result: .success((mockData, mockURLResponse)))
        let networkDispatcher = DefaultNetworkDispatcher(session: mockSession)

        // When
        let result = try? await networkDispatcher.dispatch(request)

        // Then
        XCTAssertEqual(result, 42)
    }

    func testDispatchWithInvalidResponse() async throws {
        // Given
        let request = MockRequest()
        let mockData = "invalid".data(using: .utf8)!
        let mockURLResponse = HTTPURLResponse(
            url: request.baseUrl,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil)!
        let mockSession = URLSessionMock(result: .success((mockData, mockURLResponse)))
        let networkDispatcher = DefaultNetworkDispatcher(session: mockSession)

        // When/Then
        // When
        var thrownError: Error?
        do {
            _ = try await networkDispatcher.dispatch(request)
        } catch {
            thrownError = error
        }

        // Then
        XCTAssertEqual(thrownError as? NetworkError, NetworkError.invalidResponse)
    }

    func testDispatchWithNetworkError() async {
        // Given
        let request = MockRequest()
        let mockError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        let mockSession = URLSessionMock(result: .failure(mockError))
        let networkDispatcher = DefaultNetworkDispatcher(session: mockSession)

        // When
        var thrownError: Error?
        do {
            _ = try await networkDispatcher.dispatch(request)
        } catch {
            thrownError = error
        }

        // Then
        XCTAssertEqual(thrownError as? NSError, mockError)
    }

    // MARK: - Mock URLSession

    private struct URLSessionMock: URLSessionProtocol {
        let result: Result<(data: Data, response: URLResponse), Error>

        func data(for request: URLRequest) async throws -> (Data, URLResponse) {
            switch result {
            case let .success(value):
                return value
            case let .failure(error):
                throw error
            }
        }
    }
}
// swiftlint:enable force_unwrapping
