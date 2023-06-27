import Combine
@testable import Healthy

final class LoginViewModelMock: LoginViewModelType {

    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never> {
        Just(false).eraseToAnyPublisher()
    }

    var isShowErrorMessagePublisher: AnyPublisher<String, Never> {
        Just("").eraseToAnyPublisher()
    }

    var isLoginEnabledPublisher: AnyPublisher<Bool, Never> {
        Just(false).eraseToAnyPublisher()
    }

    var isLoginStatusPublisher: AnyPublisher<Bool, Never> {
        Just(false).eraseToAnyPublisher()
    }

    func updateEmail(_ text: String) {}

    func updatePassword(_ text: String) {}

    func onLoadingIndicator(state: @escaping (Bool) -> Void) {}

    func onErrorMessage(message: @escaping (String) -> Void) {}

    func onButtonEnabled(onEnabled: @escaping (Bool) -> Void) {}

    func onLoginStatus(status: @escaping (Bool) -> Void) {}

    // Forget Password Spy
    private(set) var performForgetPasswordCount: Int = .zero
    func performForgetPassword() {
        performForgetPasswordCount += 1
    }

    // Sign-in Spy
    private(set) var performSignInCallCount: Int = .zero
    func performSignIn() {
        performSignInCallCount += 1
    }

    // Sign-up Spy
    private(set) var performSignUpCallCount: Int = .zero
    func performSignUp() {
        performSignUpCallCount += 1
    }

    // Sign-with social spy
    private(set) var performSocialMediaSignInCount: Int = .zero
    func performSocialMediaSignIn(_ authentication: Healthy.Authentication) {
        performSocialMediaSignInCount += 1
    }
}
