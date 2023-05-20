
import UIKit

class FormTextField: UIView {
    
    // MARK: - Outlets
    //
    
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var inputTextField: UITextField!
    @IBOutlet weak private var errorLabel: UILabel!
    
    // MARK: - Properties
    //
    var text: ((String)->())?
    
    // MARK: - init
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        Bundle.main.loadNibNamed(FormTextFieldResources.nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupDesign()
        bindToTextFieldsChanges()
    }
}

// MARK: - configure
//

extension FormTextField {
    func configure(title: String, placeholder: String?, type: UIKeyboardType) {
        self.titleLabel.text = title
        self.inputTextField.placeholder = placeholder
        self.inputTextField.keyboardType = type
    }
    
    func setError(_ errorText: String) {
        self.errorLabel.isHidden = false
        self.errorLabel.text = errorText
    }
}

// MARK: - Private Handlers
//

extension FormTextField {
    private func setupDesign() {
        titleLabel.applyStyle(.textFieldTitleLabel)
        inputTextField.applyTextFieldStyle(.primary)
        
        // waiting for design of error label style
        //MARK: - feat: [HL-4] Add UI label styling new design
        errorLabel.textColor = .red
    }
    
    private func bindToTextFieldsChanges() {
        inputTextField.addTarget(self, action: #selector(textEditingChanged), for: .editingChanged)
    }
    
    @objc private func textEditingChanged() {
        self.errorLabel.isHidden = true
        text?(self.inputTextField.text ?? "")
    }
}
