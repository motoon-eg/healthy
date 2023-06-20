import UIKit

final class FoodTagsView: UIView {

    // MARK: Outlets

    @IBOutlet weak var tagsCollectionView: UICollectionView!

    // MARK: Properties

    private var currentSelectedIndexPath: IndexPath = IndexPath(item: 0, section: 0)
    private var foodCategories: [String] = []

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
    func configureCollectionViewCategories(with viewModel: ViewModel) {
        self.foodCategories = viewModel.foodCategories
        tagsCollectionView.reloadData()
    }
}

// MARK: ViewModel

extension FoodTagsView {
    struct ViewModel {
        let foodCategories: [String]
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
        return foodCategories.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: FoodTagCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.updateView(viewModel: .init(foodCategoryName: foodCategories[indexPath.row]))
        let isSelected = currentSelectedIndexPath == indexPath
        cell.setSelection(isSelected)

        return cell
    }

    // MARK: select Item

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedIndex = currentSelectedIndexPath
        currentSelectedIndexPath = indexPath
        collectionView.reloadItems(at: [previousSelectedIndex, indexPath].compactMap { $0 })
    }

    // MARK: Animation

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        willDisplayCellAnimation(cell, collectionView)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        didEndDisplayingCellAnimation(cell, collectionView)
    }
}

// MARK: Animation Methods

private extension FoodTagsView {
    private func willDisplayCellAnimation(_ cell: UICollectionViewCell, _ collectionView: UICollectionView) {
        cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
        cell.alpha = 0

        UIView.animate(withDuration: 0.5, animations: {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }, completion: nil)
    }

    private func didEndDisplayingCellAnimation(_ cell: UICollectionViewCell, _ collectionView: UICollectionView) {
        cell.transform = CGAffineTransform.identity
        cell.alpha = 1

        UIView.animate(withDuration: 0.5, animations: {
            cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
            cell.alpha = 0
        }, completion: nil)
    }
}
