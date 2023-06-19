import UIKit

final class FoodTagsView: UIView {

    // MARK: Outlets

    @IBOutlet weak var tagsCollectionView: UICollectionView!

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
        backgroundColor = .clear
    }

    private func configureTagsCollectionView() {
        tagsCollectionView.collectionViewLayout = .createTagsLayout()
    }

}
