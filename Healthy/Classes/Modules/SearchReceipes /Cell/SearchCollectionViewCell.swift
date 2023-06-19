import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    static let reusableIdentifire = "SearchCollectionViewCell"
    fileprivate let gradientLayer = CAGradientLayer()

    // MARK: Outlets
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var ratingNumber: UILabel!
    @IBOutlet weak var recipyName: UILabel!
    @IBOutlet weak var chefName: UILabel!
    @IBOutlet weak var ratingView: UIView!

    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }

    // MARK: Configuration
    func configureCell(with viewModel: ViewModel) {
        // TODO: - [HT-62] Waiting for adding kingfisher To load image and set it to backImage.
        recipyName.text = viewModel.recipyName
        chefName.text = "By \(viewModel.chefName)"
        ratingNumber.text = "\(viewModel.ratingNumber)"
    }

    private func configureUI() {
        ratingView.layer.cornerRadius = ratingView.frame.height / 2
        setupGradientLayer()
        backImage.layer.cornerRadius = 10
        backImage.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
    }

    private func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.2, 1]
        gradientLayer.frame = backImage.frame
        backImage.layer.addSublayer(gradientLayer)
    }

}

// MARK: ViewModel
extension SearchCollectionViewCell {
    struct ViewModel {
        let recipyName: String
        let chefName: String
        let ratingNumber: Float
        let imageUrl: URL?
    }
}
