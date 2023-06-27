/// A model representing a recipe in the HomeNewReceiptsView.
///
/// This model contains properties for the recipe title, recipe image URL, rating (out of 5 stars),
/// user image URL, user name, and preparation time.
struct Recipe {

    // MARK: - Properties

    /// The title of the recipe
    let title: String?

    /// A URL string representing the recipe image
    let recipeImageUrl: String?

    /// The rating of the recipe in the form of a star rating (out of 5 stars)
    let rating: Int?

    /// A URL string representing the user who posted the recipe
    let userImageUrl: String?

    /// The name of the user who posted the recipe
    let userName: String?

    /// The preparation time for the recipe in seconds
    let preparationTime: Int?

    // MARK: - Initializers

    /// Initializes a new instance of `Recipe` with the given parameters.
    ///
    /// - Parameters:
    ///     - title: The title of the recipe.
    ///     - recipeImageUrl: A URL string representing the recipe image.
    ///     - rating: The star rating of the recipe (out of 5 stars).
    ///     - userImageUrl: A URL string representing the user who posted the recipe.
    ///     - userName: The name of the user who posted the recipe.
    ///     - preparationTime: The preparation time for the recipe in minutes.
    init(title: String = "",
         recipeImageUrl: String = "",
         rating: Int = 0,
         userImageUrl: String = "",
         userName: String = "",
         preparationTime: Int = 0) {
        self.title = title
        self.recipeImageUrl = recipeImageUrl
        self.rating = rating
        self.userImageUrl = userImageUrl
        self.userName = userName
        self.preparationTime = preparationTime
    }

    // MARK: - Methods

    /// Formats the preparation time as a string in the "Minutes:Seconds" format.
    ///
    /// - Returns: A string representing the preparation time formatted as "Minutes:Seconds".
    func formattedPreparationTime() -> String {
        let minutes = (preparationTime ?? 0) / 60
        let seconds = (preparationTime ?? 0) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
