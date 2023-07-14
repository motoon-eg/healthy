@testable import Healthy
import Combine
import UIKit

final class SavedRecipesViewModelMock: SavedRecipesViewModelType {

    // MARK: - Properties
    private let recipesSubject = PassthroughSubject<[SavedRecipesTableViewCell.ViewModel], Never>()

   // MARK: - Methods
    private(set) var removeRecipesCallCount: Int = .zero
    func removeSavedRecipe(_ recipe: Healthy.SavedRecipesTableViewCell.ViewModel) {
        removeRecipesCallCount += 1
    }

    var recipesPublisher: any Publisher<[Healthy.SavedRecipesTableViewCell.ViewModel], Never> {
        recipesSubject.eraseToAnyPublisher()
    }

    func sendRecipes(_ recipes: [SavedRecipesTableViewCell.ViewModel]) {
        recipesSubject.send(recipes)
    }
}
