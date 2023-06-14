@testable import Healthy

final class CreateAccountViewModelMock: CreateAccountViewModelType {

    // MARK: - Properties
    var updateUsernameCalled = false
    var updateEmailCalled = false
    var updatePasswordCalled = false
    var updateConfirmPasswordCalled = false

    // MARK: - Methods
    func updateUsername(_ username: String) {
        updateUsernameCalled = true
    }
    func updateEmail(_ email: String) {
        updateEmailCalled = true
    }
    func updatePassword(_ password: String) {
        updatePasswordCalled = true
    }
    func updateConfirmPassword(_ confirmPassword: String) {
        updateConfirmPasswordCalled = true
    }
    func configureButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
    }
    func updateAcceptTermsAndConditions(_ accepted: Bool) {
    }
}
