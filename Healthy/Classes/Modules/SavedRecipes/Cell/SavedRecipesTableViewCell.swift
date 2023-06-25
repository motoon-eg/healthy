import UIKit

// MARK: View Model

extension SavedRecipesTableViewCell {
    struct ViewModel {
        // Here goes your implementation....
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
    
    // MARK:  Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    // MARK:  Configure
    
    func update(with viewModel: ViewModel) {
        // TODO: Configure cell with view model.
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
    }
}
