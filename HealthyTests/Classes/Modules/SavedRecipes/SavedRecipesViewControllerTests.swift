import XCTest
@testable import Healthy
import Combine

// swiftlint:disable all
final class SavedRecipesViewControllerTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: SavedRecipesViewController!
    var viewModel: SavedRecipesViewModelMock!
    var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Lifecycle
    
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
        let expectedCellClass = SavedRecipesTableViewCell.self
        
        // When
        let cell = sut.tableView.dequeueReusableCell(withIdentifier: SavedRecipesTableViewCell.reuseIdentifier)
        
        // Then
        XCTAssertTrue(cell is SavedRecipesTableViewCell)
        XCTAssertEqual(cell?.reuseIdentifier, "SavedRecipesTableViewCell")
    }
    
    func testRegisterNibFile() {
        // Given
        let tableView = sut.tableView
        let expectedReuseIdentifier = SavedRecipesTableViewCell.reuseIdentifier
        
        // When
        sut.configureTableView()
        
        // Then
        let cell = tableView?.dequeueReusableCell(withIdentifier: expectedReuseIdentifier)
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is SavedRecipesTableViewCell)
    }
    
    func testTableDataIsUpdatedWhenRecipesPublisherEmitsNewValues() {
        // Given
        let expectedRecipes = [
            SavedRecipe(title: "Pizza",
                        recipeImage: UIImage(),
                        rating: 4,
                        chefName: "John Doe",
                        cookingTime: 20, toggleBookmark: {}),
            SavedRecipe(title: "Burger",
                        recipeImage: UIImage(),
                        rating: 5,
                        chefName: "Jane Doe",
                        cookingTime: 30, toggleBookmark: {})
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
