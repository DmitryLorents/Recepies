// AuthPage.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

struct AuthPage {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var authView: XCUIElement {
        let elementId = "AuthView"
        let predicate = NSPredicate(format: "identifier == '\(elementId)'")
        let element = app.descendants(matching: .other).matching(predicate).element
        return element
    }

    var loginButton: XCUIElement {
        let id = "Login"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .button).matching(predicate).element
        return element
    }

    var loginLabel: XCUIElement {
        let id = "Login"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .staticText).matching(predicate).element
        return element
    }

    var emailTextField: XCUIElement {
        let id = "EmailTextFieldID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .textField).matching(predicate).element
        return element
    }

    var passwordSecureTextField: XCUIElement {
        let id = "PasswordTextFieldID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .secureTextField).matching(predicate).element
        return element
    }

    var passwordTextField: XCUIElement {
        let id = "PasswordTextFieldID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .textField).matching(predicate).element
        return element
    }

    var warningView: XCUIElement {
        let id = "WarningLabelID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .staticText).matching(predicate).element
        return element
    }

    var emailTextFieldWarning: XCUIElement {
        let id = "EmailWarningLabelID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .staticText).matching(predicate).element
        return element
    }

    var passwordTextFieldWarning: XCUIElement {
        let id = "PasswordWarningLabelID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .staticText).matching(predicate).element
        return element
    }

    var secureImageView: XCUIElement {
        let id = "SecureImageViewID"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .image).matching(predicate).element
        return element
    }
}
