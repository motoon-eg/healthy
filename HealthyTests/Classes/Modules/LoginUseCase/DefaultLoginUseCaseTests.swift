import XCTest
@testable import Domain
@testable import Networking
@testable import Healthy

final class DefaultLoginUseCaseTests: XCTestCase {
    var loginUseCase: DefaultLoginUseCase!

    override func setUp() {
        super.setUp()
        loginUseCase = DefaultLoginUseCase()
    }

    override func tearDown() {
        loginUseCase = nil
        super.tearDown()
    }

    func testLogin() async throws {
        let email = "test@example.com"
        let password = "password"

        let user = try await loginUseCase.login(email: email, password: password)

        XCTAssertEqual(user.email, "ahmdmhasn@gmail.com")
        XCTAssertEqual(user.tokenID, "12345678")
    }
}
