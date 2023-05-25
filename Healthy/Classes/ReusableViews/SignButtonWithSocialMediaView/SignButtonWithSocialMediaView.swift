import UIKit

class SignButtonWithSocialMediaView: UIView {

    // MARK: - IBOutlet

    @IBOutlet weak private(set) var contentView: UIView!
    @IBOutlet weak private(set) var signinButton: UIButton!
    @IBOutlet weak private(set) var googleButton: UIButton!
    @IBOutlet weak private(set) var facebookButton: UIButton!
    @IBOutlet private(set) var mediaBackgroundViews: [UIView]!

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    // MARK: - Setup UI

    private func initView() {
        loadNibView()
        addSubview(contentView)
        contentView.fillSuperview()
        setupDesign()
    }

    private func setupDesign() {
        signinButton.applyButtonStyle(.primary)
        mediaBackgroundViews.forEach { $0.setupDefaultShadow()}
    }
}

// MARK: - configure

extension SignButtonWithSocialMediaView {
    enum SignButtonTitle: String {
        case signin = "Sign In"
        case signup = "Sign Up"
    }

    func configure(buttonTitle: SignButtonTitle) {
        signinButton.setTitle(buttonTitle.rawValue, for: .normal)
    }
}

// MARK: - UIView Shadow

private extension UIView {
    func setupDefaultShadow() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 6.0
    }
}

// MARK: - UIView fill to Edge

private extension UIView {
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

// MARK: - UIView load nib

private extension UIView {

    static var reusableIdentifier: String {
        String("\(Self.self)")
    }

    func loadNibView() {
        Bundle.main.loadNibNamed(Self.reusableIdentifier, owner: self)
    }

}
