import UIKit

final class FilterSearchViewController: UIViewController {

    // MARK: Outlets

    // MARK: Properties

    private let viewModel: FilterSearchViewModelType

    // MARK: Init

    init(viewModel: FilterSearchViewModelType) {
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

extension FilterSearchViewController {}

// MARK: - Configurations

extension FilterSearchViewController {}

// MARK: - Private Handlers

private extension FilterSearchViewController {}
