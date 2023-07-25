import Foundation
import Combine
import Factory

// MARK: CreateAccountViewModel
final class CreateAccountViewModel {
    @Injected(\.registerUseCase) private var registerUseCase
    private unowned let coordinator: OnboardingCoordinator
    private var subscriptions = Set<AnyCancellable>()
    
    @Published private var username: String = ""
    @Published private var email: String = ""
    @Published private var password: String = ""
    @Published private var confirmPassword: String = ""
    @Published private var isChecked: Bool = false
    
    @Published private var loadingState: Bool = false
    @Published private var errorSubject = PassthroughSubject<Error, Never>()
    @Published private var registerButtonEnabled: Bool = true
 
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        // TODO: - Need to add validation in text fields.
    }
}

// MARK: CreateAccountViewModelInput
extension CreateAccountViewModel: CreateAccountViewModelInput {
    func updateUsername(_ text: String) {
        username = text
    }

    func updateEmail(_ text: String) {
        email = text
    }

    func updatePassword(_ text: String) {
        password = text
    }

    func updateConfirmPassword(_ text: String) {
        confirmPassword = text
    }

    func updateAcceptTermsAndConditions(_ isChecked: Bool) {
        self.isChecked = isChecked
    }
    
    func performSignUp() {
        Task {
            // show loading
            loadingState = true
            
            defer {
                // dismiss loading
                loadingState = false
            }
            
            do {
                _ = try await registerUseCase.register(
                    email: email,
                    password: password)
                coordinator.didFinishSignIn()
            } catch let error {
                // handle error
                errorSubject.send(error)
            }
        }
    }
}

// MARK: LoginViewModelOutput
extension CreateAccountViewModel: CreateAccountViewModelOutput {
    var loadingIndicatorPublisher: AnyPublisher<Bool, Never> {
        $loadingState.eraseToAnyPublisher()
    }
    
    var errorPublisher: AnyPublisher<Error, Never> {
        errorSubject.eraseToAnyPublisher()
    }
    
    var registerButtonEnabledPublisher: AnyPublisher<Bool, Never> {
        $registerButtonEnabled.eraseToAnyPublisher()
    }
}
