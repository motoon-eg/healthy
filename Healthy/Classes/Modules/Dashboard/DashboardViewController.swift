import UIKit

final class DashboardViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var stackView: UIStackView!

    // MARK: Subviews

    @IBOutlet weak var headerView: HomeHeaderView!
    // TODO: - [HT-48] Waiting for adding Home Search bar with filter view.
    @IBOutlet weak var searchView: SearchBarWithFilterView!
    @IBOutlet weak var foodTagsView: FoodTagsView!
    @IBOutlet weak var sliderDishesView: SliderDishesView!
    @IBOutlet private weak var newRecipesView: NewRecipesView!

    // MARK: Properties

    private let viewModel: DashboardViewModelType

    // MARK: Init

    init(viewModel: DashboardViewModelType) {
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
        refreshView()
    }
}

// MARK: - Actions

extension DashboardViewController {}

// MARK: - Header Creation

private extension DashboardViewController {
    private func makeSection(title: String, content: UIView) -> UIView {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.applyStyle(.titleLabelStyle)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, content])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8.0

        return stackView
    }
}

// MARK: - Private Handlers

private extension DashboardViewController {
    func refreshView() {
        headerView.configure(with: viewModel.header)
        foodTagsView.update(with: viewModel.foodTags)
        sliderDishesView.update(with: viewModel.dishes)
        newRecipesView.update(with: viewModel.newRecipes)
    }
}
