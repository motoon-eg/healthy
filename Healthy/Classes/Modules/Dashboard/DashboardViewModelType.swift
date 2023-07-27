import Foundation

/// Dashboard Input & Output
///
typealias DashboardViewModelType = DashboardViewModelInput & DashboardViewModelOutput

/// Dashboard ViewModel Input
///
protocol DashboardViewModelInput {}

/// Dashboard ViewModel Output
///
protocol DashboardViewModelOutput {
    var header: HomeHeaderView.ViewModel { get }
    var foodTags: FoodTagsView.ViewModel { get }
    var dishes: SliderDishesView.ViewModel { get }
    var newRecipes: NewRecipesView.ViewModel { get }
}
