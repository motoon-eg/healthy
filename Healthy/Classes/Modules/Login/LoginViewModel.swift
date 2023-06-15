import Foundation
import Combine

final class LoginViewModel {
    private var subscriptions = Set<AnyCancellable>()
    @Published private var email: String = ""
    @Published private var password: String = ""
    @Published private var isLoadingState: Bool = false
    @Published private var isShowErrorMessage: String = ""
    @Published private var isLoginEnabled: Bool = false
    @Published private var isLoginStatus: Bool = false
}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {
    func updateEmail(_ text: String) {
        email = text
    }
    
    func updatePassword(_ text: String) {
        password = text
    }

    func performSignIn() { }
    func performSignUp() { }
    func performForgetPassword() { }
    func performSignInWithGoogle() { }
    func performSignInWithFacebook() { }
}

// MARK: Output

extension LoginViewModel: LoginViewModelOutput {
    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never> {
        $isLoadingState.eraseToAnyPublisher()
    }
    
    var isShowErrorMessagePublisher: AnyPublisher<String, Never> {
        $isShowErrorMessage.eraseToAnyPublisher()
    }
    
    var isLoginEnabledPublisher: AnyPublisher<Bool, Never> {
        $isLoginEnabled.eraseToAnyPublisher()
    }
    
    var isLoginStatusPublisher: AnyPublisher<Bool, Never> {
        $isLoginStatus.eraseToAnyPublisher()
    }
}

