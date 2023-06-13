import XCTest
@testable import Healthy

final class SplashViewControllerTest: XCTestCase {
    // MARK: Properties
    private var viewController: SplashViewController!
    private var viewModelMock: SplashViewModelMock!
    // MARK: Lifecycle
    override func setUpWithError() throws {
        viewModelMock = SplashViewModelMock()
        viewController = SplashViewController(viewModel: viewModelMock)
    }
    // MARK: Tests
    func test_didTapStartCooking_shouldCallViewModelSplash() {
        // When
        viewController.didTapStartCooking(UIButton())
        // Then
        XCTAssertEqual(viewModelMock.performStartCookingCallCount, 0)
    }
    }
// Spy
    private final class SplashViewModelMock: SplashViewModelType {
    private(set)var performStartCookingCallCount: Int = .zero

    func performStartCooking() {
        performStartCookingCallCount += 1
    }
}
