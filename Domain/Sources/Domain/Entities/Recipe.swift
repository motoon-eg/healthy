/// A model representing a recipe in the HomeNewReceiptsView.
///
/// This model contains properties for the recipe title, recipe image URL, rating (out of 5 stars),
/// user image URL, user name, and preparation time.
public struct Recipe {

    // MARK: - Properties

    /// Recipe ID
    public let recipeId: String

    /// The title of the recipe
    public let title: String?

    /// A URL string representing the recipe image
    public let recipeImageUrl: String?

    /// The rating of the recipe in the form of a star rating (out of 5 stars)
    public let rating: Int?

    /// A URL string representing the user who posted the recipe
    public let userImageUrl: String?

    /// The name of the user who posted the recipe
    public let userName: String?

    /// The preparation time for the recipe in seconds
    public let preparationTime: Int?

    // MARK: - Initializers

    /// Initializes a new instance of `Recipe` with the given parameters.
    ///
    /// - Parameters:
    ///     - recipeId: The recipe Id
    ///     - title: The title of the recipe.
    ///     - recipeImageUrl: A URL string representing the recipe image.
    ///     - rating: The star rating of the recipe (out of 5 stars).
    ///     - userImageUrl: A URL string representing the user who posted the recipe.
    ///     - userName: The name of the user who posted the recipe.
    ///     - preparationTime: The preparation time for the recipe in minutes.
    public init(recipeId: String,
                title: String = "",
                recipeImageUrl: String = "",
                rating: Int = 0,
                userImageUrl: String = "",
                userName: String = "",
                preparationTime: Int = 0) {
        self.recipeId = recipeId
        self.title = title
        self.recipeImageUrl = recipeImageUrl
        self.rating = rating
        self.userImageUrl = userImageUrl
        self.userName = userName
        self.preparationTime = preparationTime
    }
}
