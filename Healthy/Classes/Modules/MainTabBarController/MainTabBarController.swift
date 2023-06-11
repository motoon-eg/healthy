import UIKit

class MainTabBarController: UITabBarController {
    
    private(set) var tabBarAddButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .primary100
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 28
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureVieControllers()
    }

    private func configureTabBar() {
        setupMainTabBar()
        addCenterButton(tabBarAddButton, withSize: CGSize(width: 58, height: 58))
    }

    private func configureVieControllers() {

        let HomeViewController = UIViewController()
        HomeViewController.view.backgroundColor = .red
        HomeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconHome,
            tag: 0)

        let NotificationViewController = UIViewController()
        NotificationViewController.view.backgroundColor = .yellow
        NotificationViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconNotification,
            tag: 0)

        let ProfileViewController = UIViewController()
        ProfileViewController.view.backgroundColor = .systemBrown
        ProfileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconProfile,
            tag: 0)

        let UnionViewController = UIViewController()
        UnionViewController.view.backgroundColor = .systemPink
        UnionViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconUnion,
            tag: 0)

        viewControllers = [HomeViewController,
                           NotificationViewController,
                           ProfileViewController,
                           UnionViewController]
    }

}
