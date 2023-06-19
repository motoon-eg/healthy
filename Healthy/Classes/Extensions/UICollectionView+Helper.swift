import UIKit

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func registerNibCell<T: UICollectionViewCell>(cellClass: T.Type) {
        let nib = UINib(nibName: cellClass.reuseIdentifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
}
