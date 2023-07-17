import XCTest
@testable import Networking

final class FilterByAreaRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: FilterByAreaRequest!

    // MARK: Life cycle

    override func setUp() {
        sut = FilterByAreaRequest("Canadian")
    }

    // MARK: Tests

    func testFilterByAreaRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "filter.php")
        XCTAssertEqual(sut.method, "GET")
        XCTAssertEqual(sut.queryParameters, ["a": "Canadian"])
    }

    func testFilterByAreaRequestResponseDecoder() throws {
        // Given
        let filterByAreaResponseAsString = #"""
        {"meals":
        [{"strMeal":"BeaverTails",
        "strMealThumb":"https:\/\/www.themealdb.com\/images\/media\/meals\/ryppsv1511815505.jpg",
        "idMeal":"52928"}]
        }
        """#

        // When
        let filterByAreaResponseData = try XCTUnwrap(filterByAreaResponseAsString.data(using: .utf8))
        let filterByAreaResponse = try? sut.responseDecoder(filterByAreaResponseData)

        // Then
        XCTAssertNotNil(filterByAreaResponse)
        XCTAssertEqual(filterByAreaResponse?.meals.count, 1)
        XCTAssertEqual(filterByAreaResponse?.meals[0].id, "52928")
        XCTAssertEqual(filterByAreaResponse?.meals[0].meal, "BeaverTails")
        XCTAssertEqual(filterByAreaResponse?.meals[0].mealThumb,
                       "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg")
    }
}
