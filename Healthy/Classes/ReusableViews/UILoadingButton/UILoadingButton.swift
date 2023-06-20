import UIKit

class UILoadingButton: UIButton, AnimatableView {

    var originalButtonText: String?
    var originalImage: UIImage?
    var activityIndicator: UIActivityIndicatorView?

    @IBInspectable var activityIndicatorColor: UIColor = .white

    func startAnimating() {
        originalButtonText = self.titleLabel?.text
        originalImage = self.imageView?.image
        self.setTitle("", for: .normal)
        self.setImage(nil, for: .normal)

        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }

        showSpinning()
    }

    func stopAnimating() {
        self.setTitle(originalButtonText, for: .normal)
        self.setImage(originalImage, for: .normal)
        activityIndicator?.stopAnimating()
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityIndicatorColor
        return activityIndicator
    }

    private func showSpinning() {
        guard let activityIndicator else { return }
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }

    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        self.addConstraint(yCenterConstraint)
    }

}
