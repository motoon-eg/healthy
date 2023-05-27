import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var checkBoxButton: CheckboxButton!
    @IBOutlet weak var signInTextLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
  // MARK: Properties
  
   private let viewModel: CreateAccountviewModelType
  
  // MARK: Init
  
  init(viewModel: CreateAccountviewModelType) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: Lifecycle
  override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFields()
        bindCheckBoxButton()
        bindSignUpButton()
        bindViewModel()
    }
   

}

// MARK: - Actions
extension CreateAccountViewController { }

// MARK: - Configurations
extension CreateAccountViewController {
  func bindTextFields(){
    nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    confirmPasswordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

  }
  
  func  bindCheckBoxButton(){
    if checkBoxButton.isChecked {
      viewModel.updateAcceptTermsAndConditions(true)
    }
  }
  
  func  bindSignUpButton(){
    signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
  }
  
  func bindViewModel(){
    viewModel.configureButtonEnabled { [weak self] onEnabled in
      self?.signUpButton.isEnabled = onEnabled
    }
  }
}

// MARK: - Private Handlers
private extension CreateAccountViewController{
  @objc func textDidChange(_ sender: UITextField) {
    guard let text = sender.text else { return }
    
    if sender == nameTextField {
      viewModel.updateUsername(text)
    } else if sender == emailTextField {
      viewModel.updateEmail(text)
    } else if sender == passwordTextField {
      viewModel.updatePassword(text)
    } else if sender == confirmPasswordTextField {
      viewModel.updateConfirmPassword(text)
    }
  }
  
  @objc func didTapSignUp(_ sender: Any) {
    
  }
}
