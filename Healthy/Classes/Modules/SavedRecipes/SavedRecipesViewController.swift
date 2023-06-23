import UIKit
import Combine

final class SavedRecipesViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: Properties

    private let viewModel: SavedRecipesViewModelType
    private var subscriptions: Set<AnyCancellable> = []
    private var dataSource: UITableViewDiffableDataSource<Int, SavedRecipe>!

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
        bindViewModel()
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
    // tableView.register(RecipeListTableViewCell.self, forCellReuseIdentifier: RecipeListTableViewCell.reuseIdentifier)
//        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, recipe in
    // guard let cell = tableView.dequeueReusableCell(withIdentifier: RecipeListTableViewCell.reuseIdentifier,
        // for: indexPath) as? RecipeListTableViewCell else {
//                return UITableViewCell()
//            }
//            //cell.configure(with: recipe.recipe)
//            return cell
//        }
    }

    private func  bindViewModel() {
        viewModel.recipesPublisher
            .sink { [weak self] recipes in
                var snapshot = NSDiffableDataSourceSnapshot<Int, SavedRecipe>()
                snapshot.appendSections([0])
                snapshot.appendItems(recipes)
                self?.dataSource.apply(snapshot, animatingDifferences: true)
            }
            .store(in: &subscriptions)

        viewModel.isEmptyPublisher
            .sink { [weak self] isEmpty in
                self?.tableView.isHidden = isEmpty
            }
            .store(in: &subscriptions)
        tableView.delegate = self
    }
}

extension SavedRecipesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Handle row selection
        guard let savedRecipe = dataSource.itemIdentifier(for: indexPath) else { return }
        viewModel.removeSavedRecipe(savedRecipe)
    }

}
