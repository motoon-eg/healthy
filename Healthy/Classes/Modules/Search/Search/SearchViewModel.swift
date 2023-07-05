import Foundation
import Combine

protocol SearchDataSource {
    func loadRecipes() async throws -> [Recipe]
}

 // MARK: SearchViewModel

final class SearchViewModel {
    private var subscriptions = Set<AnyCancellable>()
    private var ongoingTask: Task<Void, Never>?
    @Published private(set) var searchKeyword = ""
    @Published private(set) var searchFilter = SearchFilter()
    @Published private(set) var recipes: [Recipe] = []
    @Published private var state = SearchState.initial

    private let searchDataSource: SearchDataSource

    init(searchDataSource: SearchDataSource) {
        self.searchDataSource = searchDataSource

        Publishers.CombineLatest($searchKeyword, $searchFilter)
              .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global())
              .removeDuplicates(by: {$0.0 == $1.0})
              .sink { [weak self] searchKeyword, searchFilter in
                self?.updateSearch(
                  keyword: searchKeyword,
                  filter: searchFilter
                )
              }
              .store(in: &subscriptions)
    }
}

 // MARK: SearchViewModelInput

extension SearchViewModel: SearchViewModelInput {
    func updateSearchKeyword(_ keyword: String) {
        searchKeyword = keyword.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func updateSearchFilter(_ filter: SearchFilter) {
        searchFilter = filter
    }
}

 // MARK: SearchViewModelOutput

extension SearchViewModel: SearchViewModelOutput {
    var recipesPublisher: any Publisher<[Recipe], Never> {
        $recipes.eraseToAnyPublisher()
    }

    var errorPublisher: any Publisher<Error, Never> {
        $state
            .compactMap {
                guard case let .failure(error) = $0 else { return nil }
                return error
            }
    }

    private var statePublisher: any Publisher<SearchState, Never> {
        $state
    }

    var isEmptyPublisher: any Publisher<Bool, Never> {
        Publishers.CombineLatest($recipes, $state)
            .map { recipes, state in
                recipes.isEmpty && state.isLoaded
            }
    }

    var isLoadingPublisher: any Publisher<Bool, Never> {
        $state
            .map {
                guard case .loading = $0 else { return false }
                return true
            }
    }

    var isLoadingMorePublisher: any Publisher<Bool, Never> {
        $state
            .map {
                guard case .loadingMore = $0 else { return false }
                return true
            }
    }

    var isLoadedPublisher: any Publisher<Bool, Never> {
        $state
            .map {
                guard case .loaded = $0 else { return false}
                return true
            }
    }
}

 // MARK: Private Helpers

private extension SearchViewModel {
    func updateSearch(keyword: String, filter: SearchFilter) {
        ongoingTask = Task {
            do {
                state = .loading
                let recipes = try await searchDataSource.loadRecipes()
                guard !Task.isCancelled else { return }
                self.recipes = recipes
                state = .loaded
            } catch {
                state = .failure(error)
            }
        }
    }
}

// MARK: Nested Types

private extension SearchViewModel {
    enum SearchState {
        case initial, loading, loadingMore, loaded
        case failure(Error)

        var isLoaded: Bool {
            if case .loaded = self {
                return true
            }
            return false
        }
    }
}
