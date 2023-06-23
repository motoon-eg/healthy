import UIKit

class HomeNewRecipeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak private(set) var recipeNameLabel: UILabel!
    @IBOutlet weak private(set) var userImage: UIImageView!
    @IBOutlet weak private(set) var userNameLabel: UILabel!
    @IBOutlet weak private(set) var preparationTimeInMinutesLabel: UILabel!
    @IBOutlet weak private(set) var userPreparationHorizontalStackView: UIStackView!
    @IBOutlet weak private(set) var preparationTimeHorizontalStackView: UIStackView!
    @IBOutlet weak private(set) var cardVerticalStackView: UIStackView!

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureAppearance()
        userPreparationHorizontalStackView.setCustomSpacing(10, after: preparationTimeHorizontalStackView)
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        recipeNameLabel.applyStyle(.textFieldTitleLabel)
        userNameLabel.applyStyle(.signupSubtitle)
        preparationTimeInMinutesLabel.applyStyle(.textFieldTitleLabel)
        configureCardShadow(view: cardVerticalStackView)
    }

    private func configureCardShadow(view: UIView) {
        view.layer.shadowOpacity = 0.1
        view.layer.shadowRadius = 20.0
        view.layer.masksToBounds = false
    }

}
