import Combine
import UIKit

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    // MARK: - Properties

    @Published private (set) var savedRecipes: [SavedRecipesTableViewCell.ViewModel] = [
        SavedRecipesTableViewCell.ViewModel(title: "Traditional spare ribs baked ",
                                            recipeImage: UIImage.iconFood,
                                            rating: 4.5,
                                            chefName: "By Chef John",
                                            cookingTime: 15, toggleBookmark: {}),
        SavedRecipesTableViewCell.ViewModel(title: "spice roasted chicken with flavored rice",
                                            recipeImage: UIImage.iconFood,
                                            rating: 5.0,
                                            chefName: "By Mark Kelvin",
                                            cookingTime: 20, toggleBookmark: {})
    ]
}

// MARK: SavedRecipesViewModel

extension SavedRecipesViewModel: SavedRecipesViewModelInput {
    func removeSavedRecipe(_ recipe: SavedRecipesTableViewCell.ViewModel) {
        if let index = savedRecipes.firstIndex(of: recipe) {
            savedRecipes.remove(at: index)
        }
    }
}

// MARK: SavedRecipesViewModelOutput

extension SavedRecipesViewModel: SavedRecipesViewModelOutput {
    var recipesPublisher: any Publisher<[SavedRecipesTableViewCell.ViewModel], Never> {
        $savedRecipes.eraseToAnyPublisher()
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
