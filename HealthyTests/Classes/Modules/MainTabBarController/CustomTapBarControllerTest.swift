import XCTest
@testable import Healthy

final class CustomTapBarControllerTest: XCTestCase {

    // MARK: Properties

    var sut: MainTabBarController!

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()
        sut = MainTabBarController()
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Test TabBar Controllers count

    func test_mainTabBar_contain4Controllers() {
        XCTAssertEqual(sut.viewControllers?.count, 4)
    }

    // MARK: - Test CenterButton Attribures

    func test_centerButton_configurationAttributes() {
        // Given
        guard let addButton = sut.tabBar.subviews.first(where: { $0 is UIButton }) as? UIButton else {
            XCTFail("Expected to find the center button in the tab bar")
            return
        }

        // Then
        XCTAssertNotNil(addButton)
        XCTAssertFalse(addButton.translatesAutoresizingMaskIntoConstraints)
        XCTAssertEqual(addButton.tintColor, .white)
        XCTAssertEqual(addButton.layer.cornerRadius, 29)
    }

    // MARK: - Home View Controller tabBarTests

    func test_tabBarViewController_HomeViewController() {
        // Given
        let homeViewController = sut.viewControllers?[0]

        // Then
        XCTAssertNotNil(homeViewController)
        XCTAssertNotNil(homeViewController?.tabBarItem)
        XCTAssertEqual(homeViewController?.tabBarItem.title, nil)
        XCTAssertEqual(homeViewController?.tabBarItem.image, UIImage.iconHome)
        XCTAssertEqual(homeViewController?.tabBarItem.tag, 0)
    }

    // MARK: - Notification View Controller tabBarTests

    func test_tabBarViewController_NotificationViewController() {
        // Given
        let notificationViewController = sut.viewControllers?[1]

        // Then
        XCTAssertNotNil(notificationViewController)
        XCTAssertEqual(notificationViewController?.view.backgroundColor, .yellow)
        XCTAssertNotNil(notificationViewController?.tabBarItem)
        XCTAssertEqual(notificationViewController?.tabBarItem.title, nil)
        XCTAssertEqual(notificationViewController?.tabBarItem.image, UIImage.iconNotification)
        XCTAssertEqual(notificationViewController?.tabBarItem.tag, 0)
    }

    // MARK: - Profile View Controller tabBarTests

    func test_tabBarViewController_ProfileViewController() {
        // Given
        let profileViewController = sut.viewControllers?[2]

        // Then
        XCTAssertNotNil(profileViewController)
        XCTAssertNotNil(profileViewController?.tabBarItem)
        XCTAssertEqual(profileViewController?.tabBarItem.title, nil)
        XCTAssertEqual(profileViewController?.tabBarItem.image, UIImage.iconProfile)
        XCTAssertEqual(profileViewController?.tabBarItem.tag, 0)
    }

    // MARK: - Union View Controller tabBarTests

    func test_tabBarViewController_UnionViewController() {
        // Given
        let unionViewController = sut.viewControllers?[3]

        // Then
        XCTAssertNotNil(unionViewController)
        XCTAssertNotNil(unionViewController?.tabBarItem)
        XCTAssertEqual(unionViewController?.tabBarItem.title, nil)
        XCTAssertEqual(unionViewController?.tabBarItem.image, UIImage.iconUnion)
        XCTAssertEqual(unionViewController?.tabBarItem.tag, 0)
    }

    // MARK: - Test Custom Tab Bar

    func test_customTabBar_addedInValueWithKey() throws {
        // When
        let mainTabBar = try XCTUnwrap(sut.value(forKey: "tabBar") as? MainTabBar)

        // Then
        XCTAssertNotNil(mainTabBar)
        XCTAssertIdentical(sut.tabBar, mainTabBar)
    }
}
