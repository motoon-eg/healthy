import UIKit

final class SavedRecipesViewController: UIViewController {

    // MARK: Outlets
    private var tableView: UITableView!
    
    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType
    private var dataSource: UITableViewDiffableDataSource<Section, SavedRecipe>!

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
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        view.addSubview(tableView)
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            cell.configure(with: viewModel)
            return cell
        }
    }
}

// MARK: - Actions

extension SavedRecipesViewController {}

// MARK: - Configurations

extension SavedRecipesViewController {}

// MARK: - Private Handlers

private extension SavedRecipesViewController {}
