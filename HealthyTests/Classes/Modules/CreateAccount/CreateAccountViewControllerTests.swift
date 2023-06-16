import XCTest
@testable import Healthy

final class CreateAccountViewControllerTests: XCTestCase {

    // MARK: - Properties
    var sut: CreateAccountViewController!
    var viewModel: CreateAccountViewModelMock!

    // MARK: - Setup and Teardown
    override func setUp() {
        super.setUp()
        viewModel = CreateAccountViewModelMock()
        sut = CreateAccountViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    // MARK: - Tests
    func testOutletsConnected() {
        XCTAssertNotNil(sut.parentVerticalStackView)
        XCTAssertNotNil(sut.nameTextField)
        XCTAssertNotNil(sut.emailTextField)
        XCTAssertNotNil(sut.passwordTextField)
        XCTAssertNotNil(sut.confirmPasswordContainerView)
        XCTAssertNotNil(sut.confirmPasswordTextField)
        XCTAssertNotNil(sut.termsAndConditionsHorizontalStackView)
        XCTAssertNotNil(sut.checkBoxButton)
        XCTAssertNotNil(sut.acceptTermsTextLabel)
        XCTAssertNotNil(sut.signInTextLabel)
        XCTAssertNotNil(sut.signUpButton)
    }

    func testTextFieldEditingChanged() {
        sut.nameTextField.sendActions(for: .editingChanged)
        XCTAssertEqual(viewModel.updateUsernameCallCount, 1)

        sut.emailTextField.sendActions(for: .editingChanged)
        XCTAssertEqual(viewModel.updateEmailCallCount, 1)

        sut.passwordTextField.sendActions(for: .editingChanged)
        XCTAssertEqual(viewModel.updatePasswordCallCount, 1)

        sut.confirmPasswordTextField.sendActions(for: .editingChanged)
        XCTAssertEqual(viewModel.updateConfirmPasswordCallCount, 1)
    }

    func testSignUpButtonTouchUpInside() {
        sut.signUpButton.sendActions(for: .touchUpInside)
    }
}
