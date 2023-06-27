import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - Propperties

    // MARK: - Outlet

    @IBOutlet weak var disheImage: UIImageView!
    @IBOutlet weak var disheName: UILabel!
    @IBOutlet weak var timeDuration: UILabel!
    @IBOutlet weak var disheView: UIView!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLable: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureCellView()
    }

    // MARK: - Configurations

    func configureCellView() {
        disheImage.roundedImage()
        disheView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 12)
        rateView.setRadius(radius: 10)
    }

    func configureCellData(viewModel: SliderViewModel) {
//        disheImage.image = viewModel.imageUrl
    }

}

// MARK: ViewModel

extension SliderCollectionViewCell {
    struct SliderViewModel {
        let imageUrl: UIImage?
        let disheName: String
        let time: String
        let duration: Int
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

extension UIView {

    func setRadius(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
    }

   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
