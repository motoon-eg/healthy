import UIKit

final class SliderDishesView: UIView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var collectionView: UICollectionView!

    // MARK: - Properties
    private var viewModel: [SliderCollectionViewCell.ViewModel] = [
        // TODO: To be removed when real data are integrated
        .init(imageUrl: UIImage.previewDishes1,
              dishName: "Crunchy Nut Coleslaw", time: "",
              duration: "\(13) Mins", rating: 4.3),
        .init(imageUrl: UIImage.previewDishes2, dishName: "Crunchy Nut Coleslaw", time: "6:00",
              duration: "\(15) Mins", rating: 4.3 ),
        .init(imageUrl: nil, dishName: "Test", time: "", duration: "\(13) Mins", rating: 4.3),
        .init(imageUrl: nil, dishName: "Tes", time: "", duration: "\(15) Mins", rating: 4.3)
    ]

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
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

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
        viewModel.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) ->
    UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }
}
