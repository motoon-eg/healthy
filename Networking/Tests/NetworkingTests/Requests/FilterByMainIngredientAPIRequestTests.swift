import XCTest
@testable import Networking

final class FilterByMainIngredientAPI: XCTestCase {

    // MARK: Properties
    private var sample: FilterByMainIngredientAPIRequest!

    // MARK: Life cycle
    override func setUp() {
        sample = FilterByMainIngredientAPIRequest(ingredient: "chicken_breast")
    }

    // MARK: Tests
    func testFilterByIngredientRequestProperties() {
        // Then
        XCTAssertEqual(sample.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sample.path, "filter.php")
        XCTAssertEqual(sample.method, "GET")
        XCTAssertEqual(sample.queryParameters,
                       ["ingredient": "chicken_breast"])
    }

    func testFilterByIngredientRequestResponseDecoder() throws {
        // Given
        let filterByIngredientResponseAsString =
            """
            {
                "meals": [
                    {
                        "strMeal": "Chick-Fil-A Sandwich",
                        "strMealThumb": "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg",
                        "idMeal": "53016"
                    }
                         ]

            }
            """

        // When
        let filterByIngredientResponseData = try XCTUnwrap(filterByIngredientResponseAsString.data(using: .utf8))
        print(filterByIngredientResponseAsString
            .data(using: .utf8))
        let filterByIngredientResponse = try? sample.responseDecoder(filterByIngredientResponseData)

        // Then
        XCTAssertNotNil(filterByIngredientResponse)
        print(filterByIngredientResponse)
        XCTAssertEqual(filterByIngredientResponse?.meals.count, 1)
        XCTAssertEqual(filterByIngredientResponse?.meals[0].meal, "Chick-Fil-A Sandwich")
        XCTAssertEqual(filterByIngredientResponse?
            .meals[0].thumbnailImageUrl, "https://www.themealdb.com/images/media/meals/sbx7n71587673021.jpg")
        XCTAssertEqual(filterByIngredientResponse?
            .meals[0].id, "53016")
    }
}
