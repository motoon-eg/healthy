import Combine
/// SavedRecipes Input & Output
///
typealias SavedRecipesViewModelType = SavedRecipesViewModelInput & SavedRecipesViewModelOutput

/// SavedRecipes ViewModel Input
///
protocol SavedRecipesViewModelInput {
    func removeSavedRecipe(_ recipe: SavedRecipesTableViewCell.ViewModel)
}

/// SavedRecipes ViewModel Output
///
protocol SavedRecipesViewModelOutput {
    var recipesPublisher: any Publisher<[SavedRecipesTableViewCell.ViewModel], Never> { get }
}
