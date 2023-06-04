import Foundation

public struct AuthenticatedUser {
    let id: String?
    let providerType: Authentication
    let name: String
    let email: String
}
