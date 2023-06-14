import UIKit

// MARK: TextField style

extension UITextField {
    enum TextFieldStyle {
        case primary
    }
}

// MARK: Apply textfield style

extension UITextField {
    func applyTextFieldStyle(_ style: TextFieldStyle) {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.defaultHeight)
        ])

        layer.cornerRadius = Constants.defaultCornerRadius
        layer.borderWidth = Constants.defaultBorderWidth
        layer.borderColor = UIColor.gray4.cgColor
        borderStyle = .none
    }
}

// MARK: Constants

private extension UITextField {
    enum Constants {
        static let defaultCornerRadius: CGFloat = 10.0
        static let defaultHeight: CGFloat = 55.0
        static let defaultBorderWidth: CGFloat = 1.5
    }
}
