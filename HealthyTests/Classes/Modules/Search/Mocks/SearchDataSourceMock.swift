import Foundation
import Combine
@testable import Healthy

final class SearchDataSourceMock: SearchDataSource {
    private(set) var loadRecipeCallCount: Int = .zero
    func loadRecipes() async throws -> [Healthy.Recipe] {
        loadRecipeCallCount += 1
        return []
    }
}
