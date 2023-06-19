import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var foodCategoryName: UILabel!

    func setFoodCategoryName(_ title: String) {
        foodCategoryName.text = title
    }

    func setSelection(_ selected: Bool) {
        backView.backgroundColor = selected ? .primary100 : .clear
        foodCategoryName.textColor = selected ? .white : .primary100
    }

}
