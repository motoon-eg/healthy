import XCTest
@testable import Healthy

final class SavedRecipesViewControllerTests: XCTestCase {

    // MARK: - Properties

    private var savedRecipeViewModelMock: SavedRecipesViewModelMock!
    private var sut: SavedRecipesViewController!

   // MARK: - Lifecycle

    override func setUpWithError() throws {
        savedRecipeViewModelMock = SavedRecipesViewModelMock()
        sut = SavedRecipesViewController(viewModel: savedRecipeViewModelMock)
        sut.loadViewIfNeeded()
    }

//    func test_didSelectRow_shouldCallViewModelremoveSavedRecipe() {
//        let tableView =  sut.tableView
//        let indexPath0 = IndexPath(item: 0, section: 0)
//        // When
//        sut.tableView(tableView ?? UITableView(), didSelectRowAt: indexPath0)
//
//        // Then
//        XCTAssertEqual(savedRecipeViewModelMock.removeRecipeCount, 1)
//    }

}
