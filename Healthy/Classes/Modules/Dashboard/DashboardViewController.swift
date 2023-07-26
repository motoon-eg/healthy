import Combine
import UIKit

final class DashboardViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var stackView: UIStackView!

    // MARK: Subviews

    private let headerView = HomeHeaderView()
    private let tagsView = FoodTagsView()
    private let newRecipesView = NewRecipesView()

    // MARK: Properties

    private let viewModel: DashboardViewModelType
    private var subscriptions: Set<AnyCancellable> = []

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

        configureView()
        configureLayout()
        configureViewModelOutputs()
    }
}

// MARK: - Actions

extension DashboardViewController {}

// MARK: - Configurations

extension DashboardViewController {
    func configureView() {
        // Header
        stackView.addArrangedSubview(headerView)

        // Meal Categories
        stackView.addArrangedSubview(tagsView)

        // New Recipes
        stackView.addArrangedSubview(makeSection(
            title: L10n.Home.NewRecipes.header,
            content: newRecipesView
        ))

        // Workaround to push the content to the top if the content height is
        // less than the available bounds height.
        stackView.addArrangedSubview(UIView())
    }

    func configureLayout() {
        tagsView.heightAnchor
            .equalTo(60)
            .priority(.defaultHigh)
        newRecipesView.heightAnchor
            .equalTo(200)
            .priority(.defaultHigh)
    }

    func configureViewModelOutputs() {
        viewModel.newRecipesPublisher
            .sink { [weak self] viewModels in
                self?.newRecipesView.configure(with: viewModels)
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Header Creation

private extension DashboardViewController {
    /// Create a section view with a title and content.
    /// - Parameters:
    ///   - title: The title for the section.
    ///   - content: The content view to be displayed below the title.
    /// - Returns: A composed `UIView` containing the title and the specified content view.
    private func makeSection(title: String, content: UIView) -> UIView {
        // Create a UILabel to display the title
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.applyHeaderBoldStyle()

        // Create a UIStackView to hold the title label with appropriate layout
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel])
        titleStackView.layoutMargins = UIEdgeInsets(top: 8.0, left: 20.0, bottom: 8.0, right: 20.0)
        titleStackView.isLayoutMarginsRelativeArrangement = true

        // Create a UIStackView to hold the titleStackView and the specified content view
        let stackView = UIStackView(arrangedSubviews: [titleStackView, content])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8.0

        return stackView
    }
}

// MARK: - Private Handlers

private extension DashboardViewController {
    func refreshView() {
        headerView.configure(with: viewModel.header)
    }
}
