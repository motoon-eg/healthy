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

}
