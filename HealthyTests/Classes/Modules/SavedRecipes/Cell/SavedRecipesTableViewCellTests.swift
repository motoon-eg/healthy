import XCTest
@testable import Healthy

final class SavedRecipesTableViewCellTests: XCTestCase {

    // MARK: Properties
    
    private var sut: SavedRecipesTableViewCell!
    private var mockTableView: UITableViewMock<SavedRecipesTableViewCell>!
    
    // MARK: Lifecycle
    
    override func setUp() {
        sut = SavedRecipesTableViewCell()
        mockTableView = UITableViewMock(frame: CGRect(x: 0, y: 0, width: 200, height: 400), style: .plain)
        mockTableView.registerNib(cell: SavedRecipesTableViewCell.self)
    }
    
    // MARK: Tests
    
    func test_SavedRecipesCellIsFound() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let itemCell = mockTableView.tableView(mockTableView, cellForRowAt: indexPath)
        
        // Then
        XCTAssertNotNil(itemCell)
    }
    
    func test_ViewOfSavedRecipesCellIsFound() {
        // Given
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let view = mockTableView.tableView(mockTableView, cellForRowAt: indexPath)
        
        // Then
        XCTAssertNotNil(view)
    }
}
