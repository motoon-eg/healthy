//
//  UIView+ReusableIdentifier.swift
//  Healthy
//
//  Created by Ahmed Nasr on 25/05/2023.
//

import UIKit


// MARK: UIView+Reusable Identifier

extension UIView {
    static var reusableIdentifier: String {
        String("\(Self.self)")
    }
}
