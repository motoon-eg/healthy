import Foundation

// MARK: SavedRecipesCellViewModel

final class SavedRecipesCellViewModel {
    
    // MARK: Properties
    
    private let model: SavedRecipe
    
    // MARK: Init
    
    init(model: SavedRecipe) {
        self.model = model
    }
}

// MARK: SavedRecipesCellViewModelInput

extension SavedRecipesCellViewModel: SavedRecipesCellViewModelInput {}

// MARK: SavedRecipesCellViewModelOutput

extension SavedRecipesCellViewModel: SavedRecipesCellViewModelOutput {}

// MARK: Private Handlers

private extension SavedRecipesCellViewModel {}
