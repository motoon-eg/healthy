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
            SavedRecipesTableViewCell.ViewModel(title: "Traditional spare ribs baked ",
                                                recipeImage: UIImage.iconFood,
                                                rating: 4.5,
                                                chefName: "By Chef John",
                                                cookingTime: 15, toggleBookmark: {}),
            SavedRecipesTableViewCell.ViewModel(title: "spice roasted chicken with flavored rice",
                                                recipeImage: UIImage.iconFood,
                                                rating: 5.0,
                                                chefName: "By Mark Kelvin",
                                                cookingTime: 20, toggleBookmark: {})
        ]
        // When
        let recipesExpectation = expectation(description: "recipes")
        var receivedRecipes: [SavedRecipesTableViewCell.ViewModel] = []

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
        let recipeToRemove = SavedRecipesTableViewCell.ViewModel(title: "Traditional spare ribs baked ",
                                                                 recipeImage: UIImage.iconFood,
                                                                 rating: 4.5,
                                                                 chefName: "By Chef John",
                                                                 cookingTime: 15, toggleBookmark: {})
        // When
        viewModel.removeSavedRecipe(recipeToRemove)

        // Then
        XCTAssertFalse(viewModel.savedRecipes.contains(recipeToRemove))
        XCTAssertEqual(viewModel.savedRecipes.count, 1)
    }

}
