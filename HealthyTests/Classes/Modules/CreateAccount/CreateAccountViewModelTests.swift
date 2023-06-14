import XCTest
@testable import Healthy

final class CreateAccountViewModelTests: XCTestCase {

    // MARK: - Properties

   private var viewModel: CreateAccountViewModel!

    // MARK: - Lifecycle

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = CreateAccountViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    // MARK: - Tests

    func test_configureButtonEnabled_whenUsernameIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateUsername("")

        // then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func test_configureButtonEnabled_whenEmailIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateEmail("")

        // then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func test_configureButtonEnabled_whenPasswordIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updatePassword("")

        // then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func test_configureButtonEnabled_whenConfirmPasswordIsEmpty_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateConfirmPassword("")

        // then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func test_configureButtonEnabled_whenAcceptTermsAndConditionsIsUnchecked_shouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateAcceptTermsAndConditions(false)

        // then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func test_OnButtonEnabled_whenUsernameAndEmailAndPasswordAndconfirmPasswordAndAcceptTermsIsCorrect() {
        // Given
        var isEnabled: Bool?
        viewModel.configureButtonEnabled { isEnabled = $0 }

        // When
        viewModel.updateUsername("esraa")
        viewModel.updateEmail("esraakh400@gmail.com")
        viewModel.updatePassword("Ss2030##")
        viewModel.updateConfirmPassword("Ss2030##")
        viewModel.updateAcceptTermsAndConditions(true)

        // then
        XCTAssertTrue(isEnabled == true)
    }
}
