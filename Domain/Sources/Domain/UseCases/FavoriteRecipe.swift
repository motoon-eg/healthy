public protocol FavoriteRecipeUseCase {
    func favoriteRecipe(_ recipe: Recipe)
    func unfavoriteRecipe(_ recipe: Recipe)
    func allFavoriteRecipes() -> [Recipe]
}
