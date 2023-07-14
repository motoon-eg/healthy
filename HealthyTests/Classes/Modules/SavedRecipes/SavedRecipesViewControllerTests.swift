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
        XCTAssertNotNil(sut.navigationBar)
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
        
        let tableView = sut.tableView!
        sut.loadViewIfNeeded()
        
        // When
        viewModel.sendRecipes(expectedRecipes)
        
        // Then
        XCTAssertEqual(sut.dataSource.tableView(tableView, numberOfRowsInSection: 0), expectedRecipes.count)
    }
    // swiftlint:enable all
}
