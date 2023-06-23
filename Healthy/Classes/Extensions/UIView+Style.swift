import UIKit

// MARK: - Apply Shadow
//
extension UIView {
    enum ShadowType {
        case normal
    }

    struct ShadowStyle {
        var offset: CGSize
        var radius: CGFloat
        var color: CGColor
        var opacity: Float
    }

    func applyShadow(_ type: ShadowType) {
        switch type {
        case .normal:
            layer.shadowOffset = .zero
            layer.shadowRadius = 5
            layer.shadowColor = UIColor.gray4.cgColor
            layer.shadowOpacity = 1
        }
    }
}
