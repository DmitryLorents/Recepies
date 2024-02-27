// AuthPresenter.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthPresenterProtocol: AnyObject {
    init(view: AuthViewProtocol, authService: AuthServiceProtocol)
}

final class AuthPresenter: AuthPresenterProtocol {
    weak var view: AuthViewProtocol?
    var authService: AuthServiceProtocol?

    init(view: AuthViewProtocol, authService: AuthServiceProtocol) {
        self.view = view
        self.authService = authService
    }
}
