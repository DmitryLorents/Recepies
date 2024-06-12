// AuthScreenUITests.swift
// All rights reserved.

@testable import Recepies
import XCTest

final class AuthScreenUITests: XCTestCase {
    var app: XCUIApplication!
    lazy var authPage = AuthPage(app: app)

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

    func testLoginLabelIsExisted() {
        XCTAssert(authPage.loginLabel.exists)
    }

    func testAuthViewIsExisted() {
        XCTAssert(authPage.authView.exists)
    }

    func testLoginButtonIsActive() {
        print("\n ----", app.debugDescription, "\n-------")
        enterCorrectUserData()
        XCTAssert(authPage.loginButton.isEnabled)
    }

    func testSuccessAuthorization() throws {
        // given
        let recipesPage = RecipesPage(app: app)
        let recipesView = recipesPage.view
        // when
        enterCorrectUserData()
        authPage.loginButton.tap()

        // then
        expectation(for: NSPredicate(format: "exists==1"), evaluatedWith: recipesView, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssertTrue(recipesView.exists)
    }

    func testIncorrectEmailFormat() {
        // when
        enterUserData(user: "13.com", password: "654321")
        // then
        XCTAssert(authPage.emailTextFieldWarning.exists)
    }

    func testIncorrectPasswordFormat() {
        // when
        enterUserData(user: "1@2.com", password: "654")
        // then
        authPage.loginButton.tap()
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: authPage.warningView, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssert(authPage.passwordTextFieldWarning.exists)
        XCTAssert(authPage.warningView.exists)
    }

    func testIncorrectUserData() {
        // when
        enterUserData(user: "1@22.com", password: "6542222")
        // then
        authPage.loginButton.tap()
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: authPage.warningView, handler: nil)
        waitForExpectations(timeout: 3)
        XCTAssert(authPage.warningView.exists)
    }

    func testSecureYeyIsChanginTextType() {
        // given
        let secureImageView = authPage.secureImageView
        XCTAssert(secureImageView.exists)
        XCTAssert(authPage.passwordSecureTextField.exists)
        // when
        secureImageView.tap()
        // then
        XCTAssert(authPage.passwordTextField.exists)
    }

    private func enterCorrectUserData() {
        enterUserData(user: user, password: password)
    }

    private func enterUserData(user: String, password: String) {
        authPage.emailTextField.tap()
        authPage.emailTextField.typeText(user)
        authPage.passwordSecureTextField.tap()
        authPage.passwordSecureTextField.typeText(password)
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
