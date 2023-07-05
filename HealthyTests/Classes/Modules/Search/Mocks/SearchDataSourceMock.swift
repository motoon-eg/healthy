import Foundation
import Combine
@testable import Healthy

final class SearchDataSourceMock: SearchDataSource {
    var loadRecipesCallBack: () async throws -> [Recipe] = { [] }
    func loadRecipes() async throws -> [Healthy.Recipe] {
        try await loadRecipesCallBack()
    }
}
