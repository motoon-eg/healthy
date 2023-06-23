import UIKit
import Combine

final class SavedRecipesViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: SavedRecipesViewModel
    private var subscriptions = Set<AnyCancellable>()
    private lazy var dataSource = makeDataSource()
    private lazy var tableView = UITableView(frame: view.bounds, style: .plain)

    // MARK: - Initialization

    init(viewModel: SavedRecipesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Saved Recipes"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        bindViewModel()
    }

    // MARK: - Private Methods

    private func makeDataSource() -> UITableViewDiffableDataSource<String, SavedRecipe> {
        let reuseIdentifier = "Cell"
        return UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, recipe in
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            cell.textLabel?.text = recipe.title
            return cell
        }
    }

    private func bindViewModel() {
        viewModel.recipesPublisher
            .map { recipes -> [SavedRecipe] in
                // Transform the recipes if needed
                return recipes
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recipes in
                self?.updateSnapshot(with: recipes)
            }
            .store(in: &subscriptions)

        viewModel.isEmptyPublisher
            .receive(on: DispatchQueue.main)
            .catch { error -> Empty<Bool, Never> in
                print("Error: \(error.localizedDescription)")
                return Empty()
            }
            .sink { [weak self] isEmpty in
                self?.updateEmptyState(isEmpty)
            }
            .store(in: &subscriptions)
    }

    private func updateSnapshot(with recipes: [SavedRecipe]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, SavedRecipe>()
        snapshot.appendSections(["Saved Recipes"])
        snapshot.appendItems(recipes)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func updateEmptyState(_ isEmpty: Bool) {
        if isEmpty {
            let message = "You haven't saved any recipes yet."
            let label = UILabel(frame: view.bounds)
            label.text = message
            label.textAlignment = .center
            tableView.backgroundView = label
        } else {
            tableView.backgroundView = nil
        }
    }

    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

}

extension SavedRecipesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let recipe = dataSource.itemIdentifier(for: indexPath) {
            viewModel.removeSavedRecipe(recipe)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
