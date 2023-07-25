import XCTest
@testable import Domain
@testable import Networking
@testable import Healthy

final class DefaultRegisterUseCaseTests: XCTestCase {
    
    // MARK: Properties
    
    private var sut: DefaultRegisterUseCase!

    // MARK: Life cycle
    
    override func setUp() {
        super.setUp()
        sut = DefaultRegisterUseCase()
    }
    
    // MARK: Tests
    
    func testRegister() async throws {
        let email = "test@example.com"
        let password = "password"

        let user = try await sut.register(email: email, password: password)

        XCTAssertEqual(user.email, "test@example.com")
        XCTAssertEqual(user.tokenID, "password")
    }
}
