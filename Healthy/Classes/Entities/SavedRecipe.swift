import UIKit

struct SavedRecipe: Hashable, Equatable {

    // MARK: - Properties

    let id = UUID()
    /// The title of the recipe
    let title: String?

    /// The  image of the recipe
    let recipeImage: UIImage?

    /// The rating of the recipe
    let rating: Double?

    /// The chef  who posted the recipe
    let chefName: String?

    /// The cooking Time of The recipe
    let cookingTime: Int?

    var toggleBookmark: () -> Void

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: SavedRecipe, rhs: SavedRecipe) -> Bool {
        return  lhs.title == rhs.title &&
        lhs.rating == rhs.rating &&
        lhs.chefName == rhs.chefName &&
        lhs.cookingTime == rhs.cookingTime &&
        lhs.recipeImage == rhs.recipeImage
    }

init(title: String?, recipeImage: UIImage?, rating: Double?,
     chefName: String?, cookingTime: Int?, toggleBookmark: @escaping () -> Void) {
        self.title = title
        self.recipeImage = recipeImage
        self.rating = rating
        self.chefName = chefName
        self.cookingTime = cookingTime
        self.toggleBookmark = toggleBookmark
    }
}
