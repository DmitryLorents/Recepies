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
    lazy var warningView = app.staticTexts["Please check the accuracy of the entered credentials."]
    lazy var emailTextFieldWarning = app.staticTexts["Incorrect format"]
    lazy var passwordTextFieldWarning = app.staticTexts["You entered the wrong password"]

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testLoginButtonIsActive() {
        print(app.debugDescription)
        enterCorrectUserData()
        XCTAssert(loginButton.isEnabled)
    }
    

    func testSuccessAuthorization() throws {
        // given
        // when
        enterCorrectUserData()
        loginButton.tap()
        
        // then
        expectation(for: NSPredicate(format: "exists==1"), evaluatedWith: recipesScreenScrollBar, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssertTrue(recipesScreenScrollBar.exists)
    }
    
    func testIncorrectEmailFormat() {
        // when
        enterUserData(user: "13.com", password: "654321")
        // then
        XCTAssert(emailTextFieldWarning.exists)
    }
    
    func testIncorrectPasswordFormat() {
        // when
        enterUserData(user: "1@2.com", password: "654")
        // then
        loginButton.tap()
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: warningView, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssert(passwordTextFieldWarning.exists)
        XCTAssert(warningView.exists)
    }
    
    func testIncorrectUserData() {
        // when
        enterUserData(user: "1@22.com", password: "6542222")
        // then
        loginButton.tap()
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: warningView, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssert(warningView.exists)
    }
    
    func testSecureYey() {}
    
    private func enterCorrectUserData() {
        enterUserData(user: user, password: password)
    }
    
    private func enterUserData(user: String, password: String) {
        emailTextField.tap()
        emailTextField.typeText(user)
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }


}
/*
 План испытаний
 1 Ввод некорректного формата почты - должна выскочить надпись Incorrect format
 2 Ввод неправильного пароля короче 5 символов - должна появиться надпись о неправильном пароле и красная вью внизу
 3 Ввести неправильные данные пользователя - должна появиться красная вью внизу
 4 Нажать на глаз - проверить изменение свойства isStcureEnabled
 5 ВВести правильные данные - должен загрузиться следующий экран
 6 Login текст присутствует
 7 Email adress тест присутствует
 8 Password text присутствует
 9 Email text field присутствует
 10 Password text field присутствует
 11 Login button присутствует
 12 Картинка с конвертом пристутсвует
 13 Картинка с замком присутствует
 14 Placeholder для email text field присутствует
 15 Placeholder для password text field присутствует
 16 Кнопка глаз присутствует
 */
