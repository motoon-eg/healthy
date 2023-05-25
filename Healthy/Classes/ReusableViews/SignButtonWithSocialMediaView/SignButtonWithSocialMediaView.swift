import UIKit

class SignButtonWithSocialMediaView: UIView {

    // MARK: - IBOutlet

    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var signinButton: UIButton!
    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet weak private var facebookButton: UIButton!

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
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupDesign()
    }

    private func setupDesign() {
        signinButton.applyButtonStyle(.primary)

        // MARK: - feat: [HL-4] Add Button styling for media button
        // TODO: - Apply the media button style

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

// MARK: - UIView extension

private extension UIView {

    static var reusableIdentifier: String {
        String("\(Self.self)")
    }

    func loadNibView() {
        Bundle.main.loadNibNamed(Self.reusableIdentifier, owner: self)
    }

}
