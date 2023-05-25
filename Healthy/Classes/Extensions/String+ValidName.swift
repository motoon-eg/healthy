//
//  String+ValidName.swift
//  Healthy
//
//  Created by Esraa Khaled   on 25/05/2023.
//

import Foundation
extension String {

    var isValidName: Bool {
       let RegEx = "^\\w{7,18}$"
       let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
       return Test.evaluate(with: self)
    }
}
