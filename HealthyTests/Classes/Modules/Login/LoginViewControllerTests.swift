import XCTest
@testable import Healthy

final class LoginViewControllerTests: XCTestCase {

    // MARK: Properties

    private var loginViewModelMock: LoginViewModelMock!
    private var sut: LoginViewController!

    // MARK: Lifcycle

    override func setUp() {
        loginViewModelMock = LoginViewModelMock()
        sut = LoginViewController(viewModel: loginViewModelMock)
        sut.loadViewIfNeeded()
    }

    // MARK: TextFields tests

    func test_whenLoginViewControllerCreated_shouldHasEmptyEmailTextField() throws {
        // When
        let emailTextField = try XCTUnwrap(sut.emailTextField)

        // Then
        XCTAssertEqual(emailTextField.text, "")
    }

    func test_whenLoginViewControllerCreated_shouldHasEmptyPasswordTextField() throws {
        // When
        let passowrdTextField = try XCTUnwrap(sut.passwordTextField)

        // Then
        XCTAssertEqual(passowrdTextField.text, "")
    }

    // MARK: Button tests

    func test_whenLoginViewControllerCreated_shouldHasSignInButtonAndAction() throws {
        // Given
        let signInButton: UIButton = try XCTUnwrap(sut.signInButton)

        // When
        let signInButtonActions = try XCTUnwrap(
            signInButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        )

        // Then
        XCTAssertEqual(signInButtonActions.count, 1)
        XCTAssertEqual(signInButtonActions.first, "didTapSignIn:")
    }

    func test_whenLoginViewControllerCreated_shouldHasSignUpButtonAndAction() throws {
        // Given
        let signUpButton = try XCTUnwrap(sut.signUpButton)

        // When
        let signUpButtonActions = try XCTUnwrap(
            signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        )

        // Then
        XCTAssertEqual(signUpButtonActions.count, 1)
        XCTAssertEqual(signUpButtonActions.first, "didTapSignUp:")
    }

    func test_whenLoginViewControllerCreated_shouldHasForgetPasswordButtonAndAction() throws {
        // Given
        let forgetPasswordButton = try XCTUnwrap(sut.forgetPasswordButton)

        // When
        let forgetPasswordButtonActions = try XCTUnwrap(
            forgetPasswordButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        )

        // Then
        XCTAssertEqual(forgetPasswordButtonActions.count, 1)
        XCTAssertEqual(forgetPasswordButtonActions.first, "didTapForgetPassword:")
    }

    func test_whenLoginViewControllerCreated_shouldHasSignInWithGoogleButtonAndAction() throws {
        // Given
        let signInWithGoogleButton = try XCTUnwrap(sut.signInWithGoogleButton)

        // When
        let signInWithGoogleButtonActions = try XCTUnwrap(
            signInWithGoogleButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        )

        // Then
        XCTAssertEqual(signInWithGoogleButtonActions.count, 1)
        XCTAssertEqual(signInWithGoogleButtonActions.first, "didTapSignInWithGoogle:")
    }

    func test_whenLoginViewControllerCreated_shouldHasSignInWithFacebookButtonAndAction() throws {
        // Given
        let signInWithFacebookButton = try XCTUnwrap(sut.forgetPasswordButton)

        // When
        let signInWithFacebookButtonActions = try XCTUnwrap(
            signInWithFacebookButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        )

        // Then
        XCTAssertEqual(signInWithFacebookButtonActions.count, 1)
        XCTAssertEqual(signInWithFacebookButtonActions.first, "didTapForgetPassword:")
    }

    func test_didTapSignIn_shouldCallViewModelPerformSignIn() {
        // When
        sut.didTapSignIn(UIButton())

        // Then
        XCTAssertEqual(loginViewModelMock.performSignInCallCount, 1)
    }

    func test_didTapSignUp_shouldCallViewModelPerformSignUp() {
        // When
        sut.didTapSignUp(UIButton())

        // Then
        XCTAssertEqual(loginViewModelMock.performSignUpCallCount, 1)
    }

    func test_didTapForgetPassword_shouldCallViewModelPerformForgetPassword() {
        // When
        sut.didTapForgetPassword(UIButton())

        // Then
        XCTAssertEqual(loginViewModelMock.performForgetPasswordCount, 1)
    }

    func test_didTapSignInWithGoogle_shouldCallViewModelPerformSignInWithGoogle() {
        // When
        sut.didTapSignInWithGoogle(UIButton())

        // Then
        XCTAssertEqual(loginViewModelMock.performSignInWithGoogleCallCount, 1)
    }

    func test_didTapSignInWithFacebook_shouldCallViewModelPerformSignInWithFacebook() {
        // When
        sut.didTapSignInWithFacebook(UIButton())

        // Then
        XCTAssertEqual(loginViewModelMock.performSignInWithFacebookCallCount, 1)
    }

}
