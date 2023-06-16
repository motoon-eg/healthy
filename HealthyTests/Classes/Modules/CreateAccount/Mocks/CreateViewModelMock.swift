@testable import Healthy

final class CreateAccountViewModelMock: CreateAccountViewModelType {
    // MARK: - Methods
    private(set) var updateUsernameCallCount: Int = .zero
    func updateUsername(_ username: String) {
        updateUsernameCallCount += 1
    }

    private(set) var updateEmailCallCount: Int = .zero
    func updateEmail(_ email: String) {
        updateEmailCallCount += 1
    }

    private(set) var updatePasswordCallCount: Int = .zero
    func updatePassword(_ password: String) {
        updatePasswordCallCount += 1
    }

    private(set) var updateConfirmPasswordCallCount: Int = .zero
    func updateConfirmPassword(_ confirmPassword: String) {
        updateConfirmPasswordCallCount += 1
    }

    private(set) var configureButtonEnabledCallCount: Int = .zero
    func configureButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
        configureButtonEnabledCallCount += 1
    }

    private(set) var updateAcceptTermsAndConditionsCallCount: Int = .zero
    func updateAcceptTermsAndConditions(_ accepted: Bool) {
        updateAcceptTermsAndConditionsCallCount += 1
    }
}
