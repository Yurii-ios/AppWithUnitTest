//
//  PhotoAppWithUnitTestExampleUITests.swift
//  SignupFlowUITests
//
//  Created by Yurii Sameliuk on 28/04/2023.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    private var app: XCUIApplication!
    private var firstName: XCUIElement!
    private var lastName: XCUIElement!
    private var email: XCUIElement!
    private var password: XCUIElement!
    private var repeatPassword: XCUIElement!
    private var signupButton: XCUIElement!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launchArguments = ["-skipSurvey","-debugServer"]
        //        app.launchEnvironment = ["signupUrl":"http://appsdeveloperblog.com/api/v2/signup-mock-service/users",
        //                                 "inAppPurchasesEnabled":"true",
        //                                 "inAppAdsEnabled":"true"]
        app.launch()
        
        firstName = app.textFields["FirstNameTextField"]
        lastName = app.textFields["LastNameTextField"]
        email = app.textFields["EmailTextField"]
        password = app.secureTextFields["PasswordTextField"]
        repeatPassword = app.secureTextFields["RepeatPasswordTextField"]
        signupButton = app.buttons["SignupButton"]
    
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        /*
        let device = XCUIDevice.shared
        
        device.orientation = .landscapeLeft
        device.press(.home)
    
        let siri = device.siriService
        siri.activate(voiceRecognitionText: "")
        */
         
        /*
         app.doubleTap()
         app.twoFingerTap()
         app.tap(withNumberOfTaps: <#T##Int#>, numberOfTouches: <#T##Int#>)
         app.press(forDuration: <#T##TimeInterval#>, thenDragTo: <#T##XCUIElement#>)
         app.press(forDuration: <#T##TimeInterval#>, thenDragTo: <#T##XCUIElement#>, withVelocity: <#T##XCUIGestureVelocity#>, thenHoldForDuration: <#T##TimeInterval#>)
         app.swipeUp()
         app.pinch(withScale: <#T##CGFloat#>, velocity: <#T##CGFloat#>)
         app.rotate(<#T##rotation: CGFloat##CGFloat#>, withVelocity: <#T##CGFloat#>)
         app.adjust(toNormalizedSliderPosition: <#T##CGFloat#>)
             ....
         */
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName = nil
        email = nil
        password = nil
        repeatPassword = nil
        signupButton = nil
        try super.tearDownWithError()
    }
    
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        
        XCTAssertTrue(firstName.isEnabled, "First name UITextField is not enabled for user interactions")
        XCTAssertTrue(lastName.isEnabled, "Last name UITextField is not enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "Email address UITextField is not enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "Password UITextField is not enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "Repeat password UITextField is not enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "The Signup button is not enabled for user interactions")
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Y")
        
        lastName.tap()
        lastName.typeText("Y")
        
        email.tap()
        email.typeText("@")
        
        password.tap()
        password.typeText("123456")
        
        repeatPassword.tap()
        repeatPassword.typeText("123")
        
        // Act
        signupButton.tap()
        
        let emailTextFieldScreenshot = email.screenshot()
        let emailTextFielAttachment = XCTAttachment(screenshot: emailTextFieldScreenshot)
        emailTextFielAttachment.name = "Screenshot of Email UITextField"
        emailTextFielAttachment.lifetime = .keepAlways
        add(emailTextFielAttachment)
        
        //let currentAppWindow = app.screenshot()
        let currentAppWindow = XCUIScreen.main.screenshot()
        let currentAppWindowAttachement = XCTAttachment(screenshot: currentAppWindow)
        currentAppWindowAttachement.name = "Signup page screenshot"
        currentAppWindowAttachement.lifetime = .keepAlways
        add(currentAppWindowAttachement)
        
        // Assert
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An Error Alert dialog was not presented when invalid signup form was submitted")
    }
    
    func testViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        // Arrange
        firstName.tap()
        firstName.typeText("Yurii")
        
        lastName.tap()
        lastName.typeText("Yurii")
        
        email.tap()
        email.typeText("12@1.com")
        
        password.tap()
        password.typeText("12345678")
        
        repeatPassword.tap()
        repeatPassword.typeText("12345678")
        
        // Act
        signupButton.tap()
        
        // Assert
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "A Success Alert dialog was not presented when valid signup form was submitted")
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
