import UIKit

final class NewRecipeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak private(set) var recipeNameLabel: UILabel!
    @IBOutlet weak private(set) var userImage: UIImageView!
    @IBOutlet weak private(set) var userNameLabel: UILabel!
    @IBOutlet weak private(set) var preparationTimeInMinutesLabel: UILabel!
    @IBOutlet weak private(set) var recipeImage: UIImageView!
    @IBOutlet weak private(set) var preparationTimeHorizontalStackView: UIStackView!
    @IBOutlet weak private(set) var cardView: UIView!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        setPlaceholderImages()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        recipeNameLabel.applyBodyStyle()
        userNameLabel.applySubtitleLabelStyle()
        preparationTimeInMinutesLabel.applySubtitleLabelStyle()
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
    ///
    /// - Parameter viewModel: The view model containing the data to be displayed in the cell view.
    func configure(with viewModel: ViewModel) {
        recipeNameLabel.text = viewModel.recipeName
        userNameLabel.text = viewModel.userName
        preparationTimeInMinutesLabel.text = viewModel.preparationTimeInMinutes

        // TODO: [HL-52] To be Implemented after implementing binding imageUrl To UIImageView
    }
}

private extension NewRecipeCollectionViewCell {
    /// A collection of constants used within the `NewRecipeCollectionViewCell` class.
    enum Constants {
        /// The corner radius value for the `cardView` in the collection view cell.
        static let cornerRadius: CGFloat = 8.0
    }
}

/// The `ViewModel` struct represents the view model used to configure the `NewRecipeCollectionViewCell`.
///
/// Contains the necessary data for displaying the recipe information.
/// - SeeAlso: `Recipe`
///
extension NewRecipeCollectionViewCell {

    /// The view model used to configure the `NewRecipeCollectionViewCell`.
    struct ViewModel: Equatable {

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
