import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type, bundle: Bundle? = nil) {
        let bundle = bundle ?? Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
