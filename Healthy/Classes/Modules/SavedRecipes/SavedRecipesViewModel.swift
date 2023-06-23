import UIKit
import Combine

// MARK: SavedRecipesViewModel

final class SavedRecipesViewModel {

    // MARK: - Properties

    var savedRecipes: [SavedRecipe] = [] {
        didSet {
            recipesSubject.send(savedRecipes)
            isEmptySubject.send(savedRecipes.isEmpty)
        }
    }
    internal var recipesSubject = PassthroughSubject<[SavedRecipe], Error>()
    internal var isEmptySubject = PassthroughSubject<Bool, Error>()
    private var subscriptions = Set<AnyCancellable>()
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
    var recipesPublisher: AnyPublisher<[SavedRecipe], Error> {
        recipesSubject.eraseToAnyPublisher()
    }

    var isEmptyPublisher: AnyPublisher<Bool, Error> {
        isEmptySubject.eraseToAnyPublisher()
    }
}

// MARK: Private Handlers

private extension SavedRecipesViewModel {}
