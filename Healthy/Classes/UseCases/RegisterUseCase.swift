import Foundation
import Factory
import Domain
import Networking

extension Container {
    var registerUseCase: Factory<RegisterUseCase> {
        Factory(self) {
            DefaultRegisterUseCase()
        }
    }
}

final class DefaultRegisterUseCase: RegisterUseCase {
    
    @Injected(\.networking) private var networking
    
    func register(email: String, password: String) async throws -> Domain.User {
        let request = RegisterRequest(email: email, password: password)
        
        do {
            let response = try await networking.dispatch(request)
            return User(email: response.email, tokenID: response.tokenId)
        } catch {
            throw NSError(domain: "we have error !!!", code: -1)
        }
    }
}

