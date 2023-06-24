import UIKit
import Combine

final class SavedRecipesViewController: UIViewController {

    enum Section {
        case main
    }

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType
    private (set) var dataSource: UITableViewDiffableDataSource<Section, SavedRecipe>!
    private var subscriptions: Set<AnyCancellable> = []

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

        configureTableView()
        configureTableViewDataSource()
        viewModel.recipesPublisher
            .sink { [weak self] viewModels in
                self?.updateTableData(viewModel: viewModels)
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Actions

extension SavedRecipesViewController {}

// MARK: - Configurations

extension SavedRecipesViewController {
    func configureTableView() {
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
    }

    func configureTableViewDataSource() {
        // TODO:  - Add SavedRecipeCell
    dataSource =
        UITableViewDiffableDataSource<Section, SavedRecipe>(tableView: tableView) { tableView, indexPath, viewModel in
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell
            cell?.update(with: viewModel)
            return cell
        }
    }

    func updateTableData(viewModel: [SavedRecipe]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SavedRecipe>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - Private Handlers

private extension SavedRecipesViewController {}
