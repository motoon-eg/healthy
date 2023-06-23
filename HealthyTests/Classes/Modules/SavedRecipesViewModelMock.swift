import Combine
@testable import Healthy

class SavedRecipesViewModelMock: SavedRecipesViewModelType {

    var savedRecipesPublisherResult: Result<[SavedRecipe], Never>!
    var removeSavedRecipeResult: Result<Bool, Never>!

    private(set) var removeRecipeCount: Int = .zero
    func removeSavedRecipe(_ recipe: Healthy.SavedRecipe) {
        removeRecipeCount += 1
    }

    var recipesPublisher: AnyPublisher<[Healthy.SavedRecipe], Never> {
        Result.Publisher(savedRecipesPublisherResult)
            .eraseToAnyPublisher()
    }

    var isEmptyPublisher: AnyPublisher<Bool, Never> {
        Result.Publisher(removeSavedRecipeResult)
            .eraseToAnyPublisher()
    }

}
