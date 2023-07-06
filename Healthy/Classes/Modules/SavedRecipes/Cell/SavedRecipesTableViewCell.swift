import UIKit

final class SavedRecipesTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet private(set) weak var recipeImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var chefNameLabel: UILabel!
    @IBOutlet private(set) weak var rateView: UIView!
    @IBOutlet private(set) weak var timeLabel: UILabel!
    @IBOutlet private(set) weak var bookMarkView: UIView!
    @IBOutlet private(set) weak var bookMarkImageView: UIImageView!

    // MARK: Properties

    private var toggleBookmark: () -> Void = {}

    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    // MARK: Configure

    func update(with viewModel: SavedRecipe) {
        // TODO: Set recipe imageView using kingfisher and set (patternFood) as placeholder.
        recipeImageView.image = viewModel.recipeImage
        titleLabel.text = viewModel.title
        chefNameLabel.text = viewModel.chefName

        if let cookingTime = viewModel.cookingTime {
            timeLabel.text = "\(cookingTime) min"
        } else {
            timeLabel.text = nil
        }
        // TODO: Set rate count.
        toggleBookmark = viewModel.toggleBookmark
    }
}

// MARK: Private Handlers

private extension SavedRecipesTableViewCell {
    func configureLayout() {
        contentView.layer.cornerRadius = 10
        recipeImageView.applyPrimaryGradient()
        titleLabel.applyStyle(.cellHeaderTitle)
        chefNameLabel.applyStyle(.cellHeaderSubTitle)
        rateView.layer.cornerRadius = 8
        rateView.backgroundColor = UIColor.secondary20
        timeLabel.applyStyle(.cellTime)
        bookMarkView.layer.cornerRadius = 12
        addActionToBookMarkView()
    }

    private func addActionToBookMarkView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTappedOnBookMarkView))
        tap.numberOfTapsRequired = 1
        bookMarkView.isUserInteractionEnabled = true
        bookMarkView.addGestureRecognizer(tap)
    }

    @objc private func didTappedOnBookMarkView() {
        toggleBookmark()
    }
}