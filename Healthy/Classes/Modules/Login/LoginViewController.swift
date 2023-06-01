import UIKit
import GoogleSignIn

final class LoginViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private(set) weak var emailTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var forgotPasswordButton: UIButton!
    @IBOutlet private(set) weak var signInButton: UIButton!
    @IBOutlet private(set) weak var signInWithFacebookButton: UIButton!
    @IBOutlet private(set) weak var signUpButton: UIButton!

    // MARK: Properties

    private let viewModel: LoginViewModelType

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
    }
}

// MARK: - Actions

private extension LoginViewController {
    @IBAction func didTapSignIn(_ sender: Any) {}

    @IBAction func didTapSignUp(_ sender: Any) {}

    @IBAction func didTapSignInWithGoogle(_ sender: Any) {
      GIDSignIn.sharedInstance.signIn(withPresenting: self) { _, error in
        guard error == nil else {
            debugPrint("Error \(String(describing: error?.localizedDescription))")
            return
        }

        // If sign in succeeded, display the app's main content View.
      }
    }
}

// MARK: - Configurations

private extension LoginViewController {
    func configureAppearance() {
        emailTextFieldLabel.applyStyle(.textFieldTitleLabel)
        passwordTextFieldLabel.applyStyle(.textFieldTitleLabel)
        signInButton.applyButtonStyle(.primary)
        signInWithFacebookButton.applyButtonStyle(.plainGold)
    }
}

// MARK: - Private Handlers

private extension LoginViewController {}
