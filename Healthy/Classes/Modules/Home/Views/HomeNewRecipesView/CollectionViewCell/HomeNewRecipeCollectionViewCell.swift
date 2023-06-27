import UIKit

class HomeNewRecipeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak private(set) var recipeNameLabel: UILabel!
    @IBOutlet weak private(set) var userImage: UIImageView!
    @IBOutlet weak private(set) var userNameLabel: UILabel!
    @IBOutlet weak private(set) var preparationTimeInMinutesLabel: UILabel!
    @IBOutlet weak private(set) var recipeImage: UIImageView!
    @IBOutlet weak private(set) var preparationTimeHorizontalStackView: UIStackView!
    @IBOutlet weak private(set) var cardView: UIView!

    // MARK: - Lifecycle

    override func layoutSubviews() {
        configureAppearance()
        setPlaceholderImages()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        recipeNameLabel.applyStyle(.textFieldTitleLabel)
        userNameLabel.applyStyle(.signupSubtitle)
        preparationTimeInMinutesLabel.applyStyle(.signupSubtitle)
        cardView.applyDefaultCardShadow(cornerRadius: Constants.cornerRadius)
    }

    /// Sets placeholder images for testing purposes
    ///
    /// Use this till a `ViewModel` is passed and configures the view properly
    private func setPlaceholderImages() {
        userImage.image = UIImage.imageUserRecipePlaceholder
        recipeImage.image = UIImage.imageRecipePlaceholder
    }

    /// Configures the cell view and binds the data from the provided view model.
    /// - Parameter with: The view model containing the data to be displayed in the cell view.
    ///
    private func configure(with: ViewModel) {
        recipeNameLabel.text = with.recipeName
        userNameLabel.text = with.userName
        preparationTimeInMinutesLabel.text = with.preparationTimeInMinutes

        // TODO: [HL-52] To be Implemented after implementing binding imageUrl To UIImageView
//        recipeImage.image = with.recipeImageUrl
//        userImage.image = with.userImageUrl
    }
}

private extension HomeNewRecipeCollectionViewCell {
    /// A collection of constants used within the `HomeNewRecipeCollectionViewCell` class.
    enum Constants {
        /// The corner radius value for the `cardView` in the collection view cell.
        static let cornerRadius: CGFloat = 8.0
    }
}

/// The `ViewModel` struct represents the view model used to configure the `HomeNewRecipeCollectionViewCell`.
///
/// Contains the necessary data for displaying the recipe information.
/// - SeeAlso: `Recipe`
///
private extension HomeNewRecipeCollectionViewCell {

    /// The view model used to configure the `HomeNewRecipeCollectionViewCell`.
    struct ViewModel {

        /// The name of the recipe.
        let recipeName: String

        /// The name of the user associated with the recipe.
        let userName: String

        /// The preparation time of the recipe in minutes.
        let preparationTimeInMinutes: String

        /// The image url representing the recipe photo.
        let recipeImageUrl: String?

        /// The rating of the recipe.
        let rating: Int?

        /// The image urlrepresenting the user photo.
        let userImageUrl: String?
    }
}
