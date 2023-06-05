import GoogleSignIn

 enum SingInAuthenticationError: Error {
     case invalidUser
 }

final class GooglSignInAuthenticator: Authentication {

    private let viewController: UIViewController

    init(viewController: UIViewController!) {
        self.viewController = viewController
    }

    // MARK: Authentication Methods

    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
                guard error == nil,
                      let result,
                      let userID = result.user.userID,
                      let user = result.user.profile else {
                    continuation.resume(throwing: SingInAuthenticationError.invalidUser)
                    return
                }
                continuation.resume(returning: AuthenticatedUser(id: userID, name: user.name, email: user.email,
                                                                 pictureURL: user.imageURL(withDimension: Constatns.dimension)))
            }
        }
    }

 }

// MARK: - Constants

private extension GooglSignInAuthenticator {
    enum Constatns {
        static let dimension: UInt = 320
    }
}
