import XCTest
@testable import Healthy

final class SplashViewControllerTest: XCTestCase {

    // MARK: Properties

    private var viewController: SplashViewController!
    private var viewModelMock: SplashViewModelMock!

    // MARK: Lifecycle

    override func setUp() {
        super.setUp()
        viewModelMock = SplashViewModelMock()
        viewController = SplashViewController(viewModel: viewModelMock)
        viewController.loadViewIfNeeded()
    }

    // MARK: Tests

    func test_didTapStartCooking_shouldCallViewModelSplash() {
        // When
        viewController.didTapStartCooking(UIButton())

        // Then
        XCTAssertEqual(viewModelMock.performStartCookingCallCount, 1)
    }
}

// MARK: SplashViewModelMock

private final class SplashViewModelMock: SplashViewModelType {
    private(set)var performStartCookingCallCount: Int = .zero
    func startCooking() {
        performStartCookingCallCount += 1
    }
}
