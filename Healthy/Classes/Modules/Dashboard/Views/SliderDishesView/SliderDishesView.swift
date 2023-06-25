
import UIKit

class SliderDishesView: UIView{

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var dishesSliderCollectionView: UICollectionView!

    // MARK: - Properties

    private var viewModel: [SliderCollectionViewCell.SliderViewModel]?

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        collectionViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        collectionViewSetup()
    }
}

// MARK: - CollectionView setup

extension SliderDishesView {

    func collectionViewSetup() {
        Bundle.main.loadNibNamed("SliderDishesView", owner: self, options: nil)
//        addAndFixSubview(SliderDishesView)

        dishesSliderCollectionView.register(SliderCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        dishesSliderCollectionView.delegate = self
        dishesSliderCollectionView.dataSource = self
        collectionViewLayout()
    }

    func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (dishesSliderCollectionView.bounds.width) - 5, height: dishesSliderCollectionView.bounds.height)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.scrollDirection = .horizontal
        dishesSliderCollectionView.collectionViewLayout = layout
    }
}

// MARK: - CollectionViewDelegate & Datasource

extension SliderDishesView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SliderCollectionViewCell
        guard let model = viewModel else { return UICollectionViewCell() }
        cell.configureCellData(viewModel: model[indexPath.row])
        return cell
    }
}
