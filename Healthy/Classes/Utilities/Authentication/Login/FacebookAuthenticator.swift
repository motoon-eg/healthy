import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

final class FacebookAuthenticator: Authentication {

    enum Errors: Error {
        case unexpectedResponse
    }

    // MARK: Properties

    private let viewController: UIViewController
    private let loginManager: LoginManager = LoginManager()

    // MARK: Init

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    // MARK: Authentication

    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            loginManager.logIn(permissions: ["email"], from: viewController) { [weak self] result, error in
                guard let self else {
                    return
                }
                guard let tokenString = result?.token?.tokenString else {
                    continuation.resume(throwing: error ?? SignInAuthenticationError.invalidUser)
                    return
                }
                self.getUserData(tokenString: tokenString) { result in
                    continuation.resume(with: result)
                }
            }
        }
    }

    private func getUserData(tokenString: String, completion: @escaping (Result<AuthenticatedUser, Error>) -> Void) {
        let request = FBSDKLoginKit.GraphRequest(
            graphPath: "me",
            parameters: ["fields": "first_name, last_name, email, picture.width(300).height(300)"],
            tokenString: tokenString,
            version: nil,
            httpMethod: .get
        )
        request.start { _, result, error in
            if let error {
                // Handle the error
                print("Graph Request error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            if let result = result as? [String: Any] {
                // Process the response data
                let userID = result["id"] as? String
                let userName = result["name"] as? String
                let userEmail = result["email"] as? String
                // Use the retrieved data as needed
                print("User ID: \(userID ?? "")")
                print("User Name: \(userName ?? "")")
                print("User Email: \(userEmail ?? "")")
                let authenticatedUser = AuthenticatedUser(
                    id: "",
                    name: userName ?? "",
                    email: userEmail ?? "",
                    imageURL: nil
                )
                completion(.success(authenticatedUser))
                return
            }
            completion(.failure(Errors.unexpectedResponse))
        }
    }
}

extension FacebookAuthenticator {
    static func logout() {
        // FB Logout
        let login = FBSDKLoginKit.LoginManager()
        login.logOut()
        FBSDKLoginKit.AccessToken.current = nil
    }
}
