@testable import Healthy

final class LoginViewModelMock: LoginViewModelType {
    // Forget Password Spy
    private(set) var performForgetPasswordCount: Int = .zero
    func performForgetPassword() {
        performForgetPasswordCount += 1
    }

    // Sign-in Spy
    private(set) var performSignInCallCount: Int = .zero
    func performSignIn() {
        performSignInCallCount += 1
    }

    // Sign-up Spy
    private(set) var performSignUpCallCount: Int = .zero
    func performSignUp() {
        performSignUpCallCount += 1
    }
}
