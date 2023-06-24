@testable import Healthy
import Combine
import UIKit

final class SavedRecipesViewModelMock: SavedRecipesViewModelType {
    
    // MARK: - Properties

    private let recipesSubject = PassthroughSubject<[SavedRecipe], Never>()

    private(set) var removeRecipesCallCount: Int = .zero
    func removeSavedRecipe(_ recipe: Healthy.SavedRecipe) {
        removeRecipesCallCount += 1
    }

    var recipesPublisher: any Publisher<[Healthy.SavedRecipe], Never> {
        recipesSubject.eraseToAnyPublisher()
    }

    func sendRecipes(_ recipes: [SavedRecipe]) {
        recipesSubject.send(recipes)
    }
}
