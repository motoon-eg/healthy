import UIKit

/// A coordinator is responsible for managing the flow of navigation within an app's user interface.
/// It typically has a navigationController property for managing the navigation stack and a start method for
/// starting the navigation flow.
///
/// Inspired by. https://khanlou.com/2015/01/the-coordinator
protocol Coordinator {

    /// The navigation controller used for managing the navigation stack.
    var navigationController: UINavigationController { get }

    /// Starts the navigation flow managed by the coordinator.
    ///
    /// This method is called to initiate the navigation flow managed by the coordinator. It typically involves
    /// pushing / presenting one or more view controllers onto the navigation stack of the `navigationController`.
    func start()
}
