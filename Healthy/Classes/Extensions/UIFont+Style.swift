import UIKit

// MARK: - Regular Fonts

extension UIFont {

    static var titleRegular: UIFont {
        poppins(ofSize: 50, weight: .regular)
    }

    static var headerRegular: UIFont {
        poppins(ofSize: 30, weight: .regular)
    }

    static var largeRegular: UIFont {
        poppins(ofSize: 20, weight: .regular)
    }

    static var mediumRegular: UIFont {
        poppins(ofSize: 18, weight: .regular)
    }

    static var normalRegular: UIFont {
        poppins(ofSize: 16, weight: .regular)
    }

    static var smallRegular: UIFont {
        poppins(ofSize: 14, weight: .regular)
    }

    static var smallerRegular: UIFont {
        poppins(ofSize: 11, weight: .regular)
    }
}

// MARK: - Bold Fonts

extension UIFont {

    static var titleBold: UIFont {
        poppins(ofSize: 50, weight: .bold)
    }

    static var headerBold: UIFont {
        poppins(ofSize: 30, weight: .bold)
    }

    static var largeBold: UIFont {
        poppins(ofSize: 20, weight: .bold)
    }

    static var mediumBold: UIFont {
        poppins(ofSize: 18, weight: .bold)
    }

    static var normalBold: UIFont {
        poppins(ofSize: 16, weight: .bold)
    }

    static var smallBold: UIFont {
        poppins(ofSize: 14, weight: .bold)
    }

    static var smallerBold: UIFont {
        poppins(ofSize: 11, weight: .bold)
    }
}

// MARK: Poppins UIFont Helpers

private extension UIFont {

    /// Returns a Poppins UIFont instance with the specified Style.
    static func poppins(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let fontName = poppinsFontName(forWeight: weight)
        guard let font = UIFont(name: fontName, size: size) else {
            assertionFailure("Unable to get a font with name: \(fontName)")
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
        return font
    }

    /// Returns a Poppins UIFont file name for the given weight.
    static func poppinsFontName(forWeight weight: UIFont.Weight) -> String {
        switch weight {
        case .bold:
            return "Poppins-Bold"
        default:
            return "Poppins-Regular"
        }
    }
}
