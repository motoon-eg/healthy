import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var foodCategoryName: UILabel!

    // MARK: - Lifecycle Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 10
    }

    func updateView(viewModel: ViewModel) {
        foodCategoryName.text = viewModel.foodCategoryName
    }

    func setSelection(_ selected: Bool) {
        backView.backgroundColor = selected ? .primary100 : .clear
        foodCategoryName.textColor = selected ? .white : .primary100
    }
}

// MARK: ViewModel

extension TagCollectionViewCell {
    struct ViewModel {
        let foodCategoryName: String
    }
}
