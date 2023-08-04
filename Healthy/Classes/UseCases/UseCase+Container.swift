import Factory
import Domain

extension Container {
    var loginUseCase: Factory<LoginUseCase> {
        Factory(self) { DefaultLoginUseCase() }
    }

    var favoriteRecipeUseCase: Factory<FavoriteRecipeUseCase> {
        Factory(self) { DefaultFavoriteRecipeUseCase() }
    }
}
