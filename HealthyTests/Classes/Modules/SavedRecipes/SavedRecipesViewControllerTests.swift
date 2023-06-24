import XCTest
@testable import Healthy
import Combine

// swiftlint:disable all

final class SavedRecipesViewControllerTests: XCTestCase {

    // MARK: - Properties
    
    var sut: SavedRecipesViewController!
    var viewModel: SavedRecipesViewModelMock!
    var subscriptions = Set<AnyCancellable>()

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = SavedRecipesViewModelMock()
        sut = SavedRecipesViewController(viewModel: viewModel )
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        sut = nil
        subscriptions.removeAll()
    }

    // MARK: - Tests

    func testOutletsConnected() {
        XCTAssertNotNil(sut.tableView)
    }

    func testRegisterTableViewCell() {
        // Given
        let expectedCellClass = MyTableViewCell.self

        // When
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell")

        // Then
        XCTAssertTrue(cell is MyTableViewCell)
        XCTAssertEqual(cell?.reuseIdentifier, "MyTableViewCell")
    }

    func testTableDataIsUpdatedWhenRecipesPublisherEmitsNewValues() {
        // Given
        let expectedRecipes = [
            SavedRecipe(title: "Pizza",
                        recipeImageUrl: UIImage(),
                        rating: 4,
                        chefName: "John Doe",
                        cookingTime: 20),
            SavedRecipe(title: "Burger",
                        recipeImageUrl: UIImage(),
                        rating: 5,
                        chefName: "Jane Doe",
                        cookingTime: 30)
        ]

        let tableView = sut.tableView!
        sut.loadViewIfNeeded()

        // When
        viewModel.sendRecipes(expectedRecipes)

        // Then
        XCTAssertEqual(sut.dataSource.tableView(tableView, numberOfRowsInSection: 0), expectedRecipes.count)
    }
    // swiftlint:enable all
}
