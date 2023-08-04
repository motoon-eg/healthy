import Factory
import Storage
import Networking

// MARK: - Services Container

extension Container {
    var networking: Factory<NetworkDispatcher> {
        Factory(self) { DefaultNetworkDispatcher() }
    }

    var coreDataWrapper: Factory<CoreDataWrapping> {
        Factory(self) { CoreDataWrapper(modelName: "CoreDataModel") }
    }
}
