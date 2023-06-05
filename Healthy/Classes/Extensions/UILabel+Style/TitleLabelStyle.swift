import UIKit

struct TitleLabelStyle: LabelStyling {
    func applyStyle(for label: UILabel) {
        label.textColor = .black20
        label.font = .poppinsbold(20.0)
        label.numberOfLines = .zero
    }
}
