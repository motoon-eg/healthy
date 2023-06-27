import UIKit

extension UIButton: AnimatableView {

    func startAnimating() {
        titleLabel?.alpha = 0

        if getActivityIndicator() == nil {
            let activityIndicator = createActivityIndicator()
            addSubview(activityIndicator)
            centerActivityIndicatorInButton()
        }
            showSpinning()
    }

    func stopAnimating() {
        titleLabel?.alpha = 1
        getActivityIndicator()?.stopAnimating()
    }

    private func getActivityIndicator() -> UIActivityIndicatorView? {
        subviews.compactMap({ view in
            view as? UIActivityIndicatorView
        })[safe: 0]
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        return activityIndicator
    }

    private func centerActivityIndicatorInButton() {
        guard let activityIndicator = getActivityIndicator() else {
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
        guard let activityIndicator = getActivityIndicator() else { return }
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
    }
}
