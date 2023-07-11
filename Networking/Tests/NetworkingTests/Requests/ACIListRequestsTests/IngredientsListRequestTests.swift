import XCTest
@testable import Networking

final class IngrediantsListRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: IngrediantsListRequest!

    // MARK: Life cycle

    override func setUp() {
        sut = IngrediantsListRequest()
    }

    // MARK: Tests

    func testCategoriesListRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.aciBaseURL)
        XCTAssertEqual(sut.path, "list.php")
        XCTAssertEqual(sut.method, "GET")
        XCTAssertEqual(sut.queryParameters, ["i": "list"])
    }

    func testAreaListRequestResponseDecoder() throws {
        // Given
        let ingrediantsListResponseAsString = """
        {"meals":
        [{"idIngredient":"204",
        "strIngredient":"Macaroni",
        "strDescription":null,
        "strType":null}]
        }
        """

        // When
        let ingrediantsListResponseData = try XCTUnwrap(ingrediantsListResponseAsString.data(using: .utf8))
        let ingrediantsListResponse = try? sut.responseDecoder(ingrediantsListResponseData)

        // Then
        XCTAssertNotNil(ingrediantsListResponse)
        XCTAssertEqual(ingrediantsListResponse?.meals.count, 1)
        XCTAssertEqual(ingrediantsListResponse?.meals[0].id, "204")
        XCTAssertEqual(ingrediantsListResponse?.meals[0].ingrediant, "Macaroni")
        XCTAssertEqual(ingrediantsListResponse?.meals[0].description, nil)
        XCTAssertEqual(ingrediantsListResponse?.meals[0].type, nil)
    }
}
