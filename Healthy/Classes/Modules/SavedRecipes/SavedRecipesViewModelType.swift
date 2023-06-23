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
    var recipesPublisher: AnyPublisher<[SavedRecipe], Error> { get }
    var isEmptyPublisher: AnyPublisher<Bool, Error> { get }
}
