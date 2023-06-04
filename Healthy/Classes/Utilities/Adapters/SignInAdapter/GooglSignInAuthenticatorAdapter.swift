import UIKit
import GoogleSignIn

 enum SingInAuthenticationError: Error {
     case failedToSignIn
 }

final class GooglSignInAuthenticatorAdapter: Authentication {
    
    let view  = UIViewController()

    // MARK: Authentication Methods

    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: view) { result, error in
                guard error == nil,
                      let result,
                      let user = result.user.profile else {
                    continuation.resume(throwing: SingInAuthenticationError.failedToSignIn)
                    return
                }
                continuation.resume(returning: AuthenticatedUser(id: result.user.userID, providerType: self,
                                                                 name: user.name, email: user.email))
            }
        }
    }

 }

// MARK: - Constants

private extension GooglSignInAuthenticatorAdapter {
    enum Constatns {
        static let dimension: UInt = 320
    }
}
