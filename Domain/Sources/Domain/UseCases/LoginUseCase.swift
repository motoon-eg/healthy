@available(iOS 13.0.0, *)
public protocol LoginUseCase {
    func login(email: String, password: String) async throws -> User
}
