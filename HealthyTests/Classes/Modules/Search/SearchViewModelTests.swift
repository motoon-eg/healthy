import XCTest
import Combine
@testable import Healthy

final class SearchViewModelTests: XCTestCase {

    // MARK: - Properties

    var dataSourceMock: SearchDataSourceMock!
    var sut: SearchViewModel!
    var subscriptions = Set<AnyCancellable>()

    // MARK: - Lifecycle

    override func setUp() {
        dataSourceMock = SearchDataSourceMock()
        sut = makeSUT(dateSource: dataSourceMock)
    }

    override func tearDown() {
        super.tearDown()
        subscriptions.removeAll()
        sut = nil
        XCTAssertNil(weakSUT)
    }

    // MARK: Tests

    func test_updateSearchKeywordAndFilter_fetchNewRecipesAndUpdateState() async throws {
        // Given
        let recipesSpy = PublisherSpy(sut.recipesPublisher)
        dataSourceMock.loadRecipesCallBack = {
            return [.init(), .init()]
        }

        // When
        sut.dueDebounseTime = 0.0
        sut.updateSearch(keyword: "", filter: SearchFilter())

        try await Task.sleep(for: .seconds(1))

        // Then
        XCTAssertEqual(recipesSpy.value.count, 2)
    }

    func test_updateSearchKeywordAndFilter_shouldUpdateSearchKeyworkAndfilterValues() {
        // Given
        let keyword = "Test keyword"
        let filter = SearchFilter()

        // When
        sut.updateSearch(keyword: keyword, filter: filter)

        // Then
        XCTAssertEqual(sut.searchKeyword, keyword)
        XCTAssertEqual(sut.searchFilter, filter)
    }

    func test_isEmptyPublisher_hasTruAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(sut.isEmptyPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, true)
    }

    func test_isLoadingPublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(sut.isLoadingPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_isLoadingMorePublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(sut.isLoadingMorePublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_isLoadedPublisher_hasFalseAsInitialValue() {
        // Given
        let stateSpy = PublisherSpy(sut.isLoadedPublisher)

        // Then
        XCTAssertEqual(stateSpy.value, false)
    }

    func test_loadRecipes_shouldUpdateStateToFailureCaseWhenThrowError() async throws {
        // Given
        sut = SearchViewModel(searchDataSource: dataSourceMock)
        let searchStateSpy = PublisherSpy(sut.statePublisher)

        // When
        sut.updateSearch(keyword: "", filter: SearchFilter())

        try await Task.sleep(for: .seconds(1))

        // Then
        XCTAssertNotNil(searchStateSpy.value)
    }

    // MARK: Helpers

    weak var weakSUT: SearchViewModel?

    func makeSUT(dateSource: SearchDataSourceMock) -> SearchViewModel {
        let sut = SearchViewModel(searchDataSource: dateSource)
        weakSUT = sut
        return sut
    }
}
