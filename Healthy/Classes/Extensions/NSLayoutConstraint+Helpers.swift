import UIKit

extension NSLayoutDimension {
    /// Creates a constraint that sets the dimension's constant value to the provided CGFloat.
    /// - Parameter value: The constant value to set for the dimension.
    /// - Returns: The created constraint, which is activated automatically.
    @discardableResult
    func equalTo(_ value: CGFloat) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: value)
        constraint.isActive = true
        return constraint
    }
}

extension NSLayoutConstraint {
    /// Sets the priority of the constraint.
    /// - Parameter priority: The UILayoutPriority to set for the constraint.
    /// - Returns: The modified constraint, allowing for chaining with other methods.
    @discardableResult
    func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        isActive = true
        return self
    }
}
