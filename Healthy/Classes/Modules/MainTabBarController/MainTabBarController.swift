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
    }

    private func configureTabBar() {
        setupMainTabBar()
        addCenterButton(tabBarAddButton, withSize: CGSize(width: 58, height: 58))
        setupViewControllers()
    }

    // MARK:  Setup TabBar ViewControllers

    private func setupViewControllers() {
        let homeNavigationController = createHomeNavigationController()
        let notificationNavigationController = createNotificationNavigationController()
        let profileNavigationController = createProfileNavigationController()
        let unionNavigationController = createUnionNavigationController()
        
        viewControllers = [homeNavigationController,
                           notificationNavigationController,
                           profileNavigationController,
                           unionNavigationController]
    }
 
    private func createHomeNavigationController() -> UINavigationController {
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .red
        homeViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconHome,
            tag: 0)
        return UINavigationController(rootViewController: homeViewController)
    }
    
    private func createNotificationNavigationController() -> UINavigationController {
        let notificationViewController = UIViewController()
        notificationViewController.view.backgroundColor = .yellow
        notificationViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconNotification,
            tag: 0)
        return UINavigationController(rootViewController: notificationViewController)
    }
    
    private func createProfileNavigationController() -> UINavigationController {
        let profileViewController = UIViewController()
        profileViewController.view.backgroundColor = .systemBrown
        profileViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconProfile,
            tag: 0)
        return UINavigationController(rootViewController: profileViewController)
    }
    
    private func createUnionNavigationController() -> UINavigationController {
        let unionViewController = UIViewController()
        unionViewController.view.backgroundColor = .systemPink
        unionViewController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage.iconUnion,
            tag: 0)
        return UINavigationController(rootViewController: unionViewController)
    }

}
