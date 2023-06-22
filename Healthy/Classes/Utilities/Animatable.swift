import UIKit

/// A public protocol that contain two functions that will be affectively on button loading appearance
/// Conform to AnyObject because this protocol will work only with classes such ex: UIButton, UIView....etc
protocol Animatable: AnyObject {
    
    /// Start animating while waiting another task is done
    /// - Parameter color: indicator color
    func startAnimation(withColor color: UIColor)
    
    /// Stop animating when the task is finished
    func stopAnimation()
}

/// Default implementation to UIButton loading indicator
extension Animatable where Self: UIButton {
    
    ///A  computed property that returns the first subview that is an instance of UIActivityIndicatorView, if one exists.
    private var activityIndicator: UIActivityIndicatorView? {
        return subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView
    }
    
    /// Start animating while waiting another task is done
    /// We use an associated object to store the original button title when startLoading() is called.
    /// - Parameter color: indicator color
    func startAnimation(withColor color: UIColor = .black) {
        let originalTitle = title(for: .normal)
        isEnabled = false
        setTitle("", for: .normal)
        self.setupIndicatorLayout()
        activityIndicator?.color = color
        activityIndicator?.startAnimating()
        objc_setAssociatedObject(self,
                                 AssociatedKeys.originalTitle,
                                 originalTitle,
                                 .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    /// Stop loading when the task is finished & hide indicator
    func stopAnimation() {
        isEnabled = true
        if let originalTitle = objc_getAssociatedObject(self, AssociatedKeys.originalTitle) as? String {
            setTitle(originalTitle, for: .normal)
            objc_setAssociatedObject(self,
                                     AssociatedKeys.originalTitle,
                                     nil,
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        activityIndicator?.stopAnimating()
    }
    
    /// Add indicator to button view and make it centerly to the view
    private func setupIndicatorLayout() {
        if activityIndicator == nil {
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.translatesAutoresizingMaskIntoConstraints = false
            addSubview(indicator)
            /// Setup constrains in center
            NSLayoutConstraint.activate([
                indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
                indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        }
    }
}

fileprivate struct AssociatedKeys {
    static var originalTitle = "originalTitle"
}
