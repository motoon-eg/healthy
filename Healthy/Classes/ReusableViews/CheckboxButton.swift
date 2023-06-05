import UIKit

/// Custom UIButton subclass that implements a tickbox feature.
///
/// This class allows you to create a checkbox button by  updating the image according to the checked state.
///
/// Example:
///
/// ```swift
/// let checkBox = CheckboxButton()
/// checkbox.isChecked = true // Sets the checkbox to a checked state
/// ```
///
class CheckboxButton: UIButton {
    
    
    // MARK: - Properties
    
    /// A boolean property to indicate if the checkbox is checked or not.
    ///
    /// The image of the checkbox button is updated accordingly when the value of this property is set.
    /// If checkbox is checked `UIImage.iconCheckboxSelected` is shown
    /// otherwise `UIImage.iconCheckboxNotSelected` is shown instead
    ///
    var isChecked: Bool = false {
        didSet {
            let image = isChecked ? UIImage.iconCheckboxSelected : UIImage.iconCheckboxNotSelected
            self.setImage(image, for: UIControl.State.normal)
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }
    
    
    // MARK: - Actions
    
    /// Toggles the `isChecked` state when the button is clicked
    ///
    @objc private func buttonClicked(sender: UIButton) {
        isChecked = !isChecked
    }
}
