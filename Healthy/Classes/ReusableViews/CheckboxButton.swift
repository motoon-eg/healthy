import UIKit

// MARK: - CheckboxButton
final class CheckboxButton: UIButton {

    // MARK: Properties

    var isChecked: Bool = false {
        didSet {
            let image: UIImage = isChecked ? .iconCheckboxSelected : .iconCheckboxNotSelected
            setImage(image, for: .normal)
        }
    }

    // MARK: Lifecycle

    override func awakeFromNib() {
       super.awakeFromNib()
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }

    // MARK: Actions

    @objc private func buttonClicked(sender: UIButton) {
        isChecked.toggle()
    }
}
