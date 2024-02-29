// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General protocol for all builders in app
protocol BuilderProtocol {
    /// Function to Authorization module
    func makeAuthModule(coordinator: BaseModuleCoordinator) -> AuthView
    /// Function to  Recipies module
    func makeRecepiesModule(coordinator: BaseModuleCoordinator) -> RecepiesViewController
    /// Function to Favorites module
    func makeFavoritesModule(coordinator: BaseModuleCoordinator) -> FavoritesViewController
    /// Function to Profile module
    func makeProfileModule(coordinator: BaseModuleCoordinator) -> ProfileView
    /// Function to  build Category module
    func makeCategoryModule(coordinator: BaseModuleCoordinator, category: Category) -> CategoryView
}

/// Builder for all modules in app
final class Builder: BuilderProtocol {
    // MARK: - Constants

    private enum Constants {
        static let profileViewTitle = "Profile"
        static let recepiesViewTitle = "Recipes"
        static let favoritesViewTitle = "Favorites"
    }

    // MARK: - Public Methods

    func makeAuthModule(coordinator: BaseModuleCoordinator) -> AuthView {
        let authService = AuthService()
        let view = AuthView()
        let presenter = AuthPresenter(view: view, authService: authService, coordinator: coordinator)
        view.presenter = presenter
        return view
    }

    func makeRecepiesModule(coordinator: BaseModuleCoordinator) -> RecepiesViewController {
        let view = RecepiesViewController()
        view.tabBarItem = UITabBarItem(title: Constants.recepiesViewTitle, image: .recipes, selectedImage: .recipesSet)
        return view
    }

    func makeFavoritesModule(coordinator: BaseModuleCoordinator) -> FavoritesViewController {
        let view = FavoritesViewController()
        view.tabBarItem = UITabBarItem(title: Constants.favoritesViewTitle, image: .favorites, selectedImage: .favorSet)
        return view
    }

    func makeProfileModule(coordinator: BaseModuleCoordinator) -> ProfileView {
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
