import XCTest
@testable import Healthy

final class CustomTapBarTest: XCTestCase {

//    // MARK: Properties
//
//    private let sut: MainTabBarController!
//
//    // MARK: - Life cycle
//
//    override func setUp() {
//        let tabBarController = MainTabBarController()
//        tabBarController.loadViewIfNeeded()
//        }
//    }

    
    // MARK: - Test TabBar Controllers count
    
    func test_mainTabBar_contain4Controllers() {
        // Given
        let sut = makeSUT()
        // then
        XCTAssertEqual(sut.viewControllers?.count, 4)
    }

    // MARK: - Test CenterButton Attribures

    func test_centerButton_configurationAttributes() {
        // given
        let sut = makeSUT()
        let plusButton = sut.tabBarAddButton
        // then
        XCTAssertFalse(plusButton.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(plusButton.tintColor, .white)
        XCTAssertEqual(plusButton.layer.cornerRadius, 29)
    }

    // MARK: - Test Center button added

    func test_centerButton_addedInTabBar() {
        // given
        let sut = makeSUT()
        let expectedButton = sut.tabBarAddButton
        let actualButton = sut.tabBar.subviews.last(where: { $0 is UIButton }) as? UIButton
        // then
        XCTAssertNotNil(actualButton)
        XCTAssertEqual(actualButton, expectedButton)
    }
    
    // MARK: - Test TabBar Controllers

    func test_tabBarViewController_configurationViewControllers() {
        // given
        let sut = makeSUT()
        let controller1 = sut.viewControllers?[0]
        let controller2 = sut.viewControllers?[1]
        let controller3 = sut.viewControllers?[2]
        let controller4 = sut.viewControllers?[3]

        // then

        // MARK: - Second View Controller tabBarTests

        XCTAssertNotNil(controller1)
        XCTAssertEqual(controller1?.tabBarItem.title, nil)
        XCTAssertEqual(controller1?.tabBarItem.image, UIImage.iconHome)
        XCTAssertEqual(controller1?.tabBarItem.tag, 0)

        // MARK: - Second View Controller tabBarTests

        XCTAssertNotNil(controller2)
        XCTAssertEqual(controller2?.tabBarItem.title, nil)
        XCTAssertEqual(controller2?.tabBarItem.image, UIImage.iconNotification)
        XCTAssertEqual(controller2?.tabBarItem.tag, 0)

        // MARK: - Third View Controller tabBarTests

        XCTAssertNotNil(controller3)
        XCTAssertEqual(controller3?.tabBarItem.title, nil)
        XCTAssertEqual(controller3?.tabBarItem.image, UIImage.iconProfile)
        XCTAssertEqual(controller3?.tabBarItem.tag, 0)

        // MARK: - Fourth View Controller tabBarTests

        XCTAssertNotNil(controller4)
        XCTAssertEqual(controller4?.tabBarItem.title, nil)
        XCTAssertEqual(controller4?.tabBarItem.image, UIImage.iconUnion)
        XCTAssertEqual(controller4?.tabBarItem.tag, 0)
    }

    // MARK: - Test Custom Tab Bar

    func test_customTabBar_addedInValueWithKey() throws {
        // given
        let sut = makeSUT()
        let tabWithValue = sut.value(forKey: "tabBar") as? MainTabBar
        let customTab = try XCTUnwrap(tabWithValue)
        // then
        XCTAssertNotNil(customTab)
        XCTAssertIdentical(sut.tabBar, customTab)
    }

    // MARK: - Helper Method
    
    private func makeSUT() -> MainTabBarController {
        let tabBarController = MainTabBarController()
        tabBarController.loadViewIfNeeded()
        return tabBarController
    }

}
