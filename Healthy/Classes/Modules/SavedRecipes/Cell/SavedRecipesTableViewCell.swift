import UIKit

class SavedRecipesTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet private(set) weak var recipeImageView: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var chefNameLabel: UILabel!
    @IBOutlet private(set) weak var rateView: UIView!
    @IBOutlet private(set) weak var timeLabel: UILabel!
    @IBOutlet private(set) weak var bookMarkView: UIView!
    @IBOutlet private(set) weak var bookMarkImageView: UIImageView!
    
    //MARK:  Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureCell(viewModel: SavedRecipesCellViewModelType) {
        // TODO: Configure cell with view model.
    }
}

// MARK: Private Handlers

private extension SavedRecipesTableViewCell {
    func configureLayout() {
        contentView.layer.cornerRadius = 10
        recipeImageView.applyPrimaryGradient()
        // TODO: Waiting for add style to title label.
        titleLabel.textColor = .white
        // TODO: Waiting for add style to chef name label.
        chefNameLabel.textColor = .white
        rateView.layer.cornerRadius = 8
        rateView.backgroundColor = UIColor.secondary20
        // TODO: Waiting for add style to time clock label.
        timeLabel.textColor = .white
        bookMarkView.layer.cornerRadius = 12
    }
}
