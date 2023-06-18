import UIKit

/// Managing the onboarding flow when the user is not signed in.
protocol OnboardingCoordinator: AnyObject {
    /// Called when the user acknowledge the starting info.
    func didStartCooking()
    /// Called when the user successfully logs in.
    func didFinishSignIn()
}

// MARK: DefaultOnboardingCoordinator

final class DefaultOnboardingCoordinator: Coordinator {
    let navigationController: UINavigationController
    private let onAuthentication: () -> Void

    init(navigationController: UINavigationController,
         onAuthentication: @escaping () -> Void) {
        self.navigationController = navigationController
        self.onAuthentication = onAuthentication
    }

    func start() {
        let splashViewModel = SplashViewModel(coordinator: self)
        let splashViewController = SplashViewController(viewModel: splashViewModel)
        navigationController.setViewControllers([splashViewController], animated: false)
    }
}

// MARK: OnboardingCoordinator Conformance

extension DefaultOnboardingCoordinator: OnboardingCoordinator {
    func didStartCooking() {
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    func didFinishSignIn() {
        onAuthentication()
    }
}
