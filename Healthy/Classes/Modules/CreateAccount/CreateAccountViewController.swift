import UIKit
// MARK: - CreateAccountViewController
final class CreateAccountViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private(set) weak var parentVerticalStackView: UIStackView!
    @IBOutlet private(set) weak var nameTextField: UITextField!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var confirmPasswordContainerView: UIView!
    @IBOutlet private(set) weak var confirmPasswordTextField: UITextField!
    @IBOutlet private(set) weak var termsAndConditionsHorizontalStackView: UIStackView!
    @IBOutlet private(set) weak var checkBoxButton: CheckboxButton!
    @IBOutlet private(set) weak var acceptTermsTextLabel: UILabel!
    @IBOutlet private(set) weak var signInTextLabel: UILabel!
    @IBOutlet private(set) weak var signUpButton: UIButton!

    // MARK: Properties

    private let viewModel: CreateAccountViewModelType

    // MARK: Init

    init(viewModel: CreateAccountViewModelType) {
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

    func configureTermsAndConditionsCheckbox() {
        viewModel.updateAcceptTermsAndConditions(checkBoxButton.isChecked)
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

// MARK: - Actions
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
            assertionFailure("Unexpected text field: \(sender)")
        }
    }

    @objc private func didTapSignUp(_ sender: Any) {

    }
}
