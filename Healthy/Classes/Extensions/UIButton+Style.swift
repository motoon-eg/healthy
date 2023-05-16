//
//  UIButton+Style.swift
//  Healthy
//
//  Created by Ahmed Nasr on 13/05/2023.
//

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
    func applyButtonStyle(style: ButtonStyle) {
        setButtonStyleAttributes(style: style)
    }
}



// MARK: - set button style attributes
//
extension UIButton {
    private func setButtonStyleAttributes(style: ButtonStyle) {
        backgroundColor = style.buttonColor
        tintColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout, compatibleWith: .none)
        layer.cornerRadius = Constants.defaultCornerRadius
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constants.defaultHeight),
        ])
    }
}



//MARK: - Constants
//
extension UIButton {
    enum Constants {
        static let defaultCornerRadius: CGFloat = 12.0
        static let defaultHeight: CGFloat = 40.0
    }
}
