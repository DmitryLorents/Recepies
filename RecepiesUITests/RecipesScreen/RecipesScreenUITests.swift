// RecipesScreenUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

final class RecipesScreenUITests: XCTestCase {
    var app: XCUIApplication!
    lazy var authPage = AuthPage(app: app)
    lazy var recipesPage = RecipesPage(app: app)

    let user = "1@2.com"
    let password = "123456"

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSuccessAuthorization() {
        completeAuthorization()
        XCTAssert(recipesPage.view.exists)
    }

    private func completeAuthorization() {
        let recipesView = recipesPage.view
        enterUserData(user: user, password: password)
        authPage.loginButton.tap()

        expectation(for: NSPredicate(format: "exists==1"), evaluatedWith: recipesView, handler: nil)
        waitForExpectations(timeout: 3)
    }

    private func enterUserData(user: String, password: String) {
        authPage.emailTextField.tap()
        authPage.emailTextField.typeText(user)
        authPage.passwordTextField.tap()
        authPage.passwordTextField.typeText(password)
    }
}
