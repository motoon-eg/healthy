import Foundation
import Combine

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func performSignIn()
    func performSignUp()
    func performForgetPassword()
    func performSignInWithGoogle()
    func performSignInWithFacebook()
}

protocol LoginViewModelOutput {
    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never> { get }
    var isShowErrorMessagePublisher: AnyPublisher<String, Never> { get }
    var isLoginEnabledPublisher: AnyPublisher<Bool, Never> { get }
    var isLoginStatusPublisher: AnyPublisher<Bool, Never> { get }
}
