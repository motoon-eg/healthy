import UIKit

// MARK: View Model

extension SavedRecipesTableViewCell {
    struct ViewModel {
        var recipeImageURL: URL
        var title: String
        var chefName: String
        var rate: Double
        var time: String
        var toggleBookmark: () -> Void
    }
}

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
    
    // MARK:  Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    // MARK:  Configure
    
    func update(with viewModel: ViewModel) {
        // TODO: Set recipe imageView using kingfisher and set (patternFood) as placeholder.
        titleLabel.text = viewModel.title
        chefNameLabel.text = viewModel.chefName
        timeLabel.text = viewModel.time
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
