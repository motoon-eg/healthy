import UIKit

extension UIFont {
    // TODO: Replace with app fonts
    static func poppinsbold(_ size: CGFloat) -> UIFont {
        UIFont(name: "poppins-bold", size: size) ?? .systemFont(ofSize: size)
    }
}
