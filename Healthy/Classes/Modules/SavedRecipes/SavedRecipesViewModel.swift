import UIKit
import Combine

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {
    
    // MARK: - Properties
   private var savedRecipes: [SavedRecipe] = []
    
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

extension SavedRecipesViewModel: SavedRecipesViewModelOutput {}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
