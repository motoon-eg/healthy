import Foundation
import GoogleSignIn

final class GooglSignInAuthenticatorAdapter: Authentication {

    // MARK: Properties

    private let view: UIViewController

    // MARK: Init

    init(view: UIViewController) {
        self.view = view
    }

    // MARK: Authentication Methods

    func signIn(completion: @escaping (Result<String, Error>) -> Void) {
        GIDSignIn.sharedInstance.signIn(withPresenting: view) { _, error in
          guard error == nil else {
              completion(.failure(SingInAuthenticationError.failedToSignIn))
              return
          }
            completion(.success("Successfully Sign-In"))
        }
    }
}
