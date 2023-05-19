import UIKit

// MARK: - Button style
//
extension UIButton {
    enum ButtonStyle {
        case primary
        case secondary
        case disable

        var buttonColor: UIColor {
            switch self {
            case .primary:
                return .black
            case .secondary:
                return .green
            case .disable:
                return .gray
            }
        }
    }
}

// MARK: - Apply button style
//
extension UIButton {
    func applyButtonStyle(_ style: ButtonStyle) {
        backgroundColor = style.buttonColor
        tintColor = .white
        // TODO: [HL-16] Add global fonts
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout, compatibleWith: .none)
        layer.cornerRadius = Constants.defaultCornerRadius
        layer.masksToBounds = true
        let widthConstraint = heightAnchor.constraint(equalToConstant: Constants.defaultHeight)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
    }
}

// MARK: - Constants
//
private extension UIButton {
    enum Constants {
        static let defaultCornerRadius: CGFloat = 12.0
        static let defaultHeight: CGFloat = 40.0
    }
}
