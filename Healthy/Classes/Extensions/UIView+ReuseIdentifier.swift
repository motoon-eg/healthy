import UIKit

// MARK: UIView+ReuseIdentifier

extension UIView {
    /// Returns a String value, which is the class name of the UIView subclass that it is called on.
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
