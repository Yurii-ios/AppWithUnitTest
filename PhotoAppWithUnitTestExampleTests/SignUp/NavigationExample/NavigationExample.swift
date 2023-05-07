//
//  NavigationExample.swift
//  PhotoAppWithUnitTestExampleTests
//
//  Created by Yurii Sameliuk on 06/05/2023.
//

import XCTest
@testable import PhotoAppWithUnitTestExample

final class NavigationExample: XCTestCase {
    var sut: SignupViewController!
    var navigationController: UINavigationController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }
    
    func testNextViewButton_WhenTapped_SecondVCPushed_V1() {
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }
        
        expectation(for: predicate, evaluatedWith: navigationController)
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 2)
        
        //        guard let _ = navigationController.topViewController as? SecondViewController else {
        //            XCTFail()
        //            return
        //        } it is does not work.
    }
    
    func testNextViewButton_WhenTapped_SecondVCPushed_V2() {
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        RunLoop.current.run(until: Date())
        
        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
    
    func testNextViewButton_WhenTapped_SecondVCPushed_V3() {
        let spyNavController = SpyNavigationController(rootViewController: sut)
        
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavController.pushViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
    
    func testCreateAccountButton_WhenTapped_PresentsSecondVC() {
        let app = XCUIApplication()
        app.buttons["NextViewButton"].tap()
        // using accessibilityIdentifier for all UI elements
        XCTAssertTrue(app.otherElements["SecondViewController"].waitForExistence(timeout: 2), "SecondViewController was not presented when NextViewButton was tapped")
    }
}
