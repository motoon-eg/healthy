import UIKit

// MARK: UIView+Helpers

extension UIView {
    /// Use this method to add and fill anysubview to the superview
    func fillSubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /// Loads a view from a nib file and adds it as a subview to the current view instance..
    func loadViewFromNib(bundle: Bundle? = nil) {
        let nibName = String(describing: Self.self)
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let contentView = nib.instantiate(withOwner: self).first as? UIView else {
            assertionFailure("unable to find the content view")
            return
        }

        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }

    func roundView() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }

    func setRadius(radius: Int) {
        self.cornerRadius = CGFloat(radius)
    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    // MARK: - Shadow

    /// Applies a default card-style shadow to a view with a specified corner radius.
    /// - Parameter cornerRadius: The corner radius to apply to the view.
    ///
    func applyDefaultCardShadow(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
        backgroundColor = UIColor.white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.masksToBounds = false
    }

    // MARK: - Corner Radius

    /// A property to get or set the corner radius of the UIView.
    ///
    /// This property allows you to easily set the corner radius of a UIView
    /// using Interface Builder or programmatically. When the corner radius
    /// is greater than 0, the `masksToBounds` property of the layer is set
    /// to true, clipping the content and subviews to the rounded corners.
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
