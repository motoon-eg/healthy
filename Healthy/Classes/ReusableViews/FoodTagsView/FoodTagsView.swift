
import UIKit

final class FoodTagsView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    private func initView(){
        loadViewFromNib()
        backgroundColor = .red
    }
    
}
