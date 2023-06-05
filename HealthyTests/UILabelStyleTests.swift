import UIKit
import XCTest
@testable import Healthy

final class UILabelStyleTests: XCTestCase {

    // MARK: - Test Title style

    func test_applyStyle_onTitleLabelStyle() {
        // Given
        let style = TitleLabelStyle()
        let sut = UILabel()

        // When
        style.applyStyle(for: sut)

        // Then
        XCTAssertEqual(sut.textColor, .black20)
        XCTAssertEqual(sut.font, UIFont.poppinsbold(20.0))
        XCTAssertEqual(sut.numberOfLines, 0)
    }

    // MARK: - Test Subtyle style
    
    func test_applyStyle_onSubtitleLabelStyle() {
        // Given
        let style = SubtitleLabelStyle()
        let sut = UILabel()

        // When
        style.applyStyle(for: sut)

        // Then
        XCTAssertEqual(sut.textColor, .black20)
        XCTAssertEqual(sut.font, UIFont.poppinsbold(18.0))
        XCTAssertEqual(sut.numberOfLines, 0)
    }

}
