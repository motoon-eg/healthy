import Combine
import UIKit

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    // MARK: - Properties

    @Published private var savedRecipes: [SavedRecipe] = [
        SavedRecipe(title: "pizza",
                    recipeImageUrl: UIImage.iconNoData,
                    rating: 4,
                    chefName: "sara",
                    cookingTime: 15),
        SavedRecipe(title: "shawrma",
                    recipeImageUrl: UIImage.iconNoData,
                    rating: 5,
                    chefName: "doaa",
                    cookingTime: 20)
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
