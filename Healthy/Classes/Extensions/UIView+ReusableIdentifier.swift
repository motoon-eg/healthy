import UIKit

// MARK: UIView+Reusable Identifier

extension UIView {
    /// Returns a String value, which is the class name of the UIView subclass that it is called on.
    static var reusableIdentifier: String {
        String(describing: Self.self)
    }
}
