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

        // Workaround for adding leading & training spaces
        setLeftPaddingPoints()
        setRightPaddingPoints()
    }
}

// MARK: set right / left padding to text field

extension UITextField {
    private func setLeftPaddingPoints(_ amount: CGFloat = Constants.defaultPadding) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    private func setRightPaddingPoints(_ amount: CGFloat = Constants.defaultPadding) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
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
