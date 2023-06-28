import Combine
import UIKit

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    // MARK: - Properties

    @Published private (set) var savedRecipes: [SavedRecipe] = [
        SavedRecipe(title: "pizza",
                    recipeImage: UIImage.iconNoData,
                    rating: 4.5,
                    chefName: "sara",
                    cookingTime: 15, toggleBookmark: {}),
        SavedRecipe(title: "shawrma",
                    recipeImage: UIImage.iconNoData,
                    rating: 5.0,
                    chefName: "doaa",
                    cookingTime: 20, toggleBookmark: {})
    ]
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
    var recipesPublisher: any Publisher<[SavedRecipe], Never> {
        $savedRecipes.eraseToAnyPublisher()
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
