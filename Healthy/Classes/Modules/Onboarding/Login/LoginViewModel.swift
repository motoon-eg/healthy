import Foundation
import Combine
import Domain
import Factory
import UIKit

final class LoginViewModel {
    @Injected(\.loginUseCase) private var loginUseCase
    private unowned let coordinator: OnboardingCoordinator
    private var subscriptions = Set<AnyCancellable>()
    @Published private var email: String = ""
    @Published private var password: String = ""
    @Published private var isLoadingState: Bool = false
    @Published private var errorSubject = PassthroughSubject<Error, Never>()
    @Published private var isLoginEnabled: Bool = true
    @Published private var isLoginStatus: Bool = false

    // Add a reference to the UIButton that you want to animate
    private weak var signInButton: UIButton?

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        _ = User(email: "ahmdmhasn@gmail.com", tokenID: "12345678")
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
        Task { @MainActor in
            // show loading
            DispatchQueue.main.async {
                self.signInButton?.startAnimating()
            }
            defer {
                // dismiss loading
                DispatchQueue.main.async {
                    self.signInButton?.stopAnimating()
                }
            }
            do {
                _ = try await loginUseCase.login(
                    email: email,
                    password: password)
                self.coordinator.didFinishSignIn()
            } catch {
                // handle error
                print(error)
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
                errorSubject.send(error)
            }
        }
    }
}

// MARK: Output

extension LoginViewModel: LoginViewModelOutput {

    var isLoadingIndicatorPublisher: AnyPublisher<Bool, Never> {
        $isLoadingState.eraseToAnyPublisher()
    }

    var errorPublisher: AnyPublisher<Error, Never> {
        errorSubject.eraseToAnyPublisher()
    }

    var isLoginEnabledPublisher: AnyPublisher<Bool, Never> {
        $isLoginEnabled.eraseToAnyPublisher()
    }

    var isLoginStatusPublisher: AnyPublisher<Bool, Never> {
        $isLoginStatus.eraseToAnyPublisher()
    }
}
