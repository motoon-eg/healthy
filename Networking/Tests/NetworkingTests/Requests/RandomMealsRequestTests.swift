import XCTest
@testable import Networking

final class RandomMealsRequestTests: XCTestCase {

    // MARK: Properties

    private var sut: RandomMealsRequest!

    // MARK: - Lifecycle

    override func setUp() {
        sut = RandomMealsRequest()
    }

    // MARK: - Tests

    func testRandomMealsRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "random.php")
        XCTAssertEqual(sut.method, "GET")
    }

    func testRandomMealsResponseDecoder() throws {
        // Given
        let randomMealsResponseAsString = """
            {
            "meals": [
            {
            "idMeal": "52793",
            "strMeal": "Sticky Toffee Pudding Ultimate",
            "strCategory": "Dessert",
            "strArea": "British",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/xrptpq1483909204.jpg",
            "strTags": "Pudding,Desert,Cake,Dairy",
            "strYoutube": "https://www.youtube.com/watch?v=hKq6RbxJHBo",
            }
            ]
            }
            """

        // When
        let randomMealsResponseData = try XCTUnwrap(randomMealsResponseAsString.data(using: .utf8))
        let randomMealsResponse = try? sut.responseDecoder(randomMealsResponseData)

        // Then
        XCTAssertNotNil(randomMealsResponse)
        XCTAssertEqual(randomMealsResponse?.meals.count, 1)
        XCTAssertEqual(randomMealsResponse?.meals[0].id, "52793")
    }

}
