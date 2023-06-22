import Combine

/// Search Input & Output
///
typealias SearchViewModelType = SearchViewModelInput & SearchViewModelOutput

/// Search ViewModel Input
///
protocol SearchViewModelInput {
    func updateSearch(keyword: String, filter: SearchFilter)
}

/// Search ViewModel Output
///
protocol SearchViewModelOutput {
    var recipesPublisher: AnyPublisher<[Recipe], Never> { get }
    var errorPublisher: AnyPublisher<Error, Never> { get }
    var isEmptyPublisher: AnyPublisher<Bool, Never> { get }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var isLoadingMore: AnyPublisher<Bool, Never> { get }
    var isLoaded: AnyPublisher<Bool, Never> { get }
}
