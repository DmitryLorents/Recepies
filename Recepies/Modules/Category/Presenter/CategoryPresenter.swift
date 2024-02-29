// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Presenter coordinator to perform navigation through app
    var coordinator: BaseModuleCoordinator? { get set }
    /// Main initializer
    init(view: CategoryViewProtocol)
//    /// Validates user email adress and ask view to notify user if email is wrong
//    /// - Parameter email: string value of user's email
//    func validateEmail(_ email: String)
//    /// Validates user email adress and password, ask view to notify user if email or password are wrong
//    /// - Parameter email: string value of user's email
//    /// - Parameter password: string value of user's password
//    func validateUserData(email: String, password: String)
//    /// Tell to view how to set secure entry status for password's textfield
//    func setPasswordeSecureStatus()
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Publiv Properties

    weak var coordinator: BaseModuleCoordinator?

    // MARK: - Private Properties

    private weak var view: CategoryViewProtocol?
    private var isPasswordSecured = true

    // MARK: - Initialization

    init(view: CategoryViewProtocol) {
        self.view = view
    }

    // MARK: - Public Methods
}
