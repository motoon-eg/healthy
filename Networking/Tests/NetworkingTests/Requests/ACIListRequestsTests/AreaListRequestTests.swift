import XCTest
@testable import Networking

final class AreaListRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: AreaListRequest!

    // MARK: Life cycle

    override func setUp() {
        sut = AreaListRequest()
    }

    // MARK: Tests

    func testAreasListRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "list.php")
        XCTAssertEqual(sut.method, "GET")
        XCTAssertEqual(sut.queryParameters, ["a": "list"])
    }

    func testAreaListRequestResponseDecoder() throws {
        // Given
        let areaListResponseAsString = """
        {"meals":[{"strArea":"American"},{"strArea":"British"},{"strArea":"Canadian"}]}
        """

        // When
        let areaListResponseData = try XCTUnwrap(areaListResponseAsString.data(using: .utf8))
        let areaListResponse = try? sut.responseDecoder(areaListResponseData)

        // Then
        XCTAssertNotNil(areaListResponse)
        XCTAssertEqual(areaListResponse?.meals.count, 3)
        XCTAssertEqual(areaListResponse?.meals[0].area, "American")
    }
}
