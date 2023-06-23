import UIKit

struct SavedRecipe: Hashable {

    // MARK: - Properties

    let id = UUID()
    /// The title of the recipe
    let title: String?

    /// The  image of the recipe
    let recipeImageUrl: UIImage?

    /// The rating of the recipe
    let rating: Int?

    /// The chef  who posted the recipe
    let chefName: String?

    /// The cooking Time of The recipe
    let cookingTime: Int?

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: SavedRecipe, rhs: SavedRecipe) -> Bool {
        return lhs.id == rhs.id
    }

    init(title: String?, recipeImageUrl: UIImage?, rating: Int?, chefName: String?, cookingTime: Int?) {
        self.title = title
        self.recipeImageUrl = recipeImageUrl
        self.rating = rating
        self.chefName = chefName
        self.cookingTime = cookingTime
    }
}
