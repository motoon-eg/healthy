import XCTest
@testable import Healthy
final class SplashViewControllerTest: XCTestCase {

    // MARK: Properties

    private var viewController: SplashViewController!
    private var viewModelMock: SplashViewModelSpy!

    // MARK: Lifecycle

    override func setUpWithError() throws {
        viewModelMock = SplashViewModelSpy()
        viewController = SplashViewController(viewModel: viewModelMock)
    }

    // MARK: Tests

    func test_didTapStartCooking_shouldCallViewModelSplash() {
        // When
        viewController.didTapStartCooking(UIButton())

        // Then
        XCTAssertEqual(viewModelMock.performStartCookingCallCount, 1)
    }
}
// MARK: SplashViewModelSpy
private final class SplashViewModelSpy: SplashViewModelType {
    private(set)var performStartCookingCallCount: Int = .zero
    func performStartCooking() {
        performStartCookingCallCount += 1
    }
}
