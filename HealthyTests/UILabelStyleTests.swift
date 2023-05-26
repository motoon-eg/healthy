import UIKit
import XCTest
@testable import Healthy

final class UILabelStyleTests: XCTestCase {

    // MARK: - Test Title style

    func test_uiLabel_defaultSetUILabelTitleStyle() {
        let sut = makeSUT(style: UILabelTitleStyle())

        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, .poppins_semibold(20.0))
        XCTAssertEqual(sut.textAlignment, .center)
        XCTAssertEqual(sut.numberOfLines, 0)
    }

    func test_uiLabel_changeFontWithSetUILabelTitleStyleAndChangeFont() {
        let sut = makeSUT(style: UILabelTitleStyle(font: UIFont.systemFont(ofSize: 18)))

        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, UIFont.systemFont(ofSize: 18))
        XCTAssertEqual(sut.textAlignment, .center)
        XCTAssertEqual(sut.numberOfLines, 0)
    }

    func test_uiLabel_whenChangeAllAttributesUILabelTitleStyle() {
        let style = UILabelTitleStyle(
            font: .boldSystemFont(ofSize: 20),
            textColor: .white,
            numberOfLines: 2,
            alignment: .left)

        let sut = makeSUT(style: style)
        XCTAssertEqual(sut.textColor, .white)
        XCTAssertEqual(sut.font, .boldSystemFont(ofSize: 20))
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 2)
    }

    // MARK: - Test Subtyle style

    func test_uiLabel_defaultSetUILabelSubtitleStyle() {
        let sut = makeSUT(style: UILabelSubtitleStyle())

        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, .poppins_semibold(18.0))
        XCTAssertEqual(sut.textAlignment, .center)
        XCTAssertEqual(sut.numberOfLines, 0)
    }

    func test_uiLabel_changeFontWithSetUILabelSubtitleStyle() {
        let sut = makeSUT(style: UILabelSubtitleStyle(font: .boldSystemFont(ofSize: 20)))

        XCTAssertEqual(sut.textColor, .black)
        XCTAssertEqual(sut.font, .boldSystemFont(ofSize: 20))
        XCTAssertEqual(sut.textAlignment, .center)
        XCTAssertEqual(sut.numberOfLines, 0)
    }

    func test_uiLabel_whenChangeAllAttributesUILabelSubtitleStyle() {
        let style = UILabelSubtitleStyle(
            font: .boldSystemFont(ofSize: 18),
            textColor: .blue,
            numberOfLines: 2,
            alignment: .left)

        let sut = makeSUT(style: style)
        XCTAssertEqual(sut.textColor, .blue)
        XCTAssertEqual(sut.font, .boldSystemFont(ofSize: 18))
        XCTAssertEqual(sut.textAlignment, .left)
        XCTAssertEqual(sut.numberOfLines, 2)
    }

    private func makeSUT(style: UILabelStyle) -> UILabel {
        let label = UILabel()
        label.applyStyle(style)
        return label
    }
}
