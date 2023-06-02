import Foundation
 import GoogleSignIn

enum SingInAuthenticationError: Error {
    case failedToSignIn
}

final class GooglSignInAuthenticatorAdapter: Authentication {

    // MARK: Authentication Methods

    func performLogin(withPresenting viewController: UIViewController) async throws -> AuthenticatedUser {
        return try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { _, error in
                guard error == nil else {
                    continuation.resume(throwing: SingInAuthenticationError.failedToSignIn)
                    return
                }
                continuation.resume(returning: AuthenticatedUser())
            }
        }
    }

}
