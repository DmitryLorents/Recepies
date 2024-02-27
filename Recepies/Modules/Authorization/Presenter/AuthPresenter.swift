// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthPresenterProtocol: AnyObject {
    var coordinator: BaseModuleCoordinator? { get set }
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)

    func tryLogin(email: String, password: String)
}

final class AuthPresenter: AuthPresenterProtocol {
    weak var coordinator: BaseModuleCoordinator?

    private weak var view: AuthViewProtocol?
    private var authService: AuthServiceProtocol?

    init(view: AuthViewProtocol, authService: AuthServiceProtocol) {
        self.view = view
        self.authService = authService
    }

    func tryLogin(email: String, password: String) {
        let success = authService?.checkUserData(email: email, password: password) ?? false
        if success {
            // move to
        } else {
            view?.badUserData()
        }
    }
}
