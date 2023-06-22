import Foundation
import Combine

protocol SearchDataSource {
    func loadRecipes() async throws -> [Recipe]
}

 // MARK: SearchViewModel

final class SearchViewModel {
    private var subscriptions = Set<AnyCancellable>()
    @Published private(set) var searchKeyword = ""
    @Published private(set) var searchFilter = SearchFilter()
    @Published private(set) var recipes = [Recipe]()
    @Published private var state = SearchState.initial

    private let searchDataSource: SearchDataSource

    init(searchDataSource: SearchDataSource) {
        self.searchDataSource = searchDataSource
    }
 }

 // MARK: SearchViewModelInput

extension SearchViewModel: SearchViewModelInput {
    func updateSearch(keyword: String, filter: SearchFilter) {
        searchKeyword = keyword
        searchFilter = filter
        Publishers.CombineLatest($searchKeyword, $searchFilter)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global())
            .sink { [weak self] searchKeyword, searchFilter in
                self?.update(
                    searchKeyword: searchKeyword,
                    searchFilter: searchFilter
                )
            }
            .store(in: &subscriptions)
    }
}

 // MARK: SearchViewModelOutput

extension SearchViewModel: SearchViewModelOutput {
    var recipesPublisher: AnyPublisher<[Recipe], Never> {
        $recipes.eraseToAnyPublisher()
    }

    var errorPublisher: AnyPublisher<Error, Never> {
        $state
            .compactMap {
                guard case let .failure(error) = $0 else { return nil }
                return error
            }
            .eraseToAnyPublisher()
    }

    var isEmptyPublisher: AnyPublisher<Bool, Never> {
        $recipes
            .map { $0.isEmpty }
            .eraseToAnyPublisher()
    }

    var isLoadingPublisher: AnyPublisher<Bool, Never> {
        $state
            .map {
                guard case .loading = $0 else { return false }
                return true
            }
            .eraseToAnyPublisher()
    }

    var isLoadingMore: AnyPublisher<Bool, Never> {
        $state
            .map {
                guard case .loadingMore = $0 else { return false }
                return true
            }
            .eraseToAnyPublisher()
    }

    var isLoaded: AnyPublisher<Bool, Never> {
        $state
            .map {
                guard case .loaded = $0 else { return false}
                return true
            }
            .eraseToAnyPublisher()
    }
}

 // MARK: Private Helpers

private extension SearchViewModel {
    func update(searchKeyword: String, searchFilter: SearchFilter) {
        Task {
            do {
                state = .loading
                recipes = try await searchDataSource.loadRecipes()
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
    }
}
