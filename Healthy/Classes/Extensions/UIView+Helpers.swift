import UIKit

// MARK: - UIView extension

extension UIView {

    static var reusableIdentifier: String {
        String("\(Self.self)")
    }

    func loadNibView() {
        Bundle.main.loadNibNamed(Self.reusableIdentifier, owner: self)
    }

}

extension UIView {
    func setupDefaultShadow() {
        layer.cornerRadius = 10

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 6.0
    }

    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else {return}
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: padding.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding.bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: padding.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -padding.right)
        ])
    }
}
