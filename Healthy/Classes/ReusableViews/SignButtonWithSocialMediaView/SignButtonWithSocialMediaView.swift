import UIKit

final class SignButtonWithSocialMediaView: UIView {

    // MARK: - IBOutlet

    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var signinButton: UIButton!
    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet weak private var facebookButton: UIButton!
    @IBOutlet private var mediaBackgroundViews: [UIView]!

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
    enum SignButtonTitle {
        case signin
        case signup

        var title: String {
            switch self {
            case .signin: return L10n.Signin.buttonTitle
            case .signup: return L10n.Signup.buttonTitle
            }
        }

    }

    func configure(buttonTitle: SignButtonTitle) {
        signinButton.setTitle(buttonTitle.title, for: .normal)
    }
}
