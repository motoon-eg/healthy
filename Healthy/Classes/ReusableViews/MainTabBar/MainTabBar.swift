import UIKit

class MainTabBar: UITabBar {
    
    private enum Constants {
        static let customHeight: CGFloat = 100
        static let curveWidth: CGFloat = 64
        static let curveHeight: CGFloat = 42
        static let tabBarItemWidth: CGFloat = 40
    }
    
    private let curveSubLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1.0
        return shapeLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        setupCenterCurve(withWidth: Constants.curveWidth, height: Constants.curveHeight)
        moveItemsToTheCenter()
        configureColors()
    }
    
    // MARK:  Increase the TabBar height
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = Constants.customHeight
        return newSize
    }
    
    // MARK:  If TabBar contains 4 items create unEnabled item under cerve
    
    override func setItems(_ items: [UITabBarItem]?, animated: Bool) {
        var updatedItems = items ?? []
        
        if updatedItems.count == 4 {
            let desiredIndex = 2
            let customItem = UITabBarItem()
            customItem.isEnabled = false
            updatedItems.insert(customItem, at: desiredIndex)
        }
        
        super.setItems(updatedItems, animated: animated)
    }
    
    // MARK:  Create and add curve at the center of TabBar
    
    private func setupCenterCurve(withWidth width:CGFloat, height:CGFloat) {
        curveSubLayer.path = createCurvedPath(frame: frame,
                                              curveWidth: width,
                                              curveHeight: height)
        configureShadow(for: curveSubLayer)
        self.layer.insertSublayer(curveSubLayer, at: 0)
    }
    
    private func configureShadow(for shapeLayer: CALayer) {
        shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
        shapeLayer.shadowRadius = 8
        shapeLayer.shadowColor = UIColor.gray1.withAlphaComponent(0.08).cgColor
        shapeLayer.shadowOpacity = 1
    }
    
    private func createCurvedPath(frame: CGRect, curveWidth: CGFloat, curveHeight: CGFloat) -> CGPath {
        let path = UIBezierPath()
        let center = frame.width / 2
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: (center - curveWidth), y: 0))
        path.addCurve(
            to: CGPoint(x: center, y: curveHeight),
            controlPoint1: CGPoint(x: (center - curveWidth / 2), y: 0),
            controlPoint2: CGPoint(x: center - curveWidth / 2, y: curveHeight))
        path.addCurve(
            to: CGPoint(x: (center + curveWidth), y: 0),
            controlPoint1: CGPoint(x: center + curveWidth / 2, y: curveHeight),
            controlPoint2: CGPoint(x: (center + curveWidth / 2), y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()
        
        return path.cgPath
    }
    
    // MARK:  Make items at the center
    
    private func moveItemsToTheCenter(){
        itemPositioning = .centered
        itemWidth = Constants.tabBarItemWidth
    }
    
    // MARK:  configure Item colors

    func configureColors() {
        tintColor = .primary100
        unselectedItemTintColor = .gray4
    }
    
}
