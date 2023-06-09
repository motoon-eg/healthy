public protocol Authentication {
     func performLogin() async throws -> AuthenticatedUser
 }
