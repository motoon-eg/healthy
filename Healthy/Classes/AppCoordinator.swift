import UIKit

/// A coordinator responsible for managing the flow of navigation within an app's lifecycle.
final class AppCoordinator {
    private let window: UIWindow
    private var children: [Coordinator] = []
    private var isLoggedIn = false // TODO: [HL-74] Replace with actual implentation

    /// Initializes a new `AppCoordinator` object with the specified window.
    ///
    /// - Parameter window: The window used for displaying the app's user interface.
    init(window: UIWindow) {
        self.window = window
    }

    /// Starts the navigation flow managed by the coordinator.
    ///
    /// This method is called to initiate the navigation flow managed by the coordinator. It determines
    /// whether the user is logged in or not, and displays the appropriate flow accordingly.
    func start() {
        if isLoggedIn {
            displayLoggedInFlow()
        } else {
            displayOnboardingFlow()
        }
    }
}

// MARK: Flows Helpers

private extension AppCoordinator {
    /// Displays the logged-in flow.
    func displayLoggedInFlow() {
        let viewController = MainTabBarController()
        replaceRootViewController(viewController)
    }

    /// Displays the onboarding flow.
    func displayOnboardingFlow() {
        let navigationController = UINavigationController()
        let coordinator = DefaultOnboardingCoordinator(navigationController: navigationController) { [weak self] in
            guard let self else {
                return
            }

            self.children.removeAll(where: { $0 is DefaultOnboardingCoordinator })
            self.isLoggedIn = true
            self.start()
        }

        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
}

// MARK: Window Replacement

private extension AppCoordinator {
    ///  Replaces the root view controller of the app's window.
    ///
    /// This method sets the specified view controller as the root view controller of the app's window,
    /// and makes the window visible.
    func replaceRootViewController(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
