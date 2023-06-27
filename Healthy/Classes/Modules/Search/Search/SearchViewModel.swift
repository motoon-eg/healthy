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
    @Published private(set) var recipes: [Recipe] = []
    @Published private var state = SearchState.initial

    private let searchDataSource: SearchDataSource
    var dueDebounseTime: Double = 0.5

    init(searchDataSource: SearchDataSource) {
        self.searchDataSource = searchDataSource

        Publishers.CombineLatest($searchKeyword, $searchFilter)
            .debounce(for: .seconds(dueDebounseTime), scheduler: DispatchQueue.global())
            .sink { [weak self] _, _ in
                self?.update()
            }
            .store(in: &subscriptions)
    }
}

 // MARK: SearchViewModelInput

extension SearchViewModel: SearchViewModelInput {
    func updateSearchKeyword(_ keyword: String) {
        searchKeyword = keyword
        update()
    }

    func updateSearchFilter(_ filter: SearchFilter) {
        searchFilter = filter
        update()
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

    private var statePublisher: AnyPublisher<SearchState, Never> {
        $state.eraseToAnyPublisher()
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

    var isLoadingMorePublisher: AnyPublisher<Bool, Never> {
        $state
            .map {
                guard case .loadingMore = $0 else { return false }
                return true
            }
            .eraseToAnyPublisher()
    }

    var isLoadedPublisher: AnyPublisher<Bool, Never> {
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
    func update() {
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
    enum SearchState: Equatable {
        case initial, loading, loadingMore, loaded
        case failure(Error)

        static func == (lhs: SearchViewModel.SearchState, rhs: SearchViewModel.SearchState) -> Bool {
            switch (lhs, rhs) {
            case (.initial, .initial): return true
            case (.loading, .loading): return true
            case (.loadingMore, .loadingMore): return true
            case (.loaded, .loaded): return true
            case (.failure, .failure): return true
            default: return false
            }
        }
    }
}
