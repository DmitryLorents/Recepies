// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

/// Protocol for Authorization screen presenter
protocol AuthPresenterProtocol: AnyObject {
    /// Presenter coordinator to perform navigation through app
    var coordinator: BaseModuleCoordinator? { get set }
    /// Main initializer
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)
    /// Validates user email adress and ask view to notify user if email is wrong
    /// - Parameter email: string value of user's email
    func validateEmail(_ email: String)
    /// Validates user email adress and password, ask view to notify user if email or password are wrong
    /// - Parameter email: string value of user's email
    /// - Parameter password: string value of user's password
    func validateUserData(email: String, password: String)
    /// Tell to view how to set secure entry status for password's textfield
    func setPasswordeSecureStatus()
}

final class AuthPresenter: AuthPresenterProtocol {
    // MARK: - Publiv Properties

    weak var coordinator: BaseModuleCoordinator?

    // MARK: - Private Properties

    private weak var view: AuthViewProtocol?
    private var authService: AuthServiceProtocol
    private var isPasswordSecured = true

    // MARK: - Initialization

    init(view: AuthViewProtocol, authService: AuthServiceProtocol) {
        self.view = view
        self.authService = authService
    }

    // MARK: - Public Methods

    func validateEmail(_ email: String) {
        let (format, _) = authService.validateEmail(email)
        view?.showIncorrectEmailFormat(!format)
    }

    func validateUserData(email: String, password: String) {
        let (isEmailFormatOk, isEmailValid) = authService.validateEmail(email)
        let (isPasswordFormatOk, isPasswordValid) = authService.validatePassword(password)
        view?.showIncorrectUserData(!isEmailValid || !isPasswordValid)
        view?.showIncorrectPasswordFormat(!isPasswordFormatOk)
        view?.showIncorrectEmailFormat(!isEmailFormatOk)
    }

    func setPasswordeSecureStatus() {
        isPasswordSecured.toggle()
        view?.setPasswordSecured(isSecured: isPasswordSecured)
    }
}
