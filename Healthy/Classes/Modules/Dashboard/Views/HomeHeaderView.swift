import UIKit

final class HomeHeaderView: UIView {
    func configure(with viewModel: ViewModel) {
        // Do view model integration...
    }
}

// MARK: ViewModel
extension HomeHeaderView {
    struct ViewModel {
        let title: String
        let subtitle: String
        let imageUrl: URL?
    }
}
