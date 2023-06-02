import Foundation

// MARK: LoginViewModel

final class LoginViewModel {

    // MARK: Properties

    private lazy var authService: Authentication = GooglSignInAuthenticatorAdapter()

}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {

}

// MARK: Output

extension LoginViewModel: LoginViewModelOutput {

}

// MARK: Private Handlers

private extension LoginViewModel {}
