// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)
}

final class AuthPresenter: AuthPresenterProtocol {
    weak private var view: AuthViewProtocol?
    private var authService: AuthServiceProtocol?
    weak var authCoordinator: AuthCoordinator?

    init(view: AuthViewProtocol, authService: AuthServiceProtocol) {
        self.view = view
        self.authService = authService
    }
}
