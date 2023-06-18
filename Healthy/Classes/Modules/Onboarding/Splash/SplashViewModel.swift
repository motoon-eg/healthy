import Foundation

// MARK: SplashViewModel

final class SplashViewModel {
    private unowned let coordinator: OnboardingCoordinator

    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
    }
}

// MARK: SplashViewModel

extension SplashViewModel: SplashViewModelInput {
    func startCooking() {
        coordinator.didStartCooking()
    }
}

// MARK: SplashViewModel Output

extension SplashViewModel: SplashViewModelOutput {}

// MARK: Private Handlers

private extension SplashViewModel {}
