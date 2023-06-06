typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func performSignIn()
    func performSignUp()
    func performForgetPassword()
    func performSignInWithGoogle()
    func performSignInWithFacebook()
}

protocol LoginViewModelOutput {

}
