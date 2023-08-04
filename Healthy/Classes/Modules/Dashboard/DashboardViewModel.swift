import Combine
import Domain
import Foundation
import Factory

// MARK: DashboardViewModel

final class DashboardViewModel {
    @Injected(\.favoriteRecipeUseCase) private var favoriteRecipeUseCase

    @Published private var newRecipes: [NewRecipeViewModel] = []

    init() {
        loadPlaceholderNewRecipes()
    }
}

// MARK: DashboardViewModel

extension DashboardViewModel: DashboardViewModelInput {}

// MARK: DashboardViewModelOutput

extension DashboardViewModel: DashboardViewModelOutput {
    var header: HomeHeaderView.ViewModel {
        .init(title: "", subtitle: "", imageUrl: URL(string: "www.google.com"))
    }

    var newRecipesPublisher: any Publisher<[NewRecipeViewModel], Never> {
        $newRecipes
    }
}

// MARK: Private Handlers

private extension DashboardViewModel {
    private func loadPlaceholderNewRecipes() {
        let recipes = [
            Recipe(recipeId: "first-recipe",
                   title: "First Recipe"),
            Recipe(recipeId: "second-recipe",
                   title: "Second Recipe"),
            Recipe(recipeId: "third-recipe",
                   title: "Third Recipe")
        ]

        newRecipes = recipes.map { recipe in
            NewRecipeViewModel(
                recipeName: recipe.title ?? String(),
                userName: recipe.userName ?? String(),
                preparationTimeInMinutes: recipe.preparationTime?.description ?? String(),
                recipeImageUrl: recipe.recipeImageUrl,
                rating: recipe.rating,
                userImageUrl: recipe.userImageUrl,
                onTap: { [weak self] in
                    self?.favoriteRecipeUseCase.favoriteRecipe(recipe)
                }
            )
        }
    }
}
