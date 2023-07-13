import XCTest
@testable import Networking

final class FilterByMainIngredientAPI: XCTestCase {
    // MARK: Properties
    private var sample: FilterByMainIngredientAPIRequest!

    // MARK: Life cycle
    override func setUp() {
        sample = FilterByMainIngredientAPIRequest()
    }

    // MARK: Tests
    func testFilterByIngredientRequestProperties() {
        // Then
        XCTAssertEqual(sample.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sample.path, "filter.php")
        XCTAssertEqual(sample.method, "GET")
        XCTAssertEqual(sample.queryParameters,
                       ["i": "chicken_breast"])
    }

    func testFilterByIngredientRequestResponseDecoder() throws {
        // Given
        let filterByIngredientResponseAsString = #"""
            {
                "meals": [
                    {
                        "strMeal": "Chick-Fil-A Sandwich",
                        "strMealThumb": "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg",
                        "idMeal": "53016"
                    }
            """#

        // When
        let filterByIngredientResponseData = try XCTUnwrap(filterByIngredientResponseAsString.data(using: .utf8))
        let filterByIngredientResponse = try? sample.responseDecoder(filterByIngredientResponseData)

        // Then
        XCTAssertNotNil(filterByIngredientResponse)
        XCTAssertEqual(filterByIngredientResponse?.meals.count, 1)
        XCTAssertEqual(filterByIngredientResponse?.meals[0].idMeal, "53016")
        XCTAssertEqual(filterByIngredientResponse?.meals[0].strMeal, "Chick-Fil-A Sandwich")
        XCTAssertEqual(filterByIngredientResponse?
            .meals[0].strMealThumb, "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg")
    }
}
