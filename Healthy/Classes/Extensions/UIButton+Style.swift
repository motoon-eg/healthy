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
    enum ButtonStyle {
        case primary
        case secondary
        case disable
    }
}


//MARK: - apply button style -
//
extension UIButton {
    func applyButtonStyle(style: ButtonStyle) {
        buttonStyleAttributes(style: style)
    }
}


//MARK: - button style attribute -
//
extension UIButton {
    private func buttonStyleAttributes(style: ButtonStyle) {
        switch style {
        case .primary:
            backgroundColor = .black
        case .secondary:
            backgroundColor = .green
        case .disable:
            backgroundColor = .gray
        }
        
        tintColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 32)
        layer.cornerRadius = 12
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
