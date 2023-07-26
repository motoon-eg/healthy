import UIKit

final class NewRecipesView: UIView {

    // MARK: - Type Aliases

    typealias ViewModel = NewRecipeCollectionViewCell.ViewModel

    // MARK: - Views

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: NewRecipesCollectionViewLayout(itemWidthPercentage: 0.7)
    )

    // MARK: - Properties

    private lazy var dataSource = createDataSource()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    // MARK: - View Configuration

    private func configureView() {
        addSubview(collectionView)
        fillSubview(collectionView)

        collectionView.register(NewRecipeCollectionViewCell.self)
        collectionView.showsHorizontalScrollIndicator = false
    }

    // MARK: - Data Configuration

    /// Configure the collection view with an array of view models.
    /// - Parameter viewModels: An array of `ViewModel` objects representing the data to display.
    func configure(with viewModels: [ViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])

        let items = viewModels.map { Item(viewModel: $0) }
        snapshot.appendItems(items, toSection: .main)

        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - DataSource

private extension NewRecipesView {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>

    func createDataSource() -> DataSource {
        DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(for: indexPath) as NewRecipeCollectionViewCell
            cell.configure(with: item.viewModel)
            return cell
        }
    }
}

// MARK: - Section & Item

private extension NewRecipesView {
    enum Section {
        case main
    }

    struct Item: Hashable {
        let identifier = UUID()
        let viewModel: ViewModel

        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }
}

/*
// This is only valid if you're using Xcode 15. Please make sure to update the
// minimum deployment target to iOS 17.
#Preview {
    NewRecipesView()
}
*/
