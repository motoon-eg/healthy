@available(iOS 13.0.0, *)
public protocol RegisterUseCase {
    func register(email: String, password: String) async throws -> User
}
