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
}

// MARK: Private Handlers

private extension SavedRecipesTableViewCell {
    func configureLayout() {
        recipeImageView.layer.cornerRadius = 10
        rateView.layer.cornerRadius = 20
        rateView.backgroundColor = UIColor.secondary20
        bookMarkView.layer.cornerRadius = 12
    }
}
