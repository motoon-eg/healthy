import UIKit
import Combine

final class SavedRecipesViewController: UIViewController {

    enum Section {
        case main
    }

    // MARK: Outlets

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!

    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType
    private (set) var dataSource: UITableViewDiffableDataSource<Section, SavedRecipesTableViewCell.ViewModel>!
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

        configureNavigationBar()
        configureTableView()
        configureTableViewDataSource()
        setupBindings()
    }
}

// MARK: - Actions

extension SavedRecipesViewController {}

// MARK: - Configurations

extension SavedRecipesViewController {
    func configureNavigationBar() {
        navigationBar.topItem?.title = "Saved recipes"
    }

    func configureTableView() {
        tableView.registerNib(cell: SavedRecipesTableViewCell.self)
    }

    func configureTableViewDataSource() {
        dataSource = UITableViewDiffableDataSource
        <Section, SavedRecipesTableViewCell.ViewModel>(tableView: tableView) { tableView, _, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: SavedRecipesTableViewCell.reuseIdentifier)
            as? SavedRecipesTableViewCell
            cell?.update(with: viewModel)
            return cell
        }
    }

    func updateTableData(viewModel: [SavedRecipesTableViewCell.ViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, SavedRecipesTableViewCell.ViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func setupBindings() {
        viewModel.recipesPublisher
            .sink { [weak self] viewModels in
                self?.updateTableData(viewModel: viewModels)
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Private Handlers

private extension SavedRecipesViewController {}
