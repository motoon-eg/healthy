import GoogleSignIn

enum SignInAuthenticationError: Error {
    case invalidUser
}

final class GoogleSignInAuthenticator: Authentication {
    
    // MARK: Properties
    
    private let viewController: UIViewController
    private let sharedInstance: GIDSignIn = .sharedInstance
    
    
    // MARK: Init
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: Authentication
    
    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            sharedInstance.signIn(withPresenting: viewController) { result, error in
                guard error == nil,
                      let result,
                      let user = result.user.profile,
                      let userID = result.user.userID else {
                    continuation.resume(throwing: SignInAuthenticationError.invalidUser)
                    return
                }
                let authenticatedUser = AuthenticatedUser(
                    id: userID, name: user.name,
                    email: user.email,
                    imageURL: user.imageURL(withDimension: Constants.imageDimensions)
                )
                continuation.resume(returning: authenticatedUser)
            }
        }
    }
}

// MARK: Constants

private extension GoogleSignInAuthenticator {
    enum Constants {
        static let imageDimensions: UInt = 320
    }
}
