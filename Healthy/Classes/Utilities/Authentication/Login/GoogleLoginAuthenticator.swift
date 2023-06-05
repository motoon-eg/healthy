import GoogleSignIn

enum SignInAuthenticationError: Error {
    case invalidUser
}

final class GoogleSignInAuthenticator: Authentication {

    // MARK: Properties

    let viewController: UIViewController

    // MARK: Init

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    // MARK: Authentication

    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { result, error in
                guard error == nil,
                      let result,
                      let user = result.user.profile,
                      let userID = result.user.userID else {
                    continuation.resume(throwing: SignInAuthenticationError.invalidUser)
                    return
                }
                continuation.resume(returning: AuthenticatedUser(id: userID, name: user.name, email: user.email,
                                                                 pictureURL: user.imageURL(withDimension: Constatns.duration)))
            }
        }
    }

}

// MARK: Constatns

private extension GoogleSignInAuthenticator {
    enum Constatns {
        static let duration: UInt = 320
    }
}
