import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var parentVerticalStackView: UIStackView!

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var confirmPasswordContainerView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var termsAndConditionsHorizontalStackView: UIStackView!
    @IBOutlet weak var checkBoxButton: CheckboxButton!
    @IBOutlet weak var acceptTermsTextLabel: UILabel!

    @IBOutlet weak var signInTextLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSignUp(_ sender: Any) {
    }

}
