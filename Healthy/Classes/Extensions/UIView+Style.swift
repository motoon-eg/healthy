import UIKit

// MARK: Apply primary gradient to UIView.

extension UIView {
    func applyPrimaryGradient() {
        
        // Create a new gradient layer.
        let gradientLayer = CAGradientLayer()
        
        // Set the colors and locations for the gradient layer.
        gradientLayer.colors =  [
            UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor,
            UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        ]
        
        gradientLayer.locations = [0.0, 1]
        
        // Set the start and end points for the gradient layer.
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        // Set the frame to the layer.
        gradientLayer.frame = frame
        
        // Add the gradient layer as a sublayer to the background view.
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
