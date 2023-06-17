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
            let offset = CGSize(width: 0, height: 0)
            let color = UIColor(red: 0.412, green: 0.412, blue: 0.412, alpha: 0.1).cgColor
            let style = UIButton.ShadowStyle(
                offset: offset,
                radius: 5,
                color: color,
                opacity: 1
            )
            layer.shadowOffset = style.offset
            layer.shadowRadius = style.radius
            layer.shadowColor = style.color
            layer.shadowOpacity = style.opacity
        }
    }
}
