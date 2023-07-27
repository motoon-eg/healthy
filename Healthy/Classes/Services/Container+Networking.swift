import Factory
import Networking

extension Container {
    var networking: Factory<NetworkDispatcher> {
        Factory(self) {
            DefaultNetworkDispatcher()
        }
    }
}
