import UIKit

// TODO: - [HT-48] Waiting for adding Home Search bar with filter view.

final class SearchBarWithFilterView: UIView {

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: Configurations

private extension SearchBarWithFilterView {
    private func initView() {
        loadViewFromNib()
    }
}
