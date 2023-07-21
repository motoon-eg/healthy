import Foundation
import Combine

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func performSignIn()
    func performSignUp()
    func performForgetPassword()
    func performSocialMediaSignIn(_ authentication: Authentication)
}

protocol LoginViewModelOutput {
    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never> { get }
    var errorPublisher: AnyPublisher<Error, Never> { get }
    var isLoginEnabledPublisher: AnyPublisher<Bool, Never> { get }
    var isLoginStatusPublisher: AnyPublisher<Bool, Never> { get }
}
