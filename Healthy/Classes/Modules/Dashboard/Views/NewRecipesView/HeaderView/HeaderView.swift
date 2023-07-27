import UIKit

class HeaderView: UICollectionReusableView {

    var headerTitle = "New Recipes"

    private let title = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func configureTitle() {
        title.font = UIFont(name: "Poppins", size: 18)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = headerTitle
    }

    private func configure() {
        configureTitle()
        backgroundColor = .red
        addSubview(title)
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

}
