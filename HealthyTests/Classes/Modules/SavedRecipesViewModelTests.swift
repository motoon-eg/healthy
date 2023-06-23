import XCTest
import Combine
@testable import Healthy

final class SavedRecipesViewModelTests: XCTestCase {

    var viewModel: SavedRecipesViewModel!
    private(set) var cancellables = Set<AnyCancellable>()
    var recipe1: SavedRecipe!
    var recipe2: SavedRecipe!
    var recipe3: SavedRecipe!

    override func setUp() {
        super.setUp()
        viewModel = SavedRecipesViewModel()
        recipe1 = SavedRecipe(title: "Recipe1",
                              recipeImageUrl: "https://example.com/recipe1.jpg",
                              rating: 4,
                              userName: "esraa",
                              cookingTime: 15)
        recipe2 = SavedRecipe(title: "Recipe 2",
                              recipeImageUrl: "https://example.com/recipe2.jpg",
                              rating: 5,
                              userName: "sara",
                              cookingTime: 20)
        recipe3 = SavedRecipe(title: "Recipe 3",
                              recipeImageUrl: "https://example.com/recipe3.jpg",
                              rating: 5,
                              userName: "saraa",
                              cookingTime: 25)
    }

    override func tearDown() {
        viewModel = nil
        recipe1 = nil
        recipe2 = nil
        recipe3 = nil
        super.tearDown()
    }
    func testRemoveSavedRecipe() {
        // Given
        viewModel.savedRecipes = [recipe1, recipe2, recipe3]
        let expectation = self.expectation(description: "Recipe removed")
        var receivedRecipes: [SavedRecipe] = []
        var receivedIsEmpty: Bool?

        // When
        viewModel.removeSavedRecipe(recipe2)

        // Then
        viewModel.recipesPublisher.sink { recipes in
            receivedRecipes = recipes
            expectation.fulfill()
        }.store(in: &cancellables)

        viewModel.isEmptyPublisher.sink { isEmpty in
            receivedIsEmpty = isEmpty
        }.store(in: &cancellables)

        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(receivedRecipes, [recipe1, recipe3])
       // XCTAssertFalse(receivedIsEmpty!)
    }

//    func testRemoveSavedRecipe() {
//        // Given
//
//        savedRecipes = [recipe1, recipe2, recipe3]
//        let expectation = self.expectation(description: "Recipe removed")
//        var receivedRecipes: [SavedRecipe] = []
//        var receivedIsEmpty: Bool?
//
//        // When
//        viewModel.removeSavedRecipe(recipe2)
//
//        // Then
//        viewModel.recipesPublisher.sink { recipes in
//            receivedRecipes = recipes
//            expectation.fulfill()
//        }.store(in: &cancellables)
//
//        viewModel.isEmptyPublisher.sink { isEmpty in
//            receivedIsEmpty = isEmpty
//        }.store(in: &cancellables)
//
//        waitForExpectations(timeout: 1, handler: nil)
//        XCTAssertEqual(receivedRecipes, [recipe1, recipe3])
//       // XCTAssertFalse((receivedIsEmpty != nil))
//    }

//    func testIsEmptyPublisher() {
//        // Given
//        savedRecipes = []
//        let expectation = self.expectation(description: "isEmptyPublisher emits value")
//        var receivedValue: Bool?
//
//        // When
//        viewModel.isEmptyPublisher.sink { value in
//            receivedValue = value
//            expectation.fulfill()
//        }.store(in: &cancellables)
//
//        // Then
//        waitForExpectations(timeout: 1, handler: nil)
//       // XCTAssertTrue(receivedValue)
//    }

}
