import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = backView.frame.height / 3
        }
    }
    @IBOutlet weak var foodCategoryName: UILabel!

    func setFoodCategoryName(_ title: String) {
        foodCategoryName.text = title
    }

    func setSelection(_ selected: Bool) {
        backView.backgroundColor = selected ? .red : .clear
        foodCategoryName.textColor = selected ? .white : .black
    }

}
