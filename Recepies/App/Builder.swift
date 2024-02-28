// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General protocol for all builders in app
protocol BuilderProtocol {
    /// Function to build Authorization module
    func makeAuthModule() -> AuthView
    /// Function to build  Recipies module
    func makeRecepiesModule() -> RecepiesViewController
    /// Function to  build Favorites module
    func makeFavoritesModule() -> FavoritesViewController
    /// Function to  build Profile module
    func makeProfileModule() -> ProfileView
    /// Function to  build Category module
    func makeCategoryModule(coordinator: BaseModuleCoordinator, category: Category) -> CategoryView
}

final class Builder: BuilderProtocol {
    // MARK: - Constants

    private enum Constants {
        static let profileViewTitle = "Profile"
        static let recepiesViewTitle = "Recipes"
        static let favoritesViewTitle = "Favorites"
    }

    // MARK: - Public Methods

    func makeAuthModule() -> AuthView {
        let authService = AuthService()
        let view = AuthView()
        let presenter = AuthPresenter(view: view, authService: authService)
        view.presenter = presenter
        return view
    }

    func makeRecepiesModule() -> RecepiesViewController {
        let view = RecepiesViewController()
        view.tabBarItem = UITabBarItem(title: Constants.recepiesViewTitle, image: .recipes, selectedImage: .recipesSet)
        return view
    }

    func makeFavoritesModule() -> FavoritesViewController {
        let view = FavoritesViewController()
        view.tabBarItem = UITabBarItem(title: Constants.favoritesViewTitle, image: .favorites, selectedImage: .favorSet)
        return view
    }

    func makeProfileModule() -> ProfileView {
        let profilePresenter = ProfilePresenter()
        let profileView = ProfileView()
        profileView.profilePresenter = profilePresenter
        profilePresenter.view = profileView
        profileView.tabBarItem = UITabBarItem(
            title: Constants.profileViewTitle,
            image: .prof,
            selectedImage: .profileSet
        )
        return profileView
    }

    func makeCategoryModule(coordinator: BaseModuleCoordinator, category: Category) -> CategoryView {
        let view = CategoryView()
        let presenter = CategoryPresenter(view: view, /* coordinator: coordinator, */ category: category)
        view.presenter = presenter
        return view
    }
}
