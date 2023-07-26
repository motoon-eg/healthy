import UIKit
import GoogleSignIn
import FBSDKCoreKit
import NewRelic

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureGoogleSignIn()
        configureFacebookSignin(application: application, launchOptions: launchOptions)
        configureNewRelic()
        configureAppearance()
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
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let facebookResult: () -> Bool = {
            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )
        }

        let googleResult: () -> Bool = {
            GIDSignIn.sharedInstance.handle(url)
        }

        return facebookResult() || googleResult()
    }
}

// MARK: - Configurations

private extension AppDelegate {
    func configureGoogleSignIn() {
        let config = GIDConfiguration(clientID: Constants.googleClientId)
        GIDSignIn.sharedInstance.configuration = config
    }

    func configureFacebookSignin(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }

    func configureNewRelic() {
        NewRelic.start(withApplicationToken: Constants.newRelicAPIKey)
    }

    func configureAppearance() {
        UINavigationBar.applyDefaultAppearance()
    }
}
