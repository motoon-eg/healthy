import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlet

    @IBOutlet private (set) weak var dishImageView: UIImageView!
    @IBOutlet private (set) weak var dishName: UILabel!
    @IBOutlet private (set) weak var timeDuration: UILabel!
    @IBOutlet private (set) weak var dishView: UIView!
    @IBOutlet private (set) weak var rateView: UIView!
    @IBOutlet private (set) weak var rateLabel: UILabel!
    @IBOutlet private (set) weak var unionView: UIView!
    @IBOutlet private (set) weak var timeLabel: UILabel!

    // MARK: - Propperties

    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureView()
    }

    // MARK: - Configurations

    private func configureView() {
        dishImageView.roundView()
        unionView.roundView()
        dishView.setRadius(radius: 12)
        rateView.setRadius(radius: 10)
        rateLabel.applyStyle(.rateLabel)
        timeDuration.applyStyle(.durationLabel)
    }

    // MARK: Configure with ViewModel

    func configure(with viewModel: ViewModel) {
        dishName.text = viewModel.dishName
        timeDuration.text = viewModel.duration
        // ...
    }
}

// MARK: ViewModel

extension SliderCollectionViewCell {
    struct ViewModel {
        let imageUrl: UIImage?
        let dishName: String
        let time: String
        let duration: String
        let rating: Double
    }
}
