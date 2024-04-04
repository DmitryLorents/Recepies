// AuthScreenUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

final class AuthScreenUITests: XCTestCase {
    var app: XCUIApplication!
    let user = "1@2.com"
    let password = "123456"
    lazy var emailTextField = app.textFields["Enter Email Address"]
    lazy var passwordTextField = app.secureTextFields["Enter Password"]
    lazy var loginButton = app.buttons["Login"].staticTexts["Login"]
    lazy var enterPasswordSecureTextField = app.secureTextFields["Enter Password"]
    lazy var recipesScreenScrollBar = app.collectionViews.containing(.other, identifier:"Horizontal scroll bar, 1 page").element

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testLoginButtonIsActive() {
        enterUserData()
        XCTAssert(loginButton.isEnabled)
    }
    

    func testSuccessAuthorization() throws {
        // given
        // when
        enterUserData()
        loginButton.tap()
        
        // then
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: recipesScreenScrollBar, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssertTrue(recipesScreenScrollBar.exists)
    }
    
    private func enterUserData() {
        emailTextField.tap()
        emailTextField.typeText(user)
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
