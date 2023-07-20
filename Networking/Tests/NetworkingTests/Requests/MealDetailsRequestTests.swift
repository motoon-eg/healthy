import XCTest
@testable import Networking

final class MealDetailsRequestTests: XCTestCase {
    var sut: MealDetailsRequest!

    let stub = """
        {
          "meals": [
            {
              "idMeal": "52772",
              "strMeal": "Teriyaki Chicken Casserole",
              "strDrinkAlternate": null,
              "strCategory": "Chicken",
              "strArea": "Japanese",
              "strInstructions": "Preheat oven to 350° F.",
              "strMealThumb": "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg",
              "strTags": "Meat,Casserole",
              "strIngredient1": "soy sauce",
              "strIngredient2": "water",
              "strIngredient3": "brown sugar",
              "strIngredient4": "ground ginger",
              "strIngredient5": "minced garlic",
              "strIngredient6": "cornstarch",
              "strIngredient7": "chicken breasts",
              "strIngredient8": "stir-fry vegetables",
              "strIngredient9": "brown rice",
              "strMeasure1": "3/4 cup",
              "strMeasure2": "1/2 cup",
              "strMeasure3": "1/4 cup",
              "strMeasure4": "1/2 teaspoon",
              "strMeasure5": "1/2 teaspoon",
              "strMeasure6": "4 Tablespoons",
              "strMeasure7": "2",
              "strMeasure8": "1 (12 oz.)",
              "strMeasure9": "3 cups",
            }
          ]
        }
        """

    // MARK: - Lifecycle

    override func setUp() {
        sut = MealDetailsRequest("52772")
    }

    // MARK: - Tests

    func testRandomMealsRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "lookup.php")
        XCTAssertEqual(sut.method, "GET")
    }

    func testMealDetailsResponseDecoder() throws {
        // Given
        let mealDetailsRequest = MealDetailsRequest("52772")

        // When
        let mealDetailsResponseData = try XCTUnwrap(stub.data(using: .utf8))
        let mealDetailsResponse = try? mealDetailsRequest.responseDecoder(mealDetailsResponseData)

        // Then
        let meal = try XCTUnwrap(mealDetailsResponse?.meals[0])
        XCTAssertNotNil(mealDetailsResponse)
        XCTAssertEqual(mealDetailsResponse?.meals.count, 1)
        XCTAssertEqual(meal.id, "52772")
        XCTAssertEqual(meal.name, "Teriyaki Chicken Casserole")
        XCTAssertEqual(meal.category, "Chicken")
        XCTAssertEqual(meal.area, "Japanese")
        XCTAssertEqual(meal.instructions, "Preheat oven to 350° F.")
        XCTAssertEqual(meal.thumbnail, "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
        XCTAssertEqual(meal.ingredients, ["soy sauce", "water", "brown sugar", "ground ginger",
                                          "minced garlic", "cornstarch", "chicken breasts",
                                          "stir-fry vegetables", "brown rice"])
        XCTAssertEqual(meal.measures, ["3/4 cup", "1/2 cup", "1/4 cup", "1/2 teaspoon", "1/2 teaspoon",
                                       "4 Tablespoons", "2", "1 (12 oz.)", "3 cups"])
    }
}
