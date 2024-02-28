// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthPresenterProtocol: AnyObject {
    var coordinator: BaseModuleCoordinator? { get set }
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)

    func validateEmail(_ email: String)
//    func validatePassword(_ password: String)
    func validateUserData(email: String, password: String)
}

final class AuthPresenter: AuthPresenterProtocol {
    // MARK: - Publiv Properties

    weak var coordinator: BaseModuleCoordinator?

    // MARK: - Private Properties

    private weak var view: AuthViewProtocol?
    private var authService: AuthServiceProtocol

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

//    func validatePassword(_ password: String) {
//        let success = authService.validatePassword(password)
//        view?.showIncorrectpasswordWarning(!success)
//    }
    func validateUserData(email: String, password: String) {
        let (isEmailFormatOk, isEmailValid) = authService.validateEmail(email)
        let (isPasswordFormatOk, isPasswordValid) = authService.validatePassword(password)
        view?.showIncorrectUserData(!isEmailValid || !isPasswordValid)
        view?.showIncorrectPasswordFormat(!isPasswordFormatOk)
        view?.showIncorrectEmailFormat(!isEmailFormatOk)
    }
}
