import UIKit

extension UIButton: AnimatableView {

    // MARK: - AnimatableView Conformance

    func startAnimating() {
        isEnabled = false

        // To avoid a problem that appear when setting the label alpha to 0 after disabling button
        // as when disabling it, it sets the configurations of disabled state
        // so it's not set to 0 alpha
        setTitleColor(.clear, for: .disabled)

        titleLabel?.alpha = 0
        if activityIndicator == nil {
            let activityIndicator = createActivityIndicator()
            addSubview(activityIndicator)
            centerInButton(activityIndicator)
        }
        activityIndicator?.startAnimating()
    }

    func stopAnimating() {

        // To get the color and alpha of titleLabel back to its original state
        // after re-enbaling the button after animating activityIndicator
        isEnabled = true
        setTitleColor(titleLabel?.textColor.withAlphaComponent(0.5), for: .disabled)

        titleLabel?.alpha = 1
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }

    // MARK: - AnimatableView Private Helpers

    private var activityIndicator: UIActivityIndicatorView? {
        subviews
            .filter { $0 is UIActivityIndicatorView }
            .first as? UIActivityIndicatorView
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }

    private func centerInButton(_ activityIndicator: UIView) {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
