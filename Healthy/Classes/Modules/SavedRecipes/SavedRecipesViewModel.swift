import Combine
import UIKit
import Factory

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    typealias CellViewModel = SavedRecipesTableViewCell.ViewModel

    @Injected(\.favoriteRecipeUseCase) private var favoriteRecipeUseCase

    // MARK: - Properties

    @Published private(set) var savedRecipes: [CellViewModel] = []
}

// MARK: SavedRecipesViewModel

extension SavedRecipesViewModel: SavedRecipesViewModelInput {
    func removeSavedRecipe(_ recipe: SavedRecipesTableViewCell.ViewModel) {
        if let index = savedRecipes.firstIndex(of: recipe) {
            savedRecipes.remove(at: index)
        }
    }

    func viewWillAppear() {
        reloadSavedRecipes()
    }
}

// MARK: SavedRecipesViewModelOutput

extension SavedRecipesViewModel: SavedRecipesViewModelOutput {
    var recipesPublisher: any Publisher<[SavedRecipesTableViewCell.ViewModel], Never> {
        $savedRecipes.eraseToAnyPublisher()
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {
    private func reloadSavedRecipes() {
        let recipes = favoriteRecipeUseCase.allFavoriteRecipes()
        savedRecipes = recipes.map { recipe in
            CellViewModel(title: recipe.title,
                          recipeImage: UIImage.iconFood,
                          rating: Double(recipe.rating ?? .zero),
                          chefName: recipe.userName,
                          cookingTime: recipe.preparationTime) { [weak self] in
                self?.favoriteRecipeUseCase.unfavoriteRecipe(recipe)
                self?.reloadSavedRecipes()
            }
        }
    }
}
