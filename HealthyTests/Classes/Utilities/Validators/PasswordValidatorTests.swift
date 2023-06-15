import XCTest
@testable import Healthy
final class PasswordValidatorTests: XCTestCase {
    // MARK: - Properties
    var validator: PasswordValidator!
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
            validator = PasswordValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validator = nil
             super.tearDown()
    }

    // MARK: - Tests

    func test_PasswordValidator_whenHasValidPassword_shouldPass() {
        let validPassword = "SecurePassword123"
        XCTAssertTrue(validator.hasValidValue(validPassword))
    }
    func test_PasswordValidator_whenHasShortPassword_shouldfailed() {
        let shortPassword = "Abc"
        XCTAssertFalse(validator.hasValidValue(shortPassword))
    }
    func test_PasswordValidator_whenHasLongPassword_shouldfailed() {
        let longPassword = "Abc123Abc123Abc123Abc123"
        XCTAssertFalse(validator.hasValidValue(longPassword))
    }
    func test_PasswordValidator_whenPasswordIsNumericOnly_shouldfailed() {
        let numericPassword = "123456789"
        XCTAssertFalse(validator.hasValidValue(numericPassword))
    }
    func test_PasswordValidator_whenPasswordHasLettersOnly_shouldfailed() {
        let lettersPassword = "abhjklol;k"
        XCTAssertFalse(validator.hasValidValue(lettersPassword))
    }
}
