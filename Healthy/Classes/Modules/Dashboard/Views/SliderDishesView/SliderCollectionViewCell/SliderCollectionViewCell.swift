import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlet

    @IBOutlet private (set) weak var dishImageView: UIImageView!
    @IBOutlet private (set) weak var dishName: UILabel!
    @IBOutlet private (set) weak var timeDuration: UILabel!
    @IBOutlet private (set) weak var dishView: UIView!
    @IBOutlet private (set) weak var rateView: UIView!
    @IBOutlet private (set) weak var rateLable: UILabel!
    // MARK: - Propperties

    // MARK: - Lifecycle

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            configureView()
        }

        // MARK: - Configurations

        private func configureView() {
            dishImageView.roundImage()
//            dishView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 12)
            rateView.setRadius(radius: 10)
        }

        // MARK: Configure with ViewModel

        func configure(with viewModel: ViewModel) {
            dishName.text = viewModel.dishName
            // ...
        }
    }

    // MARK: ViewModel

    extension SliderCollectionViewCell {
        struct ViewModel {
            let imageUrl: UIImage?
            let dishName: String
            let time: String
            let duration: Int
        }
    }
