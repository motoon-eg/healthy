import Foundation

// MARK: CreateAccountViewModel
final class CreateAccountViewModel {
  private var username: String = ""
  private var email: String = ""
  private var password: String = ""
  private var confirmPassword: String = ""
  private var isChecked: Bool  = false
  private var onButtonEnabled: (Bool) -> Void = { _ in }

  // MARK: Error Messages

  var namePrompt: String {
    if !username.isEmpty && username.isValidName {
      return ""
    } else {
      return "Is not valid name."
    }
  }

  var emailPrompt: String {
    if !email.isEmpty {
      return ""
    } else {
      return "enter a valid email address"
    }
  }

  var passwordPrompt: String {
    if !password.isEmpty {
      return ""
    } else {
      return "must be between 8 and 15 characters"
    }
  }

  var confirmPWPrompt: String {
    if !confirmPassword.isEmpty || confirmPassword == password {
      return ""
    } else {
      return "password fields do not match"
    }
  }
}

// MARK: CreateAccountViewModelInput
// TODO: ... add validation on email & Password
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
    let isUsernameValid = !username.isEmpty && username.isValidName
    let isEmailValid = !email.isEmpty
    let isPasswordValid = !password.isEmpty
    let isConfirmPasswordValid = !confirmPassword.isEmpty && confirmPassword == password
    let isAcceptTermsAndConditionsChecked = (isChecked == true)
    let isButtonEnabled = isUsernameValid && isEmailValid && isPasswordValid
    &&  isConfirmPasswordValid
    && isAcceptTermsAndConditionsChecked

    onButtonEnabled(isButtonEnabled)
  }
}
