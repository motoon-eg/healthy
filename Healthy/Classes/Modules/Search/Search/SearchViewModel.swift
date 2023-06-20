import Combine

// MARK: SearchViewModel

final class SearchViewModel {
    private var subscriptions = Set<AnyCancellable>()

    @Published private var searchKeywords = [String]()
    @Published private var searchFilters = [SearchFilter]()
    @Published private var recipe = [Recipe]()
    @Published private var error: Error = SearchError.unknownError
    @Published private var isEmpty = false
    @Published private var isLoading = false
}

// MARK: SearchViewModel

extension SearchViewModel: SearchViewModelInput {
    func addNewSearchKeyword(_ keyword: String) {
        searchKeywords.append(keyword)
    }

    func addNewSearchFilter(_ filter: SearchFilter) { }
}

// MARK: SearchViewModelOutput

extension SearchViewModel: SearchViewModelOutput {
    var recipesPublisher: AnyPublisher<[Recipe], Never> {
        $recipe.eraseToAnyPublisher()
    }

    var errorPublisher: AnyPublisher<Error, Never> {
        $error.eraseToAnyPublisher()
    }

    var isEmptyPublisher: AnyPublisher<Bool, Never> {
        $isEmpty.eraseToAnyPublisher()
    }

    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $isLoading.eraseToAnyPublisher()
    }
}

// MARK: Private Helpers

private extension SearchViewModel {

    // MARK: Search Error

    enum SearchError: Error {
        case unknownError
    }

    // MARK: Search states

    enum SearchState {
        case initial, loading, loadingMore, empty, loaded
    }

}
