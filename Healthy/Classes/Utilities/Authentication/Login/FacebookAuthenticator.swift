import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class FacebookAuthenticator: Authentication {
    
    // MARK: Properties
    
    private let viewController: UIViewController
    private let loginManager: LoginManager = LoginManager()
    
    // MARK: Init
    
    init(viewController: UIViewController?? = nil) {
        self.viewController = (viewController ?? CreateAccountViewController(viewModel: CreateAccountViewModel()))!
    }
    
    // MARK: Authentication
    
    func performLogin() async throws -> AuthenticatedUser {
        try await withCheckedThrowingContinuation { continuation in
            loginManager.logIn(permissions: ["email"], from: viewController) { result, error in
                guard error == nil,
                      let user = Profile.current,
                      let userID = Profile.current?.userID
                else {
                    continuation.resume(throwing: SignInAuthenticationError.invalidUser)
                    return
                }
                
                let authenticatedUser = AuthenticatedUser(
                    id: userID, name: user.name!,
                    email: user.email!,
                    imageURL: user.imageURL(forMode: Profile.PictureMode(rawValue: 0) ?? .square, size: Constants.imageDimensions)
                )
                continuation.resume(returning: authenticatedUser)
                self.getFBUserData(credential: "\(result as Any)")
            }
            
        }
    }
 
    func getFBUserData(credential: String) {
        guard let accessToken = FBSDKLoginKit.AccessToken.current else { return }
        let graphRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                      parameters: ["fields":
                                                                    "first_name, last_name, email,  age_range, gender, picture.width(300).height(300)"],
                                                      tokenString: accessToken.tokenString,
                                                      version: nil,
                                                      httpMethod: .get)
        graphRequest.start { (_, result, error) -> Void in
            if error == nil {
                debugPrint(result as Any)
                guard result is [String: Any] else {return}
                print("Facebook User details from FB: \(String(describing: result))")
            } else {
                debugPrint(error as Any)
            }
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

// MARK: Constants

private extension FacebookAuthenticator {
    enum Constants {
        static let imageDimensions: CGSize = CGSize(width: 300, height: 300)
    }
}
