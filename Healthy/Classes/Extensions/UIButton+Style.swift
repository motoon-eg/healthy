//
//  UIButton+Style.swift
//  Healthy
//
//  Created by Ahmed Nasr on 13/05/2023.
//

import UIKit


//MARK: - button style -
//
extension UIButton {
    enum buttonStyle {
        case primaryButton
        case secondaryButton
        case disableButton
    }
}


//MARK: - apply button style -
//
extension UIButton {
    func applyButtonStyle(style: buttonStyle) {
        switch style {
        case .primaryButton:
            primaryButtonStyle()
        case .secondaryButton:
            secondaryButtonStyle()
        case .disableButton:
            disableButtonStyle()
        }
    }
}


//MARK: - button style attribute -
//
extension UIButton {
    private func commonButtonStyle() {
        tintColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 32)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func primaryButtonStyle() {
        commonButtonStyle()
        backgroundColor = .black
    }
    
    private func secondaryButtonStyle() {
        commonButtonStyle()
        backgroundColor = .green
    }
    
    private func disableButtonStyle() {
        commonButtonStyle()
        backgroundColor = .gray
    }
}
