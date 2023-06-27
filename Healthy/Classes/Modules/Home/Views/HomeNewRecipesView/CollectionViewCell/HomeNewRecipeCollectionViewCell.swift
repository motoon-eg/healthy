import UIKit

class HomeNewRecipeCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak private(set) var recipeNameLabel: UILabel!
    @IBOutlet weak private(set) var userImage: UIImageView!
    @IBOutlet weak private(set) var userNameLabel: UILabel!
    @IBOutlet weak private(set) var preparationTimeInMinutesLabel: UILabel!
    @IBOutlet weak private(set) var preparationTimeHorizontalStackView: UIStackView!
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak private(set) var cardVerticalStackView: UIStackView!
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureAppearance()
    }

    // MARK: - Private Methods

    private func configureAppearance() {
        recipeNameLabel.applyStyle(.textFieldTitleLabel)
        userNameLabel.applyStyle(.signupSubtitle)
//        preparationTimeInMinutesLabel.applyStyle(.signupSubtitle)
        configureCardShadow(view: contentBackgroundView)
    }

    private func configureCardShadow(view: UIView) {
        view.cornerRadius = 10.0
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4.0
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.masksToBounds = false
    }

}
