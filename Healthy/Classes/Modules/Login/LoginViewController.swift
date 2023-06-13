import UIKit
import Combine

final class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private(set) weak var emailTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var forgotPasswordButton: UIButton!
    @IBOutlet private(set) weak var signInButton: UIButton!
    @IBOutlet private(set) weak var signInWithGoogleButton: UIButton!
    @IBOutlet private(set) weak var signInWithFacebookButton: UIButton!
    @IBOutlet private(set) weak var signUpButton: UIButton!
    
    // MARK: Properties
    
    private let viewModel: LoginViewModelType
    private var subscriptions: Set<AnyCancellable> = []
    
    // MARK: Init
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        configureViewModelInputs()
        configureViewModelOutputs()
    }
}

// MARK: - Actions

private extension LoginViewController {
    @IBAction func didTapSignIn(_ sender: Any) {
        viewModel.login()
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {}
}

// MARK: - Configurations

private extension LoginViewController {
    func configureAppearance() {
        emailTextFieldLabel.applyStyle(.textFieldTitleLabel)
        passwordTextFieldLabel.applyStyle(.textFieldTitleLabel)
        signInButton.applyButtonStyle(.primary)
        signInWithGoogleButton.applyButtonStyle(.primary)
        signInWithFacebookButton.applyButtonStyle(.primary)
    }
}

// MARK: TextFields changes

private extension LoginViewController {
    func bindTextFieldsChanges() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        if sender == emailTextField {
            viewModel.updateEmail(text)
        } else if sender == passwordTextField {
            viewModel.updatePassword(text)
        }
    }
}

// MARK: - Configure ViewModel

private extension LoginViewController {
    func configureViewModelInputs() {
        bindTextFieldsChanges()
    }
    
    func configureViewModelOutputs() {
        bindLoadingIndicator()
        bindErrorMessage()
        bindButtonState()
        bindLoginStatus()
    }
    
    func bindLoadingIndicator() {
        viewModel.isLoadingIndicatorPublisher
            .sink { [weak self] isLoading in
                guard let _ = self else { return }
                
                // TODO: Show loading indicator.
            }
            .store(in: &subscriptions)
    }
    
    func bindErrorMessage() {
        viewModel.isShowErrorMessagePublisher
            .sink { [weak self] message in
                guard let _ = self else { return }
                
                // TODO: Show error message.
            }
            .store(in: &subscriptions)
    }
    
    func bindButtonState() {
        viewModel.isLoginEnabledPublisher
            .assign(to: \.isEnabled, on: signInButton)
            .store(in: &subscriptions)
    }
    
    func bindLoginStatus() {
        viewModel.isLoginStatusPublisher
            .sink { [weak self] status in
                guard let _ = self else { return }
                
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Private Handlers

private extension LoginViewController {}
