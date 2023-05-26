import UIKit

struct UILabelSubtitleStyle: UILabelStyle {
    private let font: UIFont
    private let textColor: UIColor
    private let numberOfLines: Int
    private let alignment: NSTextAlignment

    init(
        font: UIFont = .poppins_semibold(18.0),
        textColor: UIColor = .black,
        numberOfLines: Int = 0,
        alignment: NSTextAlignment = .center
    ) {
        self.font = font
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.alignment = alignment
    }

    func setStype(for label: UILabel) {
        label.textColor = textColor
        label.font = font
        label.textAlignment = alignment
        label.numberOfLines = numberOfLines
    }
}
