import Foundation
import Combine
@testable import Healthy

final class SearchDataSourceMock: SearchDataSource {

    // Error Mock
    enum SearchDataSourceMockError: Error {
        case mockedError
    }

    private var error: Error?
    var loadRecipesCallBack: () async throws -> [Recipe] = { [] }

    init(error: Error? = nil) {
        self.error = error
    }

    func loadRecipes() async throws -> [Healthy.Recipe] {
        if error != nil {
            throw SearchDataSourceMockError.mockedError
        }

        return [Recipe(), Recipe()]
    }
}
