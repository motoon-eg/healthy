import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var foodCategoryName: UILabel!

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
