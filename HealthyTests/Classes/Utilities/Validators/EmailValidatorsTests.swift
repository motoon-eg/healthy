import XCTest
@testable import Healthy
final class EmailValidatorsTests: XCTestCase {
    // MARK: - Properties
    var validator: EmailValidator!

    // MARK: - Lifecycle
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
            validator = EmailValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validator = nil
            super.tearDown()

    }

    // MARK: - Tests

    func test_emailValidator_whenEmailIsValid_shouldPass() {
        let validEmail = "calara23@gmail.com"
        XCTAssertTrue(validator.hasValidValue(validEmail))
    }
    func test_emailValidator_whenEmailIsInValid_shouldfailed() {
        let noAtSymbolEmail = "testexample.com"
        XCTAssertFalse(validator.hasValidValue(noAtSymbolEmail))
    }
    func test_emailValidator_whenEmailDoesNotHaveDomain_shouldfailed() {
        let noDomain  = "test@"
        XCTAssertFalse(validator.hasValidValue(noDomain))
    }
    func test_emailValidator_whenEmailHasInValidDomain_shouldfailed() {
        let inValidDomain = "test@example.c"
        XCTAssertFalse(validator.hasValidValue(inValidDomain))
    }
    func test_emailValidator_whenEmailStartWithNumber_shouldfailed() {
        func test_emailValidator_whenEmailHasInValidDomain_shouldfailed() {
            let startsWithNumber = "123test@example.com"
            XCTAssertFalse(validator.hasValidValue(startsWithNumber))
        }

    }
}
