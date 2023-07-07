import UIKit

// MARK: - Button style
//
extension UIButton {
    enum ButtonStyle {
        case primary
        case plainGold
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
        case .plainGold return .white
        }
    }
    
    var textColor: UIColor? {
        switch self {
        case .primary: return .white
        case .plainGold: return ButtonColors.gold
        }
    }
    
    var buttonFont: UIFont? {
        switch self {
        case .primary: return .mediumBold
        case .plainGold: return .mediumBold
        }
    }
    
    var defaultHeight: CGFloat {
        switch self {
        case .primary, .plainGold:
            return 40.0
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .primary, .plainGold:
            return 12.0
        }
    }
}
