import UIKit
import XCTest
@testable import Healthy

final class UILabelStyleTests: XCTestCase {

    // MARK: - Test Title style

    func test_applyStyle_onTitleLabelStyle() {
        // Given
        let label = UILabel()

        // When
        label.applyTitleBoldStyle()

        // Then
        XCTAssertEqual(label.textColor, .black100)
        XCTAssertEqual(label.font, .titleBold)
        XCTAssertEqual(label.numberOfLines, 0)
    }

    // MARK: - Test Subtyle style

    func test_applyStyle_onSubtitleLabelStyle() {
        // Given
        let label = UILabel()

        // When
        label.applySubtitleLabelStyle()

        // Then
        XCTAssertEqual(label.textColor, .black20)
        XCTAssertEqual(label.font, UIFont.mediumRegular)
        XCTAssertEqual(label.numberOfLines, 0)
    }

}
