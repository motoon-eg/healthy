import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet private (set) weak var parentVerticalStackView: UIStackView!
    
    @IBOutlet private (set) weak var nameTextField: UITextField!
    
    @IBOutlet private (set) weak var emailTextField: UITextField!
    
    @IBOutlet private (set) weak var passwordTextField: UITextField!
    
    @IBOutlet private (set) weak var confirmPasswordContainerView: UIView!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet private (set) weak var termsAndConditionsHorizontalStackView: UIStackView!
    @IBOutlet private (set) weak var checkBoxButton: CheckboxButton!
    @IBOutlet private (set) weak var acceptTermsTextLabel: UILabel!
    
    @IBOutlet private (set) weak var signInTextLabel: UILabel!
    @IBOutlet private (set) weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
    }
    
}
