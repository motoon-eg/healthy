import Foundation

// MARK: CreateAccountViewModel
final class CreateAccountViewModel {
    private var username: String = ""
    private var email: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""
    private var isChecked: Bool  = false
    private var onButtonEnabled: (Bool) -> Void = { _ in }
}

// MARK: CreateAccountViewModelInput
extension CreateAccountViewModel: CreateAccountViewModelInput {
    func updateUsername(_ text: String) {
        username = text
        updateEnabledStateButton()
    }

    func updateEmail(_ text: String) {
        email = text
        updateEnabledStateButton()
    }

    func updatePassword(_ text: String) {
        password = text
        updateEnabledStateButton()
    }

    func updateConfirmPassword(_ text: String) {
        confirmPassword = text
        updateEnabledStateButton()
    }

    func updateAcceptTermsAndConditions(_ isChecked: Bool) {
        self.isChecked = isChecked
        updateEnabledStateButton()
    }
}

// MARK: LoginViewModelOutput
extension CreateAccountViewModel: CreateAccountViewModelOutput {
    func configureButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
        onButtonEnabled = onEnabled
        updateEnabledStateButton()
    }
}

// MARK: Private Handlers
private extension CreateAccountViewModel {
    func updateEnabledStateButton() {
        let isUsernameValid = !username.isEmpty
        // TODO: [HL-20] Add email validator
        let isEmailValid = !email.isEmpty
        let isPasswordValid = !password.isEmpty && PasswordValidator().hasValidValue(password)
        let isConfirmPasswordValid = !confirmPassword.isEmpty && confirmPassword == password

        let isButtonEnabled = isUsernameValid && isEmailValid && isPasswordValid
            && isConfirmPasswordValid
            && isChecked
        onButtonEnabled(isButtonEnabled)
    }
}
