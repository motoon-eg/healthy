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
            <#code#>
        case .subtitle:
            <#code#>
        case .description:
            <#code#>
        }
    }
    

    

}
