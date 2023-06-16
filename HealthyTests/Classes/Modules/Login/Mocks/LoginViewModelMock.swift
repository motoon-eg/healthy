@testable import Healthy
import Combine

final class LoginViewModelMock: LoginViewModelType {

    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never>

    var isShowErrorMessagePublisher: AnyPublisher<String, Never>

    var isLoginEnabledPublisher: AnyPublisher<Bool, Never>

    var isLoginStatusPublisher: AnyPublisher<Bool, Never>

    init?() {return nil}
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

    // Sign-in with Google Spy
    private(set) var performSignInWithGoogleCallCount: Int = .zero
    func performSignInWithGoogle() {
        performSignInWithGoogleCallCount += 1
    }

    // Sign-with Facebook Spy
    private(set) var performSignInWithFacebookCallCount: Int = .zero
    func performSignInWithFacebook() {
        performSignInWithFacebookCallCount += 1
    }
 }
