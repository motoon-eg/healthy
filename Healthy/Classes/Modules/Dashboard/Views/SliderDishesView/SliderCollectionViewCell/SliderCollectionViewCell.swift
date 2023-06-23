import UIKit

class SliderCollectionViewCell: UICollectionViewCell, Identifiable{
    
    // MARK: - Propperties
    
    static let SliderIdentifier = "SliderCollectionview"
    
    // MARK: - Outlet
    
    @IBOutlet weak var disheImage: UIImageView!
    @IBOutlet weak var disheName: UILabel!
    @IBOutlet weak var timeDuration: UILabel!
    @IBOutlet weak var disheView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Configurations
    
    func configureCellData(viewModel: SliderViewModel) {
//        disheImage.image = viewModel.imageUrl
    }
}

// MARK: ViewModel

extension SliderCollectionViewCell {
    struct SliderViewModel {
        let imageUrl: UIImage?
        let disheName: String
        let time: String
        let duration: Int
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}

extension UIView {
    func setRadius() {
        self.layer.cornerRadius =  20
    }
}
