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
}
