import UIKit

// MARK: - Button style
//
extension UIButton {
    enum ButtonStyle {
        case primary
        case secondary
    }
}

// MARK: - Apply button style
//
extension UIButton {
    func applyButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.backgroundColor
        titleLabel?.font = style.buttonFont
        tintColor = style.textColor
        layer.cornerRadius = style.cornerRadius
        layer.masksToBounds = true
        let heightConstraint = heightAnchor.constraint(equalToConstant: style.defaultHeight)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
    }
}

// MARK: Button Style Configurations
//
private extension UIButton.ButtonStyle {
    var backgroundColor: UIColor? {
        switch self {
        case .primary: return .primary100
        case .secondary: return .white
        }
    }

    var textColor: UIColor? {
        switch self {
        case .primary: return .white
        case .secondary: return .secondary100
        }
    }

    var buttonFont: UIFont? {
        switch self {
        case .primary: return .mediumBold
        case .secondary: return .mediumBold
        }
    }

    var defaultHeight: CGFloat {
        switch self {
        case .primary, .secondary:
            return 40.0
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .primary, .secondary:
            return 12.0
        }
    }
}
