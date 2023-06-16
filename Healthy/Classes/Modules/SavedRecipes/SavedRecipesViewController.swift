import UIKit

final class SavedRecipesViewController: UIViewController {

    // MARK: Outlets

    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType

    // MARK: Init

    init(viewModel: SavedRecipesViewModelType) {
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

extension SavedRecipesViewController {}

// MARK: - Configurations

extension SavedRecipesViewController {}

// MARK: - Private Handlers

private extension SavedRecipesViewController {}
