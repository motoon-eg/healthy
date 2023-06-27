import Combine

/// Search Input & Output
///
typealias SearchViewModelType = SearchViewModelInput & SearchViewModelOutput

/// Search ViewModel Input
///
protocol SearchViewModelInput {
    func updateSearchKeyword(_ keyword: String)
    func updateSearchFilter(_ filter: SearchFilter)
}

/// Search ViewModel Output
///
protocol SearchViewModelOutput {
    var recipesPublisher: AnyPublisher<[Recipe], Never> { get }
    var errorPublisher: AnyPublisher<Error, Never> { get }
    var isEmptyPublisher: AnyPublisher<Bool, Never> { get }
    var isLoadingPublisher: AnyPublisher<Bool, Never> { get }
    var isLoadingMorePublisher: AnyPublisher<Bool, Never> { get }
    var isLoadedPublisher: AnyPublisher<Bool, Never> { get }
}
