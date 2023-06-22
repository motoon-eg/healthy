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

//    func test_updateSearchKeywordAndFilter_fetchNewRecipes() {
//        viewModel.updateSearch(keyword: "", filter: SearchFilter())
//        XCTAssertEqual(dataSourceMock.loadRecipeCallCount, 1)
//    }

    func testUpdateSearch() {
        // Given
        let keyword = "Test keyword"
        let filter = SearchFilter()

        // When
        viewModel.updateSearch(keyword: keyword, filter: filter)

        // Then
        XCTAssertEqual(viewModel.searchKeyword, keyword)
        XCTAssertEqual(viewModel.searchFilter, filter)
    }

    func testIsEmptyPublisher() {
        // Given
        let expectation = XCTestExpectation(description: "IsEmpty publisher should publish the correct value")

        // Then
        viewModel.isEmptyPublisher
            .sink { isEmpty in
                XCTAssertTrue(isEmpty)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }

    func testIsLoadingMorePublisher() {
        // Given
        let expectation = XCTestExpectation(description: "IsLoadingMore publisher should publish the correct value")

        // Then
        viewModel.isLoadingMore
            .sink { isLoadingMore in
                XCTAssertFalse(isLoadingMore)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }

    func testIsLoadedPublisher() {
        // Given
        let expectation = XCTestExpectation(description: "IsLoaded publisher should publish the correct value")

        // Then
        viewModel.isLoaded
            .sink { isLoaded in
                XCTAssertFalse(isLoaded)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }
}
