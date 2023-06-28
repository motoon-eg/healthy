import Combine
import XCTest
@testable import Healthy

final class SavedRecipesViewModelTests: XCTestCase {

    // MARK: Properties
    var viewModel: SavedRecipesViewModel!
    var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        viewModel = SavedRecipesViewModel()
    }

    override func tearDownWithError() throws {
        subscriptions.removeAll()
        super.tearDown()
    }

    func testRecipesPublisher() {
        // Given
        let expectedRecipes = [
            SavedRecipe(title: "pizza",
                        recipeImage: UIImage.iconNoData,
                        rating: 4.5,
                        chefName: "sara",
                        cookingTime: 15, toggleBookmark: {}),
            SavedRecipe(title: "shawrma",
                        recipeImage: UIImage.iconNoData,
                        rating: 5.0,
                        chefName: "doaa",
                        cookingTime: 20, toggleBookmark: {})
        ]
        // When
        let recipesExpectation = expectation(description: "recipes")
        var receivedRecipes: [SavedRecipe] = []

        viewModel.recipesPublisher
            .sink(receiveValue: { recipes in
                receivedRecipes = recipes
                recipesExpectation.fulfill()
            })
            .store(in: &subscriptions)

        waitForExpectations(timeout: 1)
        // Then
        XCTAssertEqual(receivedRecipes, expectedRecipes)
    }

    func testRemoveSavedRecipe() {
        // Given
        let recipeToRemove = SavedRecipe(title: "pizza",
                                         recipeImage: UIImage.iconNoData,
                                         rating: 4.5,
                                         chefName: "sara",
                                         cookingTime: 15, toggleBookmark: {})
        // When
        viewModel.removeSavedRecipe(recipeToRemove)

        // Then
        XCTAssertFalse(viewModel.savedRecipes.contains(recipeToRemove))
        XCTAssertEqual(viewModel.savedRecipes.count, 1)
    }

}
