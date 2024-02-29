// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Main initializer
    init(view: CategoryViewProtocol, /* coordinator: BaseModuleCoordinator, */ category: Category)
    /// Asking presenter to set delegate and dataSource for TableView
    func askForCategory()
    //    /// Validates user email adress and password, ask view to notify user if email or password are wrong
    //    /// - Parameter email: string value of user's email
    //    /// - Parameter password: string value of user's password
    //    func validateUserData(email: String, password: String)
    //    /// Tell to view how to set secure entry status for password's textfield
    //    func setPasswordeSecureStatus()
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?
    private var category: Category?

    // MARK: - Initialization

    init(view: CategoryViewProtocol, /* coordinator: BaseModuleCoordinator, */ category: Category) {
        self.view = view
//        self.coordinator = coordinator
        self.category = category
    }

    // MARK: - Public Methods

    func askForCategory() {
        view?.set(category: category)
    }
}
