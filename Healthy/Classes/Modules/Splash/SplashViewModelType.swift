import Foundation

/// Splash Input & Output
///
typealias SplashViewModelType = SplashViewModelInput & SplashViewModelOutput

/// Splash ViewModel Input
///
protocol SplashViewModelInput {
    func performStartCooking()
}

/// Splash ViewModel Output
///
protocol SplashViewModelOutput {}
