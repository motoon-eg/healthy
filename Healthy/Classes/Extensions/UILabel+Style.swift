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
    }
    
    // MARK: Apply Style
    
    func applyStyle(_ style: Style) {
        switch style {
        case .splashHeaderLabel:
            applySplashHeaderLabelStyle()
        case .splashTitle:
            applySplashTitleLabelStyle()
        case .splashSubtitle:
            applySplashSubtitleLabelStyle()
        case .signinTitle:
            applySigninTitleLabelStyle()
        case .signinSubtitle:
            applySigninSubtitleLabelStyle()
        case .signupTitle:
            applySignupTitleLabelStyle()
        case .signupSubtitle:
            applySignupSubtitleLabelStyle()
        case .textFieldTitleLabel:
            applyTextFieldTitleLabelStyle()
        }
    }
}

// MARK: Style Attributes
private extension UILabel {
    func applySplashHeaderLabelStyle() {
        textColor = .white
        // TODO: [HL-4] Add global fonts
        font = LabelFont.splashHearderLabel
        textAlignment = .center
    }
    
    func applySplashTitleLabelStyle() {
        textColor = .white
        // TODO: [HL-4] Add global fonts
        font = LabelFont.splashTitle
        textAlignment = .center
    }
    
    func applySplashSubtitleLabelStyle() {
        textColor = .white
        // TODO: [HL-4] Add global fonts
        font = LabelFont.splashSubtitle
        textAlignment = .center
    }
    //
    func applySigninTitleLabelStyle() {
        textColor = .black
        // TODO: [HL-4] Add global fonts
        font = LabelFont.signinTitle
        textAlignment = .left
    }
    
    func applySigninSubtitleLabelStyle() {
        textColor = LabelColor.slateGray
        // TODO: [HL-4] Add global fonts
        font = LabelFont.signinSubtitle
        textAlignment = .left
    }
    
    func applySignupTitleLabelStyle() {
        textColor = .black
        // TODO: [HL-4] Add global fonts
        font = LabelFont.signupTitle
        textAlignment = .left
    }
    
    func applySignupSubtitleLabelStyle() {
        textColor =  LabelColor.slateGray
        // TODO: [HL-4] Add global fonts
        font = LabelFont.signupSubtitle
        textAlignment = .left
    }
    
    func applyTextFieldTitleLabelStyle(){
        textColor =  LabelColor.slateGray
        // TODO: [HL-4] Add global fonts
        font = LabelFont.textFieldTitleLabel
        textAlignment = .left
    }
}

// MARK: - Colors

private enum LabelColor {
    static let slateGray = UIColor(red: 0.071, green: 0.071, blue: 0.071, alpha: 1)
}

// MARK: - Fonts

private enum LabelFont {
    static let splashHearderLabel = UIFont.systemFont(ofSize: 18, weight: .semibold)
    static let splashTitle = UIFont.systemFont(ofSize: 50, weight: .semibold)
    static let splashSubtitle = UIFont.systemFont(ofSize: 16, weight: .regular)
    static let signinTitle = UIFont.systemFont(ofSize: 30, weight: .semibold)
    static let signinSubtitle = UIFont.systemFont(ofSize: 20, weight: .regular)
    static let signupTitle = UIFont.systemFont(ofSize: 20, weight: .semibold)
    static let signupSubtitle = UIFont.systemFont(ofSize: 11, weight: .regular)
    static let textFieldTitleLabel = UIFont.systemFont(ofSize: 14, weight: .regular)
}
