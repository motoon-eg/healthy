import UIKit

protocol FoodTagCollectionDelegate: AnyObject {
    func didSelectTag(viewModel: FoodTagCollectionViewCell.ViewModel)
}

class FoodTagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets
    @IBOutlet private weak var foodCategoryName: UILabel!

    weak var delegate: FoodTagCollectionDelegate?

    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
    }

    func updateView(viewModel: ViewModel) {
        foodCategoryName.text = viewModel.foodCategoryName
    }

    func setSelection(_ selected: Bool) {
        if let categoryName = foodCategoryName.text {
            delegate?.didSelectTag(viewModel: .init(foodCategoryName: categoryName))
        } else {
            assertionFailure("No data in Food Category Cell")
        }
        contentView.backgroundColor = selected ? .primary100 : .clear
        foodCategoryName.textColor = selected ? .white : .primary100
    }
}

// MARK: ViewModel

extension FoodTagCollectionViewCell {
    struct ViewModel {
        let foodCategoryName: String
    }
}
