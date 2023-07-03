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
    var recipesPublisher: any Publisher<[Recipe], Never> { get }
    var errorPublisher: any Publisher<Error, Never> { get }
    var isEmptyPublisher: any Publisher<Bool, Never> { get }
    var isLoadingPublisher: any Publisher<Bool, Never> { get }
    var isLoadingMorePublisher: any Publisher<Bool, Never> { get }
    var isLoadedPublisher: any Publisher<Bool, Never> { get }
}
