import Foundation
import UIKit
import FBSDKLoginKit

// Provide AppID
class FacebookAuthenticator: NSObject {
    static func loginWithFacebookId(view: UIViewController,
                                    completion: @escaping (_ error: Error?, _ _credential: String?, _ _result: [String: Any]?) -> Void) {
        let fbLoginManager: LoginManager = LoginManager()
        fbLoginManager.logIn(permissions: ["email"], from: view) { (result, error) in
            guard error == nil else {
                completion(error, nil, nil)
                return
            }
            if result?.isCancelled ?? false {
                completion(nil, nil, [:])
            } else {
                self.getFBUserData(credential: "\(result as Any)") { response in
                    completion(nil, "\(result as Any)", response)
                }
            }
        }
    }
    static func getFBUserData(credential: String, completion: @escaping ([String: Any]) -> Void) {
        guard let accessToken = FBSDKLoginKit.AccessToken.current else { return }
        let graphRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                      parameters: ["fields":
                                                            "first_name, last_name, email,age_range, gender,picture.width(300).height(300)"],
                                                      tokenString: accessToken.tokenString,
                                                      version: nil,
                                                      httpMethod: .get)
        graphRequest.start { (_, result, error) -> Void in
            if error == nil {
                debugPrint(result as Any)
                guard let result = result as? [String: Any] else {return}
                completion(result)
            } else {
                debugPrint(error as Any)
            }
        }
    }
}
