import XCTest
@testable import Healthy

final class RecipeTest: XCTestCase {

    // MARK: - Properties

    var sut: Recipe!

    // MARK: Lifcycle

    override func setUp() {
        super.setUp()
        sut = Recipe(title: "Steak with Tomatoes",
                     recipeImageUrl: "https://example.com/steak-with-tomatoes.jpg",
                     rating: 4,
                     userImageUrl: "https://example.com/user-avatar.jpg",
                     userName: "John Doe",
                     preparationTime: 450)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests

    // MARK: - Initializer Tests

    func test_initializer_withValidTitle_ensureModelHasValidTitle() {
        // Arrange
        let actual = sut.title
        let expectedTitle = "Steak with Tomatoes"
        let testErrorMessage = "Recipe title is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedTitle, testErrorMessage)
    }

    func test_initializer_withValidImageUrl_ensureModelHasValidRecipeImageUrl() {
        // Arrange
        let actual = sut.recipeImageUrl
        let expectedImageUrl = "https://example.com/steak-with-tomatoes.jpg"
        let testErrorMessage = "Recipe image URL is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedImageUrl, testErrorMessage)
    }

    func test_initializer_withValidRating_ensureModelHasValidRating() {
        // Arrange
        let actual = sut.rating
        let expectedRating = 4
        let testErrorMessage = "Recipe star rating is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedRating, testErrorMessage)
    }

    func test_initializer_withValidUserImageUrl_ensureModelHasValidUserImageUrl() {
        // Arrange
        let actual = sut.userImageUrl
        let userImageUrl = "https://example.com/user-avatar.jpg"
        let testErrorMessage = "User image URL is incorrect."

        // Assert
        XCTAssertEqual(actual, userImageUrl, testErrorMessage)
    }

    func test_initializer_withValidUserName_ensureModelHasValidUserName() {
        // Arrange
        let actual = sut.userName
        let userName = "John Doe"
        let testErrorMessage = "User name is incorrect."

        // Assert
        XCTAssertEqual(actual, userName, testErrorMessage)
    }

    func test_initializer_withValidPreparationTime_ensureModelHasValidPreparationTime() {
        // Arrange
        let actual = sut.preparationTime
        let expectedPreparationTime = 450
        let testErrorMessage = "Recipe preparation time is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedPreparationTime, testErrorMessage)
    }

    func test_initializer_withEmptyTitle_ensureModelHasEmptyTitle() {
        // Arrange
        let emptyTitleRecipe = Recipe(title: "",
                                      recipeImageUrl: "https://example.com/test.jpg",
                                      rating: 4,
                                      userImageUrl: "https://example.com/user-avatar.jpg",
                                      userName: "John Doe",
                                      preparationTime: 300)
        let actual = emptyTitleRecipe.title
        let expectedTitle = ""
        let testErrorMessage = "Recipe title with empty value is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedTitle, testErrorMessage)
    }

    // MARK: - Methods Test Cases

    // MARK: - FormattedPreeparationTime Tests
    func test_formattedPreparationTime_withZeroSeconds_ensureCorrectFormattedTime() {
        // Arrange
        let zeroPreparationTimeRecipe = Recipe(title: "Test",
                                               recipeImageUrl: "https://example.com/test.jpg",
                                               rating: 4, userImageUrl: "https://example.com/user-avatar.jpg",
                                               userName: "John Doe",
                                               preparationTime: 0)

        let actual = zeroPreparationTimeRecipe.formattedPreparationTime()
        let expectedFormattedPreparationTime = "00:00"
        let testErrorMessage = "Formatted preparation time with zero seconds is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedFormattedPreparationTime, testErrorMessage)
    }
    func test_formattedPreparationTime_withMinutesOnly_ensureCorrectFormattedTime() {
        // Arrange
        let minutesOnlyPreparationTimeRecipe = Recipe(title: "Test",
                                                      recipeImageUrl: "https://example.com/test.jpg",
                                                      rating: 4,
                                                      userImageUrl: "https://example.com/user-avatar.jpg",
                                                      userName: "John Doe",
                                                      preparationTime: 300)
        let actual = minutesOnlyPreparationTimeRecipe.formattedPreparationTime()
        let expectedFormattedPreparationTime = "05:00"
        let testErrorMessage = "Formatted preparation time with only minutes is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedFormattedPreparationTime, testErrorMessage)
    }

    func test_formattedPreparationTime_withValidPreparationTime_ensureCorrectFormattedTime() {
        // Arrange
        let actual = sut.formattedPreparationTime()
        let expectedFormattedPreparationTime = "07:30"
        let testErrorMessage = "Formatted preparation time is incorrect."

        // Assert
        XCTAssertEqual(actual, expectedFormattedPreparationTime, testErrorMessage)
    }
}
