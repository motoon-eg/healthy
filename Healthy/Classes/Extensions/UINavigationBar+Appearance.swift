import UIKit

extension UINavigationBar {

    /// Apply the default navigation bar appearance
    ///
    class func applyDefaultAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [
            .font: UIFont.mediumRegular
        ]
    }
}
