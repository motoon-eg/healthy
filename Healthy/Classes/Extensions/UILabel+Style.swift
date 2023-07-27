import UIKit

extension UILabel {
    func applyTitleBoldStyle() {
        applyStyle(TitleBoldStyle())
    }

    func applyInvertedTitleBoldStyle() {
        applyStyle(TitleBoldStyle(inverted: true))
    }

    func applyHeaderBoldStyle() {
        applyStyle(HeaderBoldStyle())
    }

    func applyBodyStyle() {
        applyStyle(InvertedBodyStyle())
    }

    func applyInvertedBodyStyle() {
        applyStyle(InvertedBodyStyle(inverted: true))
    }

    func applySubtitleLabelStyle() {
        applyStyle(SubtitleLabelStyle())
    }

    func applyInvertedSubtitleLabelStyle() {
        applyStyle(SubtitleLabelStyle(inverted: true))
    }

    func applyCaptionStyle() {
        applyStyle(CaptionLabelStyle())
    }

    func applyInvertedCaptionStyle() {
        applyStyle(CaptionLabelStyle(inverted: true))
    }
}

/// The LabelStyling protocol defines a single method called applyStyle(for label: UILabel) that takes
/// a UILabel as input and applies some styling to it. This protocol can be used to create objects or
/// functions that can apply styling to a UILabel in a standardized way.
///
/// Example:
/// ```
/// class BoldLabelStyling: LabelStyling {
///     func applyStyle(for label: UILabel) {
///         label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
///      }
/// }
/// ```
protocol LabelStyling {
    func applyStyle(for label: UILabel)
}

extension UILabel {
    func applyStyle(_ style: LabelStyling) {
        style.applyStyle(for: self)
    }
}

// MARK: TitleBoldStyle

private struct TitleBoldStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black100
        label.font = .titleBold
        label.numberOfLines = .zero
    }
}

// MARK: HeaderBoldStyle

private struct HeaderBoldStyle: LabelStyling {
    func applyStyle(for label: UILabel) {
        label.textColor = .black100
        label.font = .headerBold
        label.numberOfLines = .zero
    }
}

// MARK: - Fonts
// MARK: InvertedBodyStyle

private struct InvertedBodyStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black80
        label.font = .normalRegular
        label.numberOfLines = .zero
    }
}

// MARK: CaptionLabelStyle

private struct CaptionLabelStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black20
        label.font = .smallerRegular
        label.numberOfLines = .zero
    }
}

// MARK: SubtitleLabelStyle

private struct SubtitleLabelStyle: LabelStyling {
    var inverted: Bool = false

    func applyStyle(for label: UILabel) {
        label.textColor = inverted ? .white : .black20
        label.font = .mediumRegular
        label.numberOfLines = .zero
    }
}
