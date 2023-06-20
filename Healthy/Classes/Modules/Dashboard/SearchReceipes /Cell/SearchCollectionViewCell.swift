import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet private(set) weak var backImage: UIImageView!
    @IBOutlet private(set) weak var ratingNumber: UILabel!
    @IBOutlet private(set) weak var recipeName: UILabel!
    @IBOutlet private(set) weak var chefName: UILabel!
    @IBOutlet private(set) weak var ratingView: UIStackView!

    // MARK: Set up layout

    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
}

// MARK: Configuration

extension SearchCollectionViewCell {
    private func configureLayout() {
        ratingView.layer.cornerRadius = ratingView.frame.height / 2
        setupGradientLayer()
        backImage.layer.cornerRadius = 10
        backImage.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
    }

    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.2, 1]
        gradientLayer.frame = backImage.frame
        backImage.layer.addSublayer(gradientLayer)
    }
}

// MARK: - ViewModel configurations

extension SearchCollectionViewCell {
    func configureCell(with viewModel: ViewModel) {
        // TODO: - [HT-62] Waiting for adding kingfisher To load image and set it to backImage.
        recipeName.text = viewModel.recipeName
        chefName.text = "By \(viewModel.chefName)"
        ratingNumber.text = "\(viewModel.ratingNumber)"
    }
}

// MARK: ViewModel

extension SearchCollectionViewCell {
    struct ViewModel {
        let recipeName: String
        let chefName: String
        let ratingNumber: Float
        let imageUrl: URL?
    }
}
