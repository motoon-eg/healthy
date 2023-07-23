import XCTest
@testable import Networking

final class MealSearchRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: MealSearchRequest!
    private var searchKey: String!
    // MARK: - Lifecycle

    override func setUp() {
        searchKey = "Arrabiata"
        sut = MealSearchRequest(searchKey)
    }

    // MARK: - Tests

    func testRandomMealsRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "search.php")
        XCTAssertEqual(sut.method, "GET")
        XCTAssertEqual(sut.queryParameters, ["s": searchKey])
    }

    func testRandomMealsResponseDecoder() throws {
        // Given
        let mealSearchResponseAsString = """
            {
            "meals": [
            {
            "idMeal": "52771",
            "strMeal": "Spicy Arrabiata Penne",
            "strDrinkAlternate": null,
            "strCategory": "Vegetarian",
            "strArea": "Italian",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg",
            "strTags": "Pasta,Curry",
            "strYoutube": "https://www.youtube.com/watch?v=1IszT_guI08",
            }
            ]
            }
            """

        // When
        let mealSearchResponseData = try XCTUnwrap(mealSearchResponseAsString.data(using: .utf8))
        let mealSearchResponse = try? sut.responseDecoder(mealSearchResponseData)

        // Then
        XCTAssertNotNil(mealSearchResponse)
        XCTAssertEqual(mealSearchResponse?.meals.count, 1)
        XCTAssertEqual(mealSearchResponse?.meals[0].id, "52771")
    }

}
