import Domain
import Factory

final class DefaultFavoriteRecipeUseCase: FavoriteRecipeUseCase {
    @Injected(\.favoriteRecipeStorage) private var favoriteRecipeStorage

    func favoriteRecipe(_ recipe: Recipe) {
        guard favoriteRecipeStorage.isFavoriteRecipe(recipe) == false else {
            return
        }

        favoriteRecipeStorage.favoriteRecipe(recipe)
    }

    func unfavoriteRecipe(_ recipe: Recipe) {
        favoriteRecipeStorage.unfavoriteRecipe(recipe)
    }

    func allFavoriteRecipes() -> [Recipe] {
        favoriteRecipeStorage.fetchFavoriteRecipes()
    }
}
