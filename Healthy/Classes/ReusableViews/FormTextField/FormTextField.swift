
import UIKit

class FormTextField: UIView {
    
    // MARK: - Outlets
    //
    
    @IBOutlet weak private(set) var contentView: UIView!
    @IBOutlet weak private(set) var titleLabel: UILabel!
    @IBOutlet weak private(set) var inputTextField: UITextField!
    @IBOutlet weak private(set) var errorLabel: UILabel!
    
    
    // MARK: - init
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView() {
        Bundle.main.loadNibNamed(FormTextFieldResources.nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
