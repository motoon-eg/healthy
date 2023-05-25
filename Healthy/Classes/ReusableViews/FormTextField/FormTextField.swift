import UIKit

class FormTextField: UIView {
    
    // MARK: Outlets
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    // MARK: Properties
    
    private var onChange: (String) -> () =  { _ in }
    
    var title: String = "" {
        didSet {
            self.titleLabel.text = title
        }
    }
    
    var placeholder: String = "" {
        didSet {
            self.inputTextField.placeholder = placeholder
        }
    }
    
    var keyboardType: UIKeyboardType = .default {
        didSet {
            self.inputTextField.keyboardType = keyboardType
        }
    }
    
    var error: String = "" {
        didSet {
            self.errorLabel.text = error
        }
    }
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        Bundle.main.loadNibNamed(FormTextField.reusableIdentifier, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        configureLayout()
        bindTextFieldChanges()
    }
}

// MARK: Internal Handlers

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
        
        // Waiting for the design of the error label style
        // TODO: - feat: [HL-4] Add UI label styling new design
        errorLabel.textColor = .red
    }
    
    private func bindTextFieldChanges() {
        inputTextField.addTarget(self, action: #selector(textEditingChanged), for: .editingChanged)
    }
    
    @objc private func textEditingChanged() {
        self.errorLabel.text = ""
        onChange(self.inputTextField.text ?? "")
    }
}
