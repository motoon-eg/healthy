public protocol LoginUseCase {
    func login(email: String, password: String) async throws -> User
}
