import Combine
import Foundation

// MARK: DashboardViewModel

final class DashboardViewModel {
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
        newRecipes = [
            NewRecipeViewModel(
                recipeName: "",
                userName: "",
                preparationTimeInMinutes: "",
                recipeImageUrl: "",
                rating: .zero,
                userImageUrl: nil
            ),
            NewRecipeViewModel(
                recipeName: "",
                userName: "",
                preparationTimeInMinutes: "",
                recipeImageUrl: "",
                rating: .zero,
                userImageUrl: nil
            ),
            NewRecipeViewModel(
                recipeName: "",
                userName: "",
                preparationTimeInMinutes: "",
                recipeImageUrl: "",
                rating: .zero,
                userImageUrl: nil
            )
        ]
    }
}
