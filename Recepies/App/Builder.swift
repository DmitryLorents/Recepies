// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General protocol for all builders in app
protocol BuilderProtocol {
    /// Function to Authorization module
    func makeAuthModule() -> AuthView
    /// Function to  Recipies module
    func makeRecepiesModule() -> UIViewController
    /// Function to Favorites module
    func makeFavoritesModule() -> UIViewController
    /// Function to Profile module
    func makeProfileModule() -> ProfileView
}

final class Builder: BuilderProtocol {
    // MARK: - Public Methods

    func makeAuthModule() -> AuthView {
        let authService = AuthService()
        let view = AuthView()
        let presenter = AuthPresenter(view: view, authService: authService)
        view.presenter = presenter
        return view
    }

    func makeRecepiesModule() -> UIViewController {
        .init()
    }

    func makeFavoritesModule() -> UIViewController {
        .init()
    }

    func makeProfileModule() -> ProfileView {
        let profilePresenter = ProfilePresenter()
        let profileView = ProfileView()
        profileView.profilePresenter = profilePresenter
        profilePresenter.view = profileView
        return profileView
    }
}
