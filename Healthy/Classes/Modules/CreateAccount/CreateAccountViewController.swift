import UIKit
// MARK: - CreateAccountViewController
final class CreateAccountViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var checkBoxButton: CheckboxButton!
    @IBOutlet private weak var signInTextLabel: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!

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

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        configureTermsAndConditionsCheckbox()
        configureSignUpButton()
        configureViewModel()
    }
}
// MARK: - Actions
private extension CreateAccountViewController { }

// MARK: - Configurations
private extension CreateAccountViewController {
  func configureTextFields() {
    nameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    confirmPasswordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)

  }

  func  configureTermsAndConditionsCheckbox() {
    if checkBoxButton.isChecked {
      viewModel.updateAcceptTermsAndConditions(true)
    }
  }
  func  configureSignUpButton() {
          signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
      }

      func configureViewModel() {
          viewModel.configureButtonEnabled { [weak self] isEnabled in
              self?.signUpButton.isEnabled = isEnabled
          }
      }
  }
  // MARK: - Private Handlers
private extension CreateAccountViewController {
  @objc func textDidChange(_ sender: UITextField) {
    guard let text = sender.text else { return }

    switch sender {
    case nameTextField:
      viewModel.updateUsername(text)
    case emailTextField:
      viewModel.updateEmail(text)
    case passwordTextField:
      viewModel.updatePassword(text)
    case confirmPasswordTextField:
      viewModel.updateConfirmPassword(text)
    default:
      break
    }
  }

  @objc private func didTapSignUp(_ sender: Any) {

      }
  }
