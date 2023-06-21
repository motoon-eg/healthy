import XCTest
@testable import Healthy

final class SavedRecipesTableViewCellTests: XCTestCase {

    // MARK: Properties
    
    private var sut: SavedRecipesTableViewCell!
    private var mockTableView: SavedRecipesTableViewMock!
    
    // MARK: Lifecycle
    
    override func setUp() {
        sut = SavedRecipesTableViewCell()
        mockTableView = SavedRecipesTableViewMock(frame: CGRect(x: 0, y: 0, width: 200, height: 400), style: .plain)
        mockTableView.register(UINib.init(nibName: "SavedRecipesTableViewCell", bundle: nil),
                               forCellReuseIdentifier: "SavedRecipesTableViewCell")
    }
    
    // MARK: Tests
    
    func test_SavedRecipesCellIsFound() {
        let indexPath = IndexPath(row: 0, section: 0)
        let itemCell = createCell(indexPath: indexPath)
        XCTAssertNotNil(itemCell)
    }
    
    func test_ViewOfSavedRecipesCellIsFound() {
        let indexPath = IndexPath(row: 0, section: 0)
        let view = createCell(indexPath: indexPath).contentView
        XCTAssertNotNil(view)
    }
    
    func test_HeightOfSavedRecipesTableViewCell() {
        let indexPath = IndexPath(row: 0, section: 0)
        let heightOfCell = mockTableView.tableView(mockTableView, heightForRowAt: indexPath)
        XCTAssertEqual(heightOfCell, 150)
    }
}


// MARK: Private Handlers

private extension SavedRecipesTableViewCellTests {
    func createCell(indexPath: IndexPath) -> SavedRecipesTableViewCell {
        
        guard let cell = mockTableView.dataSource?.tableView(mockTableView, cellForRowAt: indexPath) as? SavedRecipesTableViewCell else {
            return SavedRecipesTableViewCell()
        }
        
        return cell
    }
}
