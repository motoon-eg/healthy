import Foundation

typealias CreateAccountviewModelType = CreateAccountViewModelInput & CreateAccountViewModelOutput

// MARK: CreateAccountViewModelInput
protocol CreateAccountViewModelInput {
  func updateUsername(_ text: String)
  func updateEmail(_ text: String)
  func updatePassword(_ text: String)
  func updateConfirmPassword(_ text: String)
  // TODO: configure it using combine
  func updateAcceptTermsAndConditions(_ isChecked: Bool)
}

// MARK: CreateAccountViewModelOutput
protocol CreateAccountViewModelOutput {
  func configureButtonEnabled(onEnabled: @escaping(Bool) -> Void)
}
