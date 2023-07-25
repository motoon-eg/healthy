import Combine

typealias CreateAccountViewModelType = CreateAccountViewModelInput & CreateAccountViewModelOutput

// MARK: CreateAccountViewModelInput
protocol CreateAccountViewModelInput {
    func updateUsername(_ text: String)
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func updateConfirmPassword(_ text: String)
    func updateAcceptTermsAndConditions(_ isChecked: Bool)
    func performSignUp()
}

// MARK: CreateAccountViewModelOutput
protocol CreateAccountViewModelOutput {
    var loadingIndicatorPublisher: AnyPublisher<Bool, Never> { get }
    var errorPublisher: AnyPublisher<Error, Never> { get }
    var registerButtonEnabledPublisher: AnyPublisher<Bool, Never> { get }
}
