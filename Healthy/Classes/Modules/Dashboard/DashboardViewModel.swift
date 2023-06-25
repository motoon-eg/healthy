import Foundation

// MARK: DashboardViewModel

class DashboardViewModel {}

// MARK: DashboardViewModel

extension DashboardViewModel: DashboardViewModelInput {}

// MARK: DashboardViewModelOutput

extension DashboardViewModel: DashboardViewModelOutput {
    var header: HomeHeaderView.ViewModel {
        .init(title: "", subtitle: "", imageUrl: URL(string: "www.google.com")!)
    }
}

// MARK: Private Handlers

private extension DashboardViewModel {}
