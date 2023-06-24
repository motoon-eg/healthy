import XCTest
import Combine
@testable import Healthy

final class SearchViewModelTests: XCTestCase {

    // MARK: - Properties

    var dataSourceMock: SearchDataSourceMock!
    var viewModel: SearchViewModel!
    var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycle

    override func setUp() {
        dataSourceMock = SearchDataSourceMock()
        viewModel = SearchViewModel(searchDataSource: dataSourceMock)
    }

    override func tearDown() {
        subscriptions.removeAll()
        super.tearDown()
    }

    // MARK: Tests

    func test_updateSearchKeywordAndFilter_fetchNewRecipesAndUpdateState() async throws {
        // Given
        let recipesSpy = PublisherSpy(viewModel.recipesPublisher)
        let searchStateSpy = PublisherMultibleValueSpy(viewModel.statePublisher)

        // When
        viewModel.dueDebounseTime = 0.0
        viewModel.updateSearch(keyword: "", filter: SearchFilter())

        try await Task.sleep(for: .seconds(1))

        // Then
        XCTAssertEqual(recipesSpy.value.count, 2)
        XCTAssertEqual(searchStateSpy.values, [.initial, .loading, .loaded])
    }

    func test_updateSearchKeywordAndFilter_shouldUpdateSearchKeyworkAndfilterValues() {
        // Given
        let keyword = "Test keyword"
        let filter = SearchFilter()

        // When
        viewModel.updateSearch(keyword: keyword, filter: filter)

        // Then
        XCTAssertEqual(viewModel.searchKeyword, keyword)
        XCTAssertEqual(viewModel.searchFilter, filter)
    }

    func test_isEmptyPublisher_hasTruAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(viewModel.isEmptyPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, true)
    }

    func test_isLoadingPublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(viewModel.isLoadingPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_isLoadingMorePublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(viewModel.isLoadingMorePublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_isLoadedPublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(viewModel.isLoadedPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_loadRecipes_shouldUpdateStateToFailureCaseWhenThrowError() async throws {
        // Given
        dataSourceMock = SearchDataSourceMock(error: SearchDataSourceMockError.mockedError)
        viewModel = SearchViewModel(searchDataSource: dataSourceMock)
        let searchStateSpy = PublisherSpy(viewModel.statePublisher)

        // When
        viewModel.updateSearch(keyword: "", filter: SearchFilter())

        try await Task.sleep(for: .seconds(1))

        // Then
        XCTAssertNotNil(searchStateSpy.value)
        XCTAssertEqual(searchStateSpy.value, .failure(SearchDataSourceMockError.mockedError))
    }
}

// MARK: Publisher Values Spy

final class PublisherSpy<T> {
    private(set) var value: T!
    private var cancellable: Cancellable?
    init(_ publisher: AnyPublisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.value = value
        }
    }
}

final class PublisherMultibleValueSpy<T> {
    private(set) var values: [T] = []
    private var cancellable: Cancellable?
    init(_ publisher: AnyPublisher<T, Never>) {
        cancellable = publisher.sink { [weak self] value in
            self?.values.append(value)
        }
    }
}
