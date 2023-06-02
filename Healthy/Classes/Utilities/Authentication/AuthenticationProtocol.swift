import UIKit

public struct AuthenticatedUser {}

 public protocol Authentication {
     func performLogin(withPresenting viewController: UIViewController) async throws -> AuthenticatedUser
 }
