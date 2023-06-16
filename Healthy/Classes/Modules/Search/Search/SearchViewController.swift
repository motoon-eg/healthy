import UIKit

final class SearchViewController: UIViewController {

    // MARK: Outlets

    // MARK: Properties

    private let viewModel: SearchViewModelType

    // MARK: Init

    init(viewModel: SearchViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Actions

extension SearchViewController {}

// MARK: - Configurations

extension SearchViewController {}

// MARK: - Private Handlers

private extension SearchViewController {}
