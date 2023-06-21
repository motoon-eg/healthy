import XCTest
@testable import Healthy

final class PasswordValidatorTests: XCTestCase {

    // MARK: - Properties

    private var validator: PasswordValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        validator = PasswordValidator()
    }

    // MARK: - Tests

    func test_PasswordValidator_whenHasValidPassword_shouldPass() {
        // Given
        let validPassword = "SecurePassword123"

        // Then
        XCTAssertTrue(validator.hasValidValue(validPassword))
    }

    func test_PasswordValidator_whenHasShortPassword_shouldFail() {
        // Given
        let shortPassword = "Abc"

        // Then
        XCTAssertFalse(validator.hasValidValue(shortPassword))
    }

    func test_PasswordValidator_whenHasLongPassword_shouldFail() {
        // Given
        let longPassword = "Abc123Abc123Abc123Abc123"

        // Then
        XCTAssertFalse(validator.hasValidValue(longPassword))
    }

    func test_PasswordValidator_whenPasswordIsNumericOnly_shouldFail() {
        // Given
        let numericPassword = "123456789"

        // Then
        XCTAssertFalse(validator.hasValidValue(numericPassword))
    }
    func test_PasswordValidator_whenPasswordHasLettersOnly_shouldFail() {
        // Given
        let lettersPassword = "abhjklol;k"

        // Then
        XCTAssertFalse(validator.hasValidValue(lettersPassword))
    }
}
