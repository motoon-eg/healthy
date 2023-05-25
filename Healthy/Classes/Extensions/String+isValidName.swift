import Foundation
extension String {

    var isValidName: Bool {
       let regEx = "^\\w{7,18}$"
       let test = NSPredicate(format: "SELF MATCHES %@", regEx)
       return test.evaluate(with: self)
    }
}
