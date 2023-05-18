
import UIKit

extension UILabel{
    
    // MARK:  Style
    
    enum Style {
        case onboardingTitle
        case onboardingSubtitle
        case descriptionLabel
        case textFieldTitleLabel
    }
    
    // MARK:  Apply Style
    
    func applyStyle(_ style: Style){
        switch style{
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

extension UILabel{
    
    // MARK:  Style attriputes
    
    private func applyOnboardingTitleLabelStyle(){
        textColor = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
        font = UIFont.systemFont(ofSize: 28, weight: .bold)
        textAlignment = .center
        numberOfLines = 0
    }
    
    private func applyOnboardingSubtitleLabelStyle(){
        textColor = .secondaryLabel
        font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textAlignment = .center
        numberOfLines = 0
    }
    
    private func applyDescriptionLabelStyle(){
        textColor = UIColor(red: 0.282, green: 0.322, blue: 0.373, alpha: 1)
        font = UIFont.systemFont(ofSize: 18, weight: .medium)
        textAlignment = .left
        numberOfLines = 0
    }
    
    private func applyTextFieldTitleLabelStyle(){
        textColor = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
        font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textAlignment = .left
        numberOfLines = 0
    }
    
}
