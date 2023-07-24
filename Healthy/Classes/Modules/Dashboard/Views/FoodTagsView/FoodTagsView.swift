import UIKit

// MARK: ViewModel

extension FoodTagsView {
    struct ViewModel {
        var foodCategories: [FoodTagCollectionViewCell.ViewModel] = []
        var selected: FoodTagCollectionViewCell.ViewModel?
        var onSelect: (FoodTagCollectionViewCell.ViewModel) -> Void = { _ in }
    }
}

final class FoodTagsView: UIView {

    // MARK: Outlets

    @IBOutlet private(set) weak var tagsCollectionView: UICollectionView!

    // MARK: Properties

    private var viewModel = ViewModel()
    private var selectedIndex: IndexPath?
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

extension FoodTagsView {
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        tagsCollectionView.reloadData()
    }
}

// MARK: Configurations

private extension FoodTagsView {
    private func initView() {
        loadViewFromNib()
        configureTagsCollectionView()
    }

    private func configureTagsCollectionView() {
        tagsCollectionView.collectionViewLayout = .createTagsLayout()
        tagsCollectionView.register(FoodTagCollectionViewCell.self)
        tagsCollectionView.dataSource = self
        tagsCollectionView.delegate = self
    }
}

extension FoodTagsView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.foodCategories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FoodTagCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        // TODO: Make it safe get index
        let element = viewModel.foodCategories[indexPath.row]
        cell.updateView(viewModel: element)
        let isSelected = viewModel.selected == element
        cell.setSelection(isSelected)
        return cell
    }

    // MARK: select Item

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let element = viewModel.foodCategories[indexPath.row]
        viewModel.onSelect(element)
        viewModel.selected = element
        if let selectedIndex {
            collectionView.reloadItems(at: [indexPath, selectedIndex])
        } else {
            collectionView.reloadItems(at: [indexPath])
        }
        selectedIndex = indexPath
    }

    // MARK: Animation

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        performSlideInAnimations(cell, collectionView)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        performSlideOffAnimations(cell, collectionView)
    }

}

// MARK: Animation Methods

private extension FoodTagsView {
    private func performSlideInAnimations(_ cell: UICollectionViewCell, _ collectionView: UICollectionView) {
        cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
        cell.alpha = 0

        UIView.animate(withDuration: 0.5, animations: {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }, completion: nil)
    }

    private func performSlideOffAnimations(_ cell: UICollectionViewCell, _ collectionView: UICollectionView) {
        cell.transform = CGAffineTransform.identity
        cell.alpha = 1

        UIView.animate(withDuration: 0.5, animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
            cell.alpha = 0
        }, completion: nil)
    }
}

// MARK: Layout

private extension UICollectionViewLayout {

    static func createTagsLayout() -> UICollectionViewCompositionalLayout {

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(100),
            heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 15, bottom: 8, trailing: 15)
        section.interGroupSpacing = 15

        return UICollectionViewCompositionalLayout(section: section)
    }
}
