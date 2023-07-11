import XCTest
@testable import Networking

final class CategoriesListRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: CategoriesListRequest!

    // MARK: Life cycle

    override func setUp() {
        sut = CategoriesListRequest()
    }

    // MARK: Tests

    func testCategoriesListRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.aciBaseURL)
        XCTAssertEqual(sut.path, "list.php")
        XCTAssertEqual(sut.method, "GET")
        XCTAssertEqual(sut.queryParameters, ["c": "list"])
    }

    func testAreaListRequestResponseDecoder() throws {
        // Given
        let categoryListResponseAsString = """
        {"meals":[{"strCategory":"Beef"},{"strCategory":"Breakfast"},{"strCategory":"Chicken"}]}
        """

        // When
        let categoryListResponseData = try XCTUnwrap(categoryListResponseAsString.data(using: .utf8))
        let categoryListResponse = try? sut.responseDecoder(categoryListResponseData)

        // Then
        XCTAssertNotNil(categoryListResponse)
        XCTAssertEqual(categoryListResponse?.meals.count, 3)
        XCTAssertEqual(categoryListResponse?.meals[0].category, "Beef")
    }
}
