// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthPresenterProtocol: AnyObject {
    var coordinator: BaseModuleCoordinator? { get set }
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)

    func validateEmail(_ email: String)
    func validateUserData(email: String, password: String)
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
