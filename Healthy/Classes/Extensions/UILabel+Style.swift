//
//  UILabel+Style.swift
//  Healthy
//
//  Created by Abdallah on 14/05/2023.
//

import UIKit

extension UILabel{
    
    // MARK:  Style tupe
    
    enum LabelStyle{
        case title
        case subtitle
        case description
        case textFieldTitleLabel
    }
    
    // MARK:  apply style
    
    func applyLabelStyle(style: LabelStyle){
        switch style{
        case .title:
            applyTitleLabelStyle()
        case .subtitle:
            applySubtitleLabelStyle()
        case .description:
            applyDescriptionLabelStyle()
        case .textFieldTitleLabel:
            textFieldTitleLabelStyle()
        }
    }    
    
}

extension UILabel{
    
    // MARK:  Style attriputes
    
    private func applyTitleLabelStyle(){
        textColor = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
        font = UIFont.systemFont(ofSize: 28, weight: .bold)
        textAlignment = .center
        numberOfLines = 0
    }
    
    private func applySubtitleLabelStyle(){
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
    
    private func textFieldTitleLabelStyle(){
        textColor = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
        font = UIFont.systemFont(ofSize: 20, weight: .medium)
        textAlignment = .left
        numberOfLines = 0
    }
    
}
