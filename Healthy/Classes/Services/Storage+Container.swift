import Factory
import Storage

// MARK: Storage Container

extension Container {
    var favoriteRecipeStorage: Factory<FavoriteRecipeStorage> {
        Factory(self) {
            DefaultFavoriteRecipeStorage(coreDataWrapper: self.coreDataWrapper())
        }
    }
}
