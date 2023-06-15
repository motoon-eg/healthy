import XCTest
@testable import Healthy

final class LoginViewModelTest: XCTestCase {

    // MARK: Properties

    private var viewModel: LoginViewModel!

    // MARK: Lifecycle

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = LoginViewModel()
    }

    // MARK: Tests

    func test_onButtonEnabled_whenEmailAndPasswordIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.onButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("")
        viewModel.updatePassword("")

        // Then
        XCTAssertFalse(isEnabled == true)
    }

    func test_onButtonEnabled_whenEmailOnlyIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.onButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("")
        viewModel.updatePassword("sample password")

        // Then
        XCTAssertFalse(isEnabled == true)
    }

    func test_onButtonEnabled_whenPasswordOnlyIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.onButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("sample email")
        viewModel.updatePassword("")

        // Then
        XCTAssertFalse(isEnabled == true)
    }

    func test_onButtonEnabled_whenPasswordLessThan6Digit_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.onButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("sample email")
        viewModel.updatePassword("123")

        // Then
        XCTAssertFalse(isEnabled == true)
    }

    func test_onButtonEnabled_whenEmailAndPasswordIsCorrect_shouldBeEnabled() {
        // Given
        var isEnabled: Bool?
        viewModel.onButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("sample email")
        viewModel.updatePassword("sample password")

        // Then
        XCTAssertTrue(isEnabled == true)
    }
}
