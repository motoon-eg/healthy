//
//  UILabel+Style.swift
//  Healthy
//
//  Created by Abdallah on 14/05/2023.
//

import UIKit

extension UILabel{
    
    // MARK:  Stryle tupe
    enum LabelStyle{
        case title
        case subtitle
        case description
    }
    
    // MARK:  apply style
    
    func applyLabelStyle(style: LabelStyle, fontSize: CGFloat? = nil, weight: UIFont.Weight? = nil){
        switch style{
        case .title:
            applyTitleLabelStyle(fontSize: fontSize, weight: weight)
        case .subtitle:
            applySubtitleLabelStyle(fontSize: fontSize)
        case .description:
            applyDescriptionLabelStyle()
        }
    }
    
    // MARK:  Style attriputes
        
        private func applyTitleLabelStyle(fontSize: CGFloat?, weight: UIFont.Weight?){
            textColor = UIColor(red: 0.012, green: 0.012, blue: 0.098, alpha: 1)
            font = UIFont.systemFont(ofSize: fontSize ?? 28, weight: weight ?? .bold)
            textAlignment = .center
            numberOfLines = 0
        }
        
        private func applySubtitleLabelStyle(fontSize: CGFloat?){
            textColor = .secondaryLabel
            font = UIFont.systemFont(ofSize: fontSize ?? 18, weight: .medium)
            textAlignment = .center
            numberOfLines = 0
        }
        
        private func applyDescriptionLabelStyle(){
            textColor = UIColor(red: 0.282, green: 0.322, blue: 0.373, alpha: 1)
            font = UIFont.systemFont(ofSize: 18, weight: .medium)
            textAlignment = .left
            numberOfLines = 0
        }
    
}
