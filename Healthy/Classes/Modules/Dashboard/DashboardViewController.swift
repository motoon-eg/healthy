import UIKit

final class DashboardViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var stackView: UIStackView!

    // MARK: Subviews

    private let headerView = HomeHeaderView()
//    private let dishesView = CardPagingLayout()
    private let dishesView = SliderDishesView()
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

        configureView()
    }
}

// MARK: - Actions

extension DashboardViewController {}

// MARK: - Configurations

extension DashboardViewController {
    func configureView() {
        stackView.addArrangedSubview(headerView)
        stackView.addArrangedSubview(dishesView)
        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: dishesView)
//        stackView.addArrangedSubview(collectionView)
       
    }
}

// MARK: - Private Handlers

private extension DashboardViewController {
    func refreshView() {
        headerView.configure(with: viewModel.header)
    }
}



