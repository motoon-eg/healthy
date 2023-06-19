import UIKit

final class FoodTagsView: UIView {

    // MARK: Outlets

    @IBOutlet weak var tagsCollectionView: UICollectionView!

    // MARK: proberty
    private var currentSelectedIndexPath: IndexPath = IndexPath(item: 0, section: 0)
    private var foodCategories: [String] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    private func initView() {
        loadViewFromNib()
        configureTagsCollectionView()
    }

    private func configureTagsCollectionView() {
        tagsCollectionView.collectionViewLayout = .createTagsLayout()
        tagsCollectionView.registerNibCell(cellClass: TagCollectionViewCell.self)
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

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TagCollectionViewCell.reuseIdentifier,
            for: indexPath) as? TagCollectionViewCell else {
            fatalError("Unable to dequeue cell") }
        cell.setFoodCategoryName(foodCategories[indexPath.row])
        let isSelected = currentSelectedIndexPath == indexPath
        cell.setSelection(isSelected)

        return cell
    }

    // MARK: select Item

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let oldIndex = currentSelectedIndexPath
        currentSelectedIndexPath = indexPath
        collectionView.reloadItems(at: [oldIndex, self.currentSelectedIndexPath].compactMap { $0 })
    }

    // MARK: Animation

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
        cell.alpha = 0
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform.identity
            cell.alpha = 1
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {

        cell.transform = CGAffineTransform.identity
        cell.alpha = 1
        UIView.animate(withDuration: 0.5) {
            cell.transform = CGAffineTransform(translationX: 0, y: collectionView.bounds.height / 2)
            cell.alpha = 0
        }
    }
}
