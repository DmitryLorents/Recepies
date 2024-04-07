// RecipesPage.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import XCTest

struct RecipesPage {
    private let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    var view: XCUIElement {
        let id = "RecipesView"
        let predicate = NSPredicate(format: "identifier == '\(id)'")
        let element = app.descendants(matching: .other).matching(predicate).element
        return element
    }
}
