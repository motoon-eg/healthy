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
        XCTAssertTrue(viewModel.updateUsernameCalled)

        sut.emailTextField.sendActions(for: .editingChanged)
        XCTAssertTrue(viewModel.updateEmailCalled)

        sut.passwordTextField.sendActions(for: .editingChanged)
        XCTAssertTrue(viewModel.updatePasswordCalled)

        sut.confirmPasswordTextField.sendActions(for: .editingChanged)
        XCTAssertTrue(viewModel.updateConfirmPasswordCalled)
    }

    func testSignUpButtonTouchUpInside() {
        sut.signUpButton.sendActions(for: .touchUpInside)
//        XCTAssertFalse(viewModel.didTapSignUpCalled)
    }
}
