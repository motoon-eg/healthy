import Foundation

final class LoginViewModel {
    private var email: String = ""
    private var password: String = ""
    private var onLoadingState: (Bool) -> Void = { _ in }
    private var onErrorMessage: (String) -> Void = { _ in }
    private var onButtonEnabled: (Bool) -> Void = { _ in }
    private var onLoginStatus: (Bool) -> Void = { _ in }
}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {
    func updateEmail(_ text: String) {
        email = text
        updateStateButton()
    }
    
    func updatePassword(_ text: String) {
        password = text
        updateStateButton()
    }
    
    func login() {
        // TODO: Call networking for login.
    }
}

// MARK: Output

extension LoginViewModel: LoginViewModelOutput {
    func bindLoadingIndicator(state: @escaping (Bool) -> Void) {
        onLoadingState = state
    }
    
    func bindErrorMessage(message: @escaping (String) -> Void) {
        onErrorMessage = message
    }
    
    func bindButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
        onButtonEnabled = onEnabled
        updateStateButton()
    }
    
    func bindLoginStatus(status: @escaping (Bool) -> Void) {
        onLoginStatus = status
    }
}

// MARK: Private Handlers

private extension LoginViewModel {
    func updateStateButton() {
        // TODO: [HL-22] Create validator with ability to validate email & password.
        let emailIsValid = !email.isEmpty
        let passwordIsValid = !password.isEmpty && password.count >= 6
        let buttonIsEnabled = emailIsValid && passwordIsValid
        
        onButtonEnabled(buttonIsEnabled)
    }
}
