import Combine

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {
    
    //MARK: - Properties
    
    var savedRecipes: [SavedRecipe] = []
}

// MARK: SavedRecipesViewModel

extension SavedRecipesViewModel: SavedRecipesViewModelInput {
    func removeSavedRecipe(_ recipe: SavedRecipe) {
        if let index = savedRecipes.firstIndex(of: recipe) {
            savedRecipes.remove(at: index)
        }
    }
}

// MARK: SavedRecipesViewModelOutput

extension SavedRecipesViewModel: SavedRecipesViewModelOutput {
    var recipesPublisher: any Publisher<[SavedRecipe], Error> {
        <#code#>
    }
    
    var isEmptyPublisher: any Publisher<Bool, Error> {
        <#code#>
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
