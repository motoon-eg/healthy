import Foundation

final class LoginViewModel {

}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {
    func performSignIn() {}
    func performSignUp() {}
    func performForgetPassword() {}
    func performSignInWithGoogle() {}
    func performSignInWithFacebook() {}
}

// MARK: Output

extension LoginViewModel: LoginViewModelOutput {

}

// MARK: Private Handlers

private extension LoginViewModel {}
