import UIKit

// MARK: ViewModel

extension NewRecipesView {
    struct ViewModel {
        var newRecipes: [HomeNewRecipeCollectionViewCell.ViewModel] = []
        var onSelect: (HomeNewRecipeCollectionViewCell.ViewModel) -> Void = { _ in }
    }
}

final class NewRecipesView: UIView {

    // MARK: Outlets

    @IBOutlet private(set) weak var newRecipesCollectionView: UICollectionView!

    // MARK: Properties

    private var viewModel = ViewModel()

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: Configure Categories

extension NewRecipesView {
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        newRecipesCollectionView.reloadData()
    }
}

// MARK: Configurations

private extension NewRecipesView {
    private func initView() {
        loadViewFromNib()
        configureTagsCollectionView()
    }

    private func configureTagsCollectionView() {
        newRecipesCollectionView.collectionViewLayout = .createTagsLayout()
        newRecipesCollectionView.register(HomeNewRecipeCollectionViewCell.self)
        newRecipesCollectionView.register(HeaderView.self,
                                          forSupplementaryViewOfKind: "header",
                                          withReuseIdentifier: HeaderView.reuseIdentifier)
        newRecipesCollectionView.dataSource = self
        newRecipesCollectionView.delegate = self
    }
}

extension NewRecipesView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.newRecipes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeNewRecipeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        // TODO: Make it safe get index
        let viewModel = viewModel.newRecipes[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.onSelect(viewModel.newRecipes[indexPath.row])
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(
            ofKind: "header",
            withReuseIdentifier: HeaderView.reuseIdentifier,
            for: indexPath) as? HeaderView else {
            assertionFailure("Could not dequeue Reusable Supplementar View")
            return UICollectionReusableView()}
        return view
    }

}

// MARK: Layout

private extension UICollectionViewLayout {

    static func createTagsLayout() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(280),
            heightDimension: .fractionalHeight(0.8))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20)
        section.interGroupSpacing = 15

        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: "header",
                                                                 alignment: .top)
        section.boundarySupplementaryItems = [header]

        return UICollectionViewCompositionalLayout(section: section)
    }
}
