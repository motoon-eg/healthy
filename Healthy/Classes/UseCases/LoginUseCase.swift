import Domain
import Networking
import Factory
import Foundation

extension Container {
    var loginUseCase: Factory<LoginUseCase> {
        Factory(self) {
            DefaultLoginUseCase()
        }
    }
}

final class DefaultLoginUseCase: LoginUseCase {

    @Injected(\.networking) private var networking

    func login(email: String, password: String) async throws -> User {
        // TODO: replace mock Request with Actual Request
        let request = LoginRequest(email: email, password: password)
        do {
            _ = try await networking.dispatch(request)
            return User(email: "ahmdmhasn@gmail.com", tokenID: "12345678")

        } catch {
            // If Error
            throw NSError(domain: "Some Error", code: -1)
        }
    }
}
