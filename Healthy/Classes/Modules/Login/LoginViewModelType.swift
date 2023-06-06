typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

protocol LoginViewModelInput {
    func performSignIn()
    func performSignUp()
    func performForgetPassword()
}

protocol LoginViewModelOutput {

}
