import UIKit

class FoodTagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet private weak var foodCategoryName: UILabel!

    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 10
    }

    func updateView(viewModel: ViewModel) {
        foodCategoryName.text = viewModel.foodCategoryName
    }

    func setSelection(_ selected: Bool) {
        contentView.backgroundColor = selected ? .primary100 : .clear
        foodCategoryName.textColor = selected ? .white : .primary100
    }
}

// MARK: ViewModel

extension FoodTagCollectionViewCell {
    struct ViewModel: Equatable {
        let foodCategoryName: String
    }
}
