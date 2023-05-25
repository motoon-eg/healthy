import UIKit

class SignButtonWithSocialMediaView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var signinButton: UIButton!
    @IBOutlet weak private var googleButton: UIButton!
    @IBOutlet weak private var facebookButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        loadNibView()
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupDesign()
    }
    
    private func setupDesign() {
        signinButton.applyButtonStyle(.primary)
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
