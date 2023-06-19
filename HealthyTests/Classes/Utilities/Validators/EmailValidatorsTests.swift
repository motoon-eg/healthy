import XCTest
@testable import Healthy

final class EmailValidatorsTests: XCTestCase {

    // MARK: - Properties

    var validator: EmailValidator!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
            validator = EmailValidator()
    }

    // MARK: - Tests

    func test_emailValidator_whenEmailIsValid_shouldPass() {
            // Given
            let validEmail = "calara23@gmail.com"

            // Then
            XCTAssertTrue(validator.hasValidValue(validEmail))
        }

    func test_emailValidator_whenEmailIsInValid_shouldFail() {
           // Given
           let noAtSymbolEmail = "testexample.com"

           // Then
           XCTAssertFalse(validator.hasValidValue(noAtSymbolEmail))
       }

    func test_emailValidator_whenEmailDoesNotHaveDomain_shouldFail() {
           // Given
           let noDomain  = "test@"

           // Then
           XCTAssertFalse(validator.hasValidValue(noDomain))
       }

    func test_emailValidator_whenEmailHasInValidDomain_shouldFail() {
            // Given
            let inValidDomain = "test@example.c"

            // Then
            XCTAssertFalse(validator.hasValidValue(inValidDomain))
        }

    func test_emailValidator_whenEmailStartWithNumbershouldFail() {
            // Given
            let startsWithNumber = "123test@example.com"

            // Then
            XCTAssertFalse(validator.hasValidValue(startsWithNumber))
        }
}
