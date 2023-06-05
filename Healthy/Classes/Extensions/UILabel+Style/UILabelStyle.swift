import UIKit

/// The LabelStyling protocol defines a single method called applyStyle(for label: UILabel) that takes
/// a UILabel as input and applies some styling to it. This protocol can be used to create objects or
/// functions that can apply styling to a UILabel in a standardized way.
///
/// Example:
/// ```
/// class BoldLabelStyling: LabelStyling {
///     func applyStyle(for label: UILabel) {
///         label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
///      }
/// }
/// ```
protocol LabelStyling {
    func applyStyle(for label: UILabel)
}

extension UILabel {
    func applyStyle(_ style: LabelStyling) {
        style.applyStyle(for: self)
    }
}
