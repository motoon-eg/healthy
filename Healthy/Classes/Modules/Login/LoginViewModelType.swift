import Foundation

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func login()
}

protocol LoginViewModelOutput {
    func bindLoadingIndicator(state: @escaping (Bool) -> Void)
    func bindErrorMessage(message: @escaping (String) -> Void)
    func bindButtonEnabled(onEnabled: @escaping (Bool) -> Void)
    func bindLoginStatus(status: @escaping (Bool) -> Void)
}
