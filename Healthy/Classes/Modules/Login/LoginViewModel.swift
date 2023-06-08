import Foundation
import Combine

final class LoginViewModel {
    private var store = Set<AnyCancellable>()
    @Published private var email: String = ""
    @Published private var password: String = ""
    @Published private var isLoadingState: Bool = false
    @Published private var isShowErrorMessage: String = ""
    @Published private var isLoginEnabled: Bool = false
    @Published private var isLoginStatus: Bool = false
    
//    init() {
//        Publishers.CombineLatest($email, $password)
//            .map { email, password in
//                email.isEmpty == false && password.isEmpty == false
//            }
//            .assign(to: &$isLoginEnabled)
//    }
}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {
    func updateEmail(_ text: String) {
        email = text
    }
    
    func updatePassword(_ text: String) {
        password = text
    }
    
    func login() {
        // TODO: Call networking for login.
    }
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

