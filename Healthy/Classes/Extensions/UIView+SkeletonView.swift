import UIKit
import SkeletonView

public extension UIView {
    func startSkeletonView() {
        isSkeletonable = true
        showAnimatedGradientSkeleton()
    }

    func stopSkeletonView() {
        isSkeletonable = false
        hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }
}
