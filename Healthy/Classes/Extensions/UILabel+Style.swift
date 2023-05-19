import UIKit

extension UILabel {

    // MARK: Style

    enum Style {
        case onboardingTitle
        case onboardingSubtitle
        case descriptionLabel
        case textFieldTitleLabel
    }

    // MARK: Apply Style

    func applyStyle(_ style: Style) {
        switch style {
        case .onboardingTitle:
            applyOnboardingTitleLabelStyle()
        case .onboardingSubtitle:
            applyOnboardingSubtitleLabelStyle()
        case .descriptionLabel:
            applyDescriptionLabelStyle()
        case .textFieldTitleLabel:
            applyTextFieldTitleLabelStyle()
        }
    }
}

// MARK: Style Attributes
private extension UILabel {
    func applyOnboardingTitleLabelStyle() {
        // TODO: [HL-4] Add global Color
        textColor = LabelColor.deepBlue
        // TODO: [HL-4] Add global fonts
        font = LableFont.onBoardingTitle
        textAlignment = .center
        numberOfLines = 0
    }

    func applyOnboardingSubtitleLabelStyle() {
        textColor = .secondaryLabel
        // TODO: [HL-4] Add global fonts
        font = LableFont.onBoardingSubtitle
        textAlignment = .center
        numberOfLines = 0
    }

    func applyDescriptionLabelStyle() {
        // TODO: [HL-4] Add global Color
        textColor = LabelColor.slateGray
        // TODO: [HL-4] Add global fonts
        font = LableFont.description
        textAlignment = .left
        numberOfLines = 0
    }

    func applyTextFieldTitleLabelStyle() {
        // TODO: [HL-4] Add global Color
        textColor = LabelColor.midnightBlue
        // TODO: [HL-4] Add global fonts
        font = LableFont.textFieldTitle
        textAlignment = .left
        numberOfLines = 0
    }
}

// MARK: - Colors

private enum LabelColor {
    static let deepBlue = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
    static let midnightBlue = UIColor(red: 0.039, green: 0.145, blue: 0.200, alpha: 1)
    static let slateGray = UIColor(red: 0.282, green: 0.322, blue: 0.373, alpha: 1)
}
// MARK: - Fonts

private enum LableFont {
    static let onBoardingTitle = UIFont.systemFont(ofSize: 28, weight: .bold)
    static let onBoardingSubtitle = UIFont.systemFont(ofSize: 18, weight: .medium)
    static let description = UIFont.systemFont(ofSize: 18, weight: .medium)
    static let textFieldTitle = UIFont.systemFont(ofSize: 20, weight: .medium)
}
