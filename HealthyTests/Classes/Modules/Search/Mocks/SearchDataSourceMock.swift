import Foundation
import Combine
@testable import Healthy

final class SearchDataSourceMock: SearchDataSource {
    var error: Error?

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

// Error Mock
enum SearchDataSourceMockError: Error {
    case mockedError
}
