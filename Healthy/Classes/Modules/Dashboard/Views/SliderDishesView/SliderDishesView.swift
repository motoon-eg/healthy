import UIKit

extension SliderDishesView {
    struct ViewModel {
        var dishes: [SliderCollectionViewCell.ViewModel] = []
        var onSelect: (SliderCollectionViewCell.ViewModel) -> Void = { _ in }
    }
}

final class SliderDishesView: UIView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var viewModel: ViewModel = .init()

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
        configureCollectionView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadViewFromNib()
        configureCollectionView()
    }
}

// MARK: Update UI with ViewModle

extension SliderDishesView {
    func update(with viewModel: ViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}

// MARK: - CollectionView setup

private extension SliderDishesView {

    func configureCollectionView() {
        collectionView.register(SliderCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionViewLayout()
    }

    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        layout.itemSize = CGSize(
            width: collectionView.bounds.width * 0.4,
            height: collectionView.bounds.height
        )
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal

        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .white
    }
}

// MARK: - CollectionViewDelegate & Datasource

extension SliderDishesView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dishes.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel.dishes[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.onSelect(viewModel.dishes[indexPath.row])
    }

}
