import UIKit

struct SavedRecipe:Hashable, Equatable {
    
    // MARK: - Properties
    
    let id = UUID()
    
    /// The title of the recipe
    let title: String?
    
    /// A URL string representing the recipe image
    let recipeImageUrl: String?
    
    /// The rating of the recipe in the form of a star rating (out of 5 stars)
    let rating: Int?
    
    /// The name of the user who posted the recipe
    let userName: String?
    
    ///The cooking time of the recipe
    let cookingTime: Int?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: SavedRecipe, rhs: SavedRecipe) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(title: String = "", recipeImageUrl: String = "", rating: Int = 1, userName: String = "", cookingTime: Int = 1) {
        self.title = title
        self.recipeImageUrl = recipeImageUrl
        self.rating = rating
        self.userName = userName
        self.cookingTime = cookingTime
    }

}
