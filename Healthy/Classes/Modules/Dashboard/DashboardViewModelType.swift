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
}
