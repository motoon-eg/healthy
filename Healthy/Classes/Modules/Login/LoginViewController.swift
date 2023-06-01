import UIKit
import GoogleSignIn
import FBSDKLoginKit

final class LoginViewController: UIViewController {
  // MARK: Outlets

  @IBOutlet private(set) weak var emailTextFieldLabel: UILabel!
  @IBOutlet private(set) weak var emailTextField: UITextField!
  @IBOutlet private(set) weak var passwordTextFieldLabel: UILabel!
  @IBOutlet private(set) weak var passwordTextField: UITextField!
  @IBOutlet private(set) weak var forgotPasswordButton: UIButton!
  @IBOutlet private(set) weak var signInButton: UIButton!

    @IBOutlet private(set) weak var emailTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextFieldLabel: UILabel!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var forgetPasswordButton: UIButton!
    @IBOutlet private(set) weak var signInButton: UIButton!
    @IBOutlet private(set) weak var signInWithFacebookButton: UIButton!
    @IBOutlet private(set) weak var signInWithGoogleButton: UIButton!
    @IBOutlet private(set) weak var signUpButton: UIButton!
    @IBOutlet private(set) weak var facebookButton: FBLoginButton!
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

    if let token = AccessToken.current,
       !token.isExpired {
      // User is logged in, do work such as go to next view controller.
      let token = token.tokenString
      let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                               parameters: ["fields": "email,name"],
                                               tokenString: token, version: nil, httpMethod: .get)
      request.start { (_, result, _) in
        print("\(result ?? "")")
      }
      } else {
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
        facebookButton.permissions = ["public_profile", "email"]
        facebookButton.delegate   = self
      }

        configureAppearance()
        bindTextFieldsChanges()
        bindLoadingIndicator()
        bindErrorMessage()
        bindButtonState()
        bindLoginStatus()
    }
  @IBAction func didTapSignInWithFacebook(_ sender: Any) {
   
  }
}

// MARK: - Actions

extension LoginViewController {
    @IBAction func didTapSignIn(_ sender: Any) {
        viewModel.performSignIn()
    }

    @IBAction func didTapSignUp(_ sender: Any) {
        viewModel.performSignUp()
    }

    @IBAction func didTapForgetPassowrd(_ sender: Any) {
        viewModel.performForgetPassword()
    }

    @IBAction func didTapSignInWithGoogle(_ sender: Any) {
        viewModel.performSignInWithGoogle()
    }

    @IBAction func didTapSignInWithFacebook(_ sender: Any) {
        viewModel.performSignInWithFacebook()
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

// MARK: bind to text fields changes

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

// MARK: - View model binds

private extension LoginViewController {
    func bindLoadingIndicator() {
        viewModel.onLoadingIndicator { _ in
            // TODO: Update loading state.
        }
    }

    func bindErrorMessage() {
        viewModel.onErrorMessage { _ in
            // TODO: Show error message.
        }
    }

    func bindButtonState() {
        viewModel.onButtonEnabled { [weak self] isEnabled in
            guard let self else { return }
            self.signInButton.isEnabled = isEnabled
        }
    }

    func bindLoginStatus() {
        viewModel.onLoginStatus { status in
            switch status {
            case true:
                // TODO: Make action when login success.
                break
            case false:
                // TODO: Make action when login fail.
                break
            }
        }
    }
}

// MARK: - Private Handlers

private extension LoginViewController {}

extension LoginViewController: LoginButtonDelegate {
  func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
    let token = result?.token?.tokenString

    let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                             parameters: ["fields": "email,name"],
                                             tokenString: token, version: nil, httpMethod: .get)
    request.start { (_, result, _) in
      print("\(result ?? "")")
    }
  }

  func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
    print("Logout")
  }
}
