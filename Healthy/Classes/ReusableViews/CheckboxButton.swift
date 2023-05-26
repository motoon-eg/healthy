import UIKit

class CheckboxButton: UIButton {

    // Bool property
    var isChecked: Bool = false {
        didSet {
            let image = isChecked ? UIImage.icCheckboxSelected : UIImage.icCheckboxNotSelected
            self.setImage(image, for: UIControl.State.normal)
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }

    @objc private func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
    }
}
