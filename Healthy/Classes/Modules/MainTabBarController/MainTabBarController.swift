import UIKit

final class MainTabBarController: UITabBarController {

    // MARK: Properties

    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .primary100
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 28
        return button
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }

    // MARK: Configurations

    private func configureTabBar() {
        configureMainTabBar()
        addCenterButton(addButton, withSize: CGSize(width: 58, height: 58))
        configureViewControllers()
    }
}

// MARK: Add Custom TabBar and CenterButton

private extension MainTabBarController {

    func configureMainTabBar() {
        let customTabBar = MainTabBar()
        setValue(customTabBar, forKey: "tabBar")
    }

    func addCenterButton(_ button: UIButton, withSize size: CGSize) {
        tabBar.addSubview(button)

        button.layer.cornerRadius = size.height / 2
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            button.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -22),
            button.heightAnchor.constraint(equalToConstant: size.height),
            button.widthAnchor.constraint(equalToConstant: size.width)
        ])
    }
}

// MARK: Configure TabBar ViewControllers

private extension MainTabBarController {

    private func configureViewControllers() {
        let homeViewController = makeHomeViewController()
        let notificationViewController = makeNotificationViewController()
        let profileViewController = makeProfileViewController()
        let unionViewController = makeUnionViewController()
        viewControllers = [
            homeViewController,
            notificationViewController,
            profileViewController,
            unionViewController
        ]
    }

    private func makeHomeViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconHome,
            tag: 0
        )
        return viewController
    }

    private func makeNotificationViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .yellow
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconNotification,
            tag: 0
        )
        return viewController
    }

    private func makeProfileViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemBrown
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconProfile,
            tag: 0
        )
        return viewController
    }

    private func makeUnionViewController() -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .systemPink
        viewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconUnion,
            tag: 0
        )
        return viewController
    }
}
