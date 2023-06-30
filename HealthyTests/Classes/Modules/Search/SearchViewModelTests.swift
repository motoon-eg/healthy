import Foundation
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
        dataSourceMock = nil
        XCTAssertNil(weakSUT)
    }

    // MARK: Tests

    func test_updateSearchKeywordAndFilter_fetchNewRecipesAndUpdateState() async {
        // Given
        let recipesSpy = PublisherSpy(sut.recipesPublisher)
        dataSourceMock.loadRecipesCallBack = {
            [.init(), .init()]
        }

        // When
        sut.updateSearchKeyword("")

        try? await Task.sleep(for: .seconds(1))

        // Then
        XCTAssertEqual(recipesSpy.value.count, 2)
    }

    func test_udateSearch_shouldUpdateIsLoadingStatefromFalseToTrueTofalse() async {
        // Given
        let isLoadingStateSpy = PublisherMultibleValueSpy(sut.isLoadingPublisher)

        try? await Task.sleep(for: .seconds(1))

        XCTAssertEqual(isLoadingStateSpy.values, [false, true, false],
                       "The state should execute in the following sequence: initial -> loading -> loaded ")
    }

    func test_udateSearch_shouldUpdateIsLoadedStatefromFalseToFalseToTrue() async {
        // Given
        let isLoadedStateSpy = PublisherMultibleValueSpy(sut.isLoadedPublisher)

        try? await Task.sleep(for: .seconds(1))

        XCTAssertEqual(isLoadedStateSpy.values, [false, false, true],
                       "The state should execute in the following sequence: initial -> loading -> loaded ")
    }

    func test_updateSearchKeyword_shouldUpdateSearchKeyworkAndfilterValues() {
        // Given
        let keyword = "Test keyword"

        // When
        sut.updateSearchKeyword(keyword)

        // Then
        XCTAssertEqual(sut.searchKeyword, keyword)
    }

    func test_updateSearchFilter_shouldUpdateSearchFilterValues() {
        // Given
        let filter = SearchFilter()

        // When
        sut.updateSearchFilter(filter)

        // Then
        XCTAssertEqual(sut.searchFilter, filter)
    }

    func test_isEmptyPublisher_hasTrueAsInitialValue() async {
        // Given
        let stateSpy = PublisherSpy(sut.isEmptyPublisher)

        try? await Task.sleep(for: .seconds(1))

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

    func test_loadRecipes_shouldUpdateStateToFailureCaseWhenThrowError() async {
        // Given
        let searchStateSpy = PublisherSpy(sut.errorPublisher)
        dataSourceMock.loadRecipesCallBack = {
            throw NSError(domain: "", code: -1)
        }

        // When
        sut.updateSearchKeyword("")

        try? await Task.sleep(for: .seconds(1))

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
