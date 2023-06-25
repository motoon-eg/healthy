import UIKit

extension UILabel {

    // MARK: Style

    enum Style {
        case splashHeaderLabel
        case splashTitle
        case splashSubtitle
        case signinTitle
        case signinSubtitle
        case signupTitle
        case signupSubtitle
        case textFieldTitleLabel
        case messageLabel
        case cellHeaderTitle
        case cellHeaderSubTitle
        case cellTime

        var labelTextColor: UIColor {
            switch self {
            case .splashHeaderLabel,
                    .splashTitle,
                    .splashSubtitle,
                    .cellHeaderTitle,
                    .cellHeaderSubTitle,
                    .cellTime:
                return .white
            case .signinTitle,
                    .signupTitle:
                return .black
            case .signinSubtitle,
                    .signupSubtitle,
                    .textFieldTitleLabel:
                // TODO: [HL-4] Add global Color
                return LabelColor.slateGray
            case .messageLabel:
                return .white
            }
        }

        // TODO: [HL-4] Add global fonts
        var labelFont: UIFont {
            switch self {
            case .splashHeaderLabel:
                return LabelFont.splashHeaderLabel
            case .splashTitle:
                return LabelFont.splashTitle
            case .splashSubtitle:
                return LabelFont.splashSubtitle
            case .signinTitle:
                return LabelFont.signinTitle
            case .signinSubtitle:
                return LabelFont.signinSubtitle
            case .signupTitle:
                return LabelFont.signupTitle
            case .signupSubtitle:
                return LabelFont.signupSubtitle
            case .textFieldTitleLabel:
                return LabelFont.textFieldTitleLabel
            case .messageLabel:
                return LabelFont.messageLabel
            case .cellHeaderTitle:
                return LabelFont.cellHeaderTitleLabel
            case .cellHeaderSubTitle:
                return LabelFont.cellHeaderSubTitleLabel
            case .cellTime:
                return LabelFont.cellTimeLabel
            }
        }
    }
}

// MARK: Style Attributes
extension UILabel {
    func applyStyle(_ style: Style) {
        textColor = style.labelTextColor
        // TODO: [HL-4] Add global fonts
        font = style.labelFont

    }
}

// MARK: - Colors

private enum LabelColor {
    static let slateGray = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
}

// MARK: - Fonts

private enum LabelFont {
    static let splashHeaderLabel = UIFont.systemFont(ofSize: 18, weight: .semibold)
    static let splashTitle = UIFont.systemFont(ofSize: 50, weight: .semibold)
    static let splashSubtitle = UIFont.systemFont(ofSize: 16, weight: .regular)
    static let signinTitle = UIFont.systemFont(ofSize: 30, weight: .semibold)
    static let signinSubtitle = UIFont.systemFont(ofSize: 20, weight: .regular)
    static let signupTitle = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let signupSubtitle = UIFont.systemFont(ofSize: 11, weight: .regular)
    static let textFieldTitleLabel = UIFont.systemFont(ofSize: 14, weight: .regular)
    static let messageLabel = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let cellHeaderTitleLabel = UIFont.smallBold
    static let cellHeaderSubTitleLabel = UIFont.smallLabelRegular
    static let cellTimeLabel = UIFont.smallerRegular
}
