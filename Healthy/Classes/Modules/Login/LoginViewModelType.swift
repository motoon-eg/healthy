import Foundation

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func performSignIn()
    func performSignUp()
    func performForgetPassword()
    func performSignInWithGoogle()
    func performSignInWithFacebook()
}

protocol LoginViewModelOutput {
    func onLoadingIndicator(state: @escaping (Bool) -> Void)
    func onErrorMessage(message: @escaping (String) -> Void)
    func onButtonEnabled(onEnabled: @escaping (Bool) -> Void)
    func onLoginStatus(status: @escaping (Bool) -> Void)
}
