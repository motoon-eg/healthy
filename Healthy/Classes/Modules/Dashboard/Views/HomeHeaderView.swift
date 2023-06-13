import UIKit

final class HomeHeaderView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    @IBOutlet private(set) weak var subtitleLabel: UILabel!
    @IBOutlet private(set) weak var userImageView: UIImageView!
    
    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    // MARK: Configurations

    private func initView() {
        loadViewFromNib()
        configureLayout()
    }
    
    private func configureLayout() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 120),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    func configure(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        
        // TODO: - Waiting when add kingfisher (or any library for handle image cashing)
    }
}

// MARK: ViewModel

extension HomeHeaderView {
    struct ViewModel {
        let title: String
        let subtitle: String
        let imageUrl: URL
    }
}
