import Foundation
import Combine

final class LoginViewModel {
    private unowned let coordinator: OnboardingCoordinator
    private var subscriptions = Set<AnyCancellable>()
    @Published private var email: String = ""
    @Published private var password: String = ""
    @Published private var isLoadingState: Bool = false
    @Published private var isShowErrorMessage: String = ""
    @Published private var isLoginEnabled: Bool = true
    @Published private var isLoginStatus: Bool = false

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: Input

extension LoginViewModel: LoginViewModelInput {

    func updateEmail(_ text: String) {
        email = text
    }

    func updatePassword(_ text: String) {
        password = text
    }

    func performSignIn() {
        // Sending API Request
        // Caching User
        // Did complete signIn
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            DispatchQueue.main.async {
                self.coordinator.didFinishSignIn()
            }
        }
    }

    func performSignUp() { }
    func performForgetPassword() { }

    func performSocialMediaSignIn(_ authentication: Authentication) {
        Task {
            do {
                // Loading
                let authenticatedUser = try await authentication.performLogin()
                print(authenticatedUser)
                // End loading
            } catch {
                // Show error
            }
        }
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
