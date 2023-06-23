import Combine

/// SavedRecipes Input & Output
///
typealias SavedRecipesViewModelType = SavedRecipesViewModelInput & SavedRecipesViewModelOutput

/// SavedRecipes ViewModel Input
///
protocol SavedRecipesViewModelInput {
    func removeSavedRecipe(_ recipe: SavedRecipe)
}

/// SavedRecipes ViewModel Output
///
protocol SavedRecipesViewModelOutput {
    var recipesPublisher: any Publisher<[SavedRecipe], Never> { get }
}
