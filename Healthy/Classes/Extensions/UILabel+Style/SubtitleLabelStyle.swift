import UIKit

struct SubtitleLabelStyle: LabelStyling {
    func applyStyle(for label: UILabel) {
        label.textColor = .black20
        label.font = .poppinsbold(18.0)
        label.numberOfLines = .zero
    }
}
