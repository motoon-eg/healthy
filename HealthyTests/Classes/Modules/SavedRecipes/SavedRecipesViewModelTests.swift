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
                        recipeImageUrl: UIImage.iconNoData,
                        rating: 4,
                        chefName: "sara",
                        cookingTime: 15),
            SavedRecipe(title: "shawrma",
                        recipeImageUrl: UIImage.iconNoData,
                        rating: 5,
                        chefName: "doaa",
                        cookingTime: 20)
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
                                         recipeImageUrl: UIImage.iconNoData,
                                         rating: 4,
                                         chefName: "sara",
                                         cookingTime: 15)
        // When
        viewModel.removeSavedRecipe(recipeToRemove)

        // Then
        XCTAssertFalse(viewModel.savedRecipes.contains(recipeToRemove))
    }

}
