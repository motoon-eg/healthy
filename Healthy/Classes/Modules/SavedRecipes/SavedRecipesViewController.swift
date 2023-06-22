import UIKit

final class SavedRecipesViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType
    private var dataSource: UITableViewDiffableDataSource<Int, SavedRecipe>?

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
        title = "Saved Recipes"
        configureTableView()
        configureDataSource()
    }
}

// MARK: - Actions

extension SavedRecipesViewController {}

// MARK: - Configurations

extension SavedRecipesViewController {}

// MARK: - Private Handlers

private extension SavedRecipesViewController {
    
 // MARK: - Private Methods
    
    private func configureTableView() {
        
    }
    
    private func configureDataSource() {
        
    }
}
