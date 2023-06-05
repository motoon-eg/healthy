import UIKit

// MARK: - Button style
//
extension UIButton {
    enum ButtonStyle {
        case primary
        case plainGold

        // TODO: [HL-4] Add global Color
        fileprivate var buttonBackgroundColor: UIColor? {
            switch self {
            case .primary:
                return ButtonColors.lightGreen
            default:
                return nil
            }
        }

        // TODO: [HL-4] Add global Color
        fileprivate var buttonTextColor: UIColor? {
            switch self {
            case .primary:
                return .white
            case .plainGold:
                return ButtonColors.gold
            }
        }

        // TODO: [HL-16] Add global fonts
        fileprivate var buttonFont: UIFont? {
            switch self {
            case .primary:
                return UIFont.preferredFont(forTextStyle: .callout, compatibleWith: .none)
            case .plainGold:
                return UIFont.preferredFont(forTextStyle: .subheadline, compatibleWith: .none)
            }
        }
    }
}

// MARK: - Apply button style
//
extension UIButton {
    func applyButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.buttonBackgroundColor
        titleLabel?.font = style.buttonFont
        tintColor = style.buttonTextColor
        layer.cornerRadius = Constants.defaultCornerRadius
        layer.masksToBounds = true
        let heightConstraint = heightAnchor.constraint(equalToConstant: Constants.defaultHeight)
        heightConstraint.priority = .defaultHigh
        heightConstraint.isActive = true
    }
}

// MARK: - Constants
//
private extension UIButton {
    enum Constants {
        static let defaultCornerRadius: CGFloat = 10.0
        static let defaultHeight: CGFloat = 40.0
    }
}

// MARK: - Button Colors
//
private extension UIButton {
    enum ButtonColors {
        static let lightGreen = UIColor(red: 0.071, green: 0.584, blue: 0.459, alpha: 1)
        static let gold = UIColor(red: 1.000, green: 0.612, blue: 0.000, alpha: 1)
    }
}
