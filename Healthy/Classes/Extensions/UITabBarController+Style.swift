import UIKit

extension UITabBarController {
    
    func setupMainTabBar() {
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
