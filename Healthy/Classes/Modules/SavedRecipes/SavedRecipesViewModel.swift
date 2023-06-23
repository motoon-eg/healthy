import UIKit
import Combine

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    // MARK: - Properties
   internal var savedRecipes: [SavedRecipe] = []
   private(set) var subscriptions = Set<AnyCancellable>()
   private let savedRecipesSubject = PassthroughSubject<[SavedRecipe], Never>()
   private let isEmptySubject = PassthroughSubject<Bool, Never>()

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

    var recipesPublisher: AnyPublisher<[SavedRecipe], Never> {
        savedRecipesSubject.eraseToAnyPublisher()
    }

    var isEmptyPublisher: AnyPublisher<Bool, Never> {
        isEmptySubject.eraseToAnyPublisher()
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
