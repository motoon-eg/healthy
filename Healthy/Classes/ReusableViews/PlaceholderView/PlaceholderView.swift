import UIKit

class PlaceholderView: UIView {

    // MARK: Outlets

    @IBOutlet private(set) weak var imageView: UIImageView!
    @IBOutlet private(set) weak var messageLabel: UILabel!
    @IBOutlet private(set) weak var actionButton: UIButton!

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    // MARK: Configurations

    private func initView() {
        loadViewFromNib()
        configureLayout()
    }

    /// Closure to be executed whenever the Action Button is pressed.
    ///
    var onAction: (() -> Void)?

    // MARK: - Public Methods

    /// Displays the receiver in a given superview. The Overlay will be attached to all edges.
    ///
    func attach(to superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(self)
        superview.fillSubview(self)
    }
}

// MARK: Getters & Setters properties
extension PlaceholderView {

    var messageImage: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }

    /// Overlay's Top Image Tint Color.
    ///
    var messageImageTintColor: UIColor? {
        get {
            return imageView.tintColor
        }
        set {
            imageView.tintColor = newValue
        }
    }

    /// Message to be displayed below the Image.
    ///
    var messageText: String? {
        get {
            return messageLabel.text
        }
        set {
            messageLabel.text = newValue
        }
    }

    /// Action Button's visibility.
    ///
    var actionVisible: Bool {
        get {
            return actionButton.isHidden == false
        }
        set {
            actionButton.isHidden = !newValue
        }
    }

    /// Action Button's Text.
    ///
    var actionText: String? {
        get {
            return actionButton.titleLabel?.text
        }
        set {
            actionButton.setTitle(newValue, for: .normal)
        }
    }
}

// MARK: Private Handlers

extension PlaceholderView {
    private func configureLayout() {
        messageLabel.applyStyle(.messageLabel)
        actionButton.applyButtonStyle(.primary)
    }
}

// MARK: Actions

extension PlaceholderView {
    @IBAction func didTapButton(_ sender: Any) {
        onAction?()
    }
}
