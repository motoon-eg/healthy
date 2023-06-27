import UIKit

extension UIButton: AnimatableView {

    // MARK: - AnimatableView Conformance

    func startAnimating() {
        isEnabled = false
        setTitleColor(.clear, for: .disabled)

        titleLabel?.alpha = 0
        if activityIndicator == nil {
            let activityIndicator = createActivityIndicator()
            addSubview(activityIndicator)
            centerActivityIndicatorInButton()
        }
        showSpinning()
    }

    func stopAnimating() {
        isEnabled = true
        setTitleColor(titleLabel?.textColor.withAlphaComponent(0.5), for: .disabled)

        titleLabel?.alpha = 1

        guard let activityIndicator else { return }
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
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

    private func centerActivityIndicatorInButton() {
        guard let activityIndicator else {
            assertionFailure("Trying to configure constraints for invalid activity indicator.")
            return
        }

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func showSpinning() {
        guard let activityIndicator else { return }
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
}
