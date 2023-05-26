import UIKit

protocol UILabelStyle {
    func setStype(for label: UILabel)
}

extension UILabel {
    func applyStyle(_ style: UILabelStyle) {
        style.setStype(for: self)
    }
}
