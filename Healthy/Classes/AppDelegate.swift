import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        gidSignInConfiguration()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration",
                                    sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        // this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded
        // scenes, as they will not return.
    }

}

// MARK: - Authentication Handler

extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}

// MARK: - Helper Methods

private extension AppDelegate {
    func gidSignInConfiguration() {
        let config = GIDConfiguration(clientID: Constatns.clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
}

// MARK: - Constants

private extension AppDelegate {
    enum Constatns {
        static let clientID = "500241227951-jfe9f5o8li3l753c2146hqfru8aaa7o5.apps.googleusercontent.com"
    }
}
// swiftlint:enable line_length
