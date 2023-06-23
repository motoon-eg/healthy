import XCTest
import Combine
@testable import Healthy

final class SavedRecipesViewModelTests: XCTestCase {
    var viewModel: SavedRecipesViewModel!
    var recipesSubject: PassthroughSubject<[SavedRecipe], Error>!
    var isEmptySubject: PassthroughSubject<Bool, Error>!
    var subscriptions: Set<AnyCancellable>!
    override func setUp() {
        super.setUp()
        viewModel = SavedRecipesViewModel()
        recipesSubject = PassthroughSubject<[SavedRecipe], Error>()
        isEmptySubject = PassthroughSubject<Bool, Error>()
        subscriptions = Set<AnyCancellable>()
        viewModel.recipesSubject = recipesSubject
        viewModel.isEmptySubject = isEmptySubject
    }

    func testRemoveSavedRecipe() async throws {
        // Given
        let savedRecipes = [SavedRecipe(title: "es",
                                        recipeImageUrl: "q.jbg",
                                        rating: 1,
                                        userName: "ess",
                                        cookingTime: 15),
                            SavedRecipe(title: "es",
                                        recipeImageUrl: "q.jbg",
                                        rating: 1, userName: "ess",
                                        cookingTime: 15)]
        viewModel.savedRecipes = savedRecipes

        // When
        let recipeToRemove = savedRecipes[0]
        await viewModel.removeSavedRecipe(recipeToRemove)

        // Then
        XCTAssertEqual(viewModel.savedRecipes.count, 1)
        XCTAssertFalse(viewModel.savedRecipes.contains(recipeToRemove))
    }

    func testRecipesPublisher() async throws {
        // Given
    let savedRecipes = [SavedRecipe(title: "es", recipeImageUrl: "q.jbg", rating: 1, userName: "ess", cookingTime: 15),
                        SavedRecipe(title: "es", recipeImageUrl: "q.jbg", rating: 1, userName: "ess", cookingTime: 15)]
        let recipesPublisher = viewModel.recipesPublisher
        var receivedRecipes: [SavedRecipe]?

        // When
        let expectation = XCTestExpectation(description: "Recipes should be received")
        recipesPublisher.sink { completion in
            switch completion {
            case .failure(let error):
                print(error.localizedDescription)
            case .finished:
                print("Recipes received successfully")
                expectation.fulfill()
            }
        } receiveValue: { recipes in
            print("Received recipes: \(recipes)")
            receivedRecipes = recipes
        }
        .store(in: &subscriptions)
        recipesSubject.send(savedRecipes)
       
        // Then
        XCTAssertEqual(receivedRecipes, savedRecipes)
    }

    func testIsEmptyPublisher() async throws {
        // Given
        let isEmptyPublisher = viewModel.isEmptyPublisher
        var receivedIsEmpty: Bool?

        // When
        let expectation = XCTestExpectation(description: "Is empty status should be received")
        isEmptyPublisher.sink { completion in
            switch completion {
            case .failure(let error):
                XCTFail("Failed to retrieve is empty status: \(error.localizedDescription)")
            case .finished:
                expectation.fulfill()
            }
        } receiveValue: { isEmpty in
            receivedIsEmpty = isEmpty
        }
        .store(in: &subscriptions)
        isEmptySubject.send(true)
        try await expectation

        // Then
        XCTAssertTrue((receivedIsEmpty != nil))
    }
}
