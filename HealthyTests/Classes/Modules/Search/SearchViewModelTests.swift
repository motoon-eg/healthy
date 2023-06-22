import XCTest
 import Combine
 @testable import Healthy

 class SearchViewModelTests: XCTestCase {

    var dataSourceMock: SearchDataSourceMock!
    var viewModel: SearchViewModel!
    var subscriptions = Set<AnyCancellable>()

    override func setUp() {
        dataSourceMock = SearchDataSourceMock()
        viewModel = SearchViewModel(searchDataSource: dataSourceMock)
    }

    override func tearDown() {
        super.tearDown()
        subscriptions.removeAll()
    }

     func test_updateSearchKeyword_fetchNewRecipes() async {
         let task = Task {
             viewModel.addNewSearchKeyword("")
         }

         await task.value
         XCTAssertEqual(dataSourceMock.loadRecipeCallCount, 1)
     }

     func test_updateSearchFilter_fetchNewRecipes() async {
         let task = Task {
             viewModel.addNewSearchFilter(SearchFilter())
         }

         await task.value
         XCTAssertEqual(dataSourceMock.loadRecipeCallCount, 1)
     }

     func testAddNewSearchKeyword() {
             let expectation = XCTestExpectation(description: "AddNewSearchKeyword should update the search keyword")

             viewModel.addNewSearchKeyword("Test")

             viewModel.$searchKeyword
                 .sink { searchKeyword in
                     XCTAssertEqual(searchKeyword, "Test")
                     expectation.fulfill()
                 }
                 .store(in: &subscriptions)

             wait(for: [expectation], timeout: 1.0)
         }

     func testAddNewSearchFilter() {
             let expectation = XCTestExpectation(description: "AddNewSearchFilter should update the search filter")

             let filter = SearchFilter()

             viewModel.addNewSearchFilter(filter)

             viewModel.$searchFilter
                 .sink { searchFilter in
                     XCTAssertEqual(searchFilter, filter)
                     expectation.fulfill()
                 }
                 .store(in: &subscriptions)

             wait(for: [expectation], timeout: 1.0)
         }

    func testIsEmptyPublisher() {
        let expectation = XCTestExpectation(description: "IsEmpty publisher should publish the correct value")

        viewModel.isEmptyPublisher
            .sink { isEmpty in
                XCTAssertTrue(isEmpty)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }

    func testIsLoadingMorePublisher() {
        let expectation = XCTestExpectation(description: "IsLoadingMore publisher should publish the correct value")

        viewModel.isLoadingMore
            .sink { isLoadingMore in
                XCTAssertFalse(isLoadingMore)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }

    func testIsLoadedPublisher() {
        let expectation = XCTestExpectation(description: "IsLoaded publisher should publish the correct value")

        viewModel.isLoaded
            .sink { isLoaded in
                XCTAssertFalse(isLoaded)
                expectation.fulfill()
            }
            .store(in: &subscriptions)

        wait(for: [expectation], timeout: 1.0)
    }
 }
