import XCTest
@testable import Networking

final class MealCategoriesRequestTests: XCTestCase {

    // MARK: Properties
    
    private var sut: MealCategoriesRequest!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        sut = MealCategoriesRequest()
    }
    
    // MARK: - Tests
    
    func testMealCategoriesRequestProperties() {
        // Then
        XCTAssertEqual(sut.baseUrl, Constants.theMealDB)
        XCTAssertEqual(sut.path, "categories.php")
        XCTAssertEqual(sut.method, "GET")
    }
    
    func testMealCategoriesResponseDecoder() throws {
        // Given
        let mealCategoriesResponseAsString = """
            {
                "categories": [
                    {
                        "idCategory": "1",
                        "strCategory": "Beef",
                        "strCategoryThumb": "https://www.themealdb.com/images/category/beef.png",
                        "strCategoryDescription": "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"
                    }
                ]
            }
            """
        
        // When
        let mealCategoriesResponseData = try XCTUnwrap(mealCategoriesResponseAsString.data(using: .utf8))
        let mealCategoriesResponse = try? sut.responseDecoder(mealCategoriesResponseData)
        
        // Then
        XCTAssertNotNil(mealCategoriesResponse)
        XCTAssertEqual(mealCategoriesResponse?.categories.count, 1)
    }
}
