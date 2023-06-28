import UIKit

class HomeHeaderSkeletonView: UIView {

    // MARK: IBOutlets

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var userImageView: UIImageView!

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSkeletonView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureSkeletonView()
    }

    // MARK: Configurations

    private func configureSkeletonView() {
        titleLabel.startSkeletonView()
        subtitleLabel.startSkeletonView()
        userImageView.startSkeletonView()
    }

}
