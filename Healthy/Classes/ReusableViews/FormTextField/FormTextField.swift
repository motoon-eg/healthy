import UIKit

class FormTextField: UIView {

    // MARK: Outlets

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!

    // MARK: Properties

    private var onChange: (String) -> Void = { _ in }

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
        configureTextFieldObserver()
    }
}

// MARK: Getters & Setters properties

extension FormTextField {
    var title: String {
        get {
            return self.titleLabel.text ?? ""
        }

        set {
            self.titleLabel.text = newValue
        }
    }

    var placeholder: String {
        get {
            return self.inputTextField.placeholder ?? ""
        }

        set {
            self.inputTextField.placeholder = newValue
        }
    }

    var keyboardType: UIKeyboardType {
        get {
            return self.inputTextField.keyboardType
        }

        set {
            self.inputTextField.keyboardType = newValue
        }
    }

    var error: String {
        get {
            return self.errorLabel.text ?? ""
        }

        set {
            self.errorLabel.text = newValue
        }
    }
}

// MARK: Handlers

extension FormTextField {
    func onChange(_ onChange: @escaping (String) -> Void) {
        self.onChange = onChange
    }
}

// MARK: Private Handlers

extension FormTextField {
    private func configureLayout() {
        titleLabel.applyStyle(.textFieldTitleLabel)
        inputTextField.applyTextFieldStyle(.primary)
        errorLabel.isHidden = true
        errorLabel.textColor = .warning
    }

    private func configureTextFieldObserver() {
        inputTextField.addTarget(self, action: #selector(textEditingChanged), for: .editingChanged)
    }

    @objc private func textEditingChanged() {
        self.errorLabel.text = ""
        onChange(self.inputTextField.text ?? "")
    }
}
