import Combine

/// Dashboard Input & Output
///
typealias DashboardViewModelType = DashboardViewModelInput & DashboardViewModelOutput

/// Dashboard ViewModel Input
///
protocol DashboardViewModelInput {}

/// Dashboard ViewModel Output
///
protocol DashboardViewModelOutput {
    typealias NewRecipeViewModel = NewRecipeCollectionViewCell.ViewModel

    var header: HomeHeaderView.ViewModel { get }
    var newRecipesPublisher: any Publisher<[NewRecipeViewModel], Never> { get }
}
