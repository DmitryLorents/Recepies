// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// General protocol for all builders in app
protocol BuilderProtocol {
    /// Function to Authorization module
    func makeAuthModule(coordinator: BaseModuleCoordinator) -> AuthView
    /// Function to  Recipies module
    func makeRecipesModule(coordinator: BaseModuleCoordinator) -> RecipesView
    /// Function to Favorites module
    func makeFavoritesModule(coordinator: BaseModuleCoordinator) -> FavoritesView
    /// Function to Profile module
    func makeProfileModule(coordinator: BaseModuleCoordinator) -> ProfileView
    /// Function to  build Category module
    func makeCategoryModule(coordinator: BaseModuleCoordinator, category: Category) -> CategoryView
    /// Function to  build Detail module
    func makeDetailModule(coordinator: BaseModuleCoordinator, recipe: Recipe) -> DetailView
}

/// Builder for all modules in app
final class Builder: BuilderProtocol {
    // MARK: - Constants

    private enum Constants {
        static let profileViewTitle = "Profile"
        static let recipesViewTitle = "Recipes"
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

    func makeRecipesModule(coordinator: BaseModuleCoordinator) -> RecipesView {
        let view = RecipesView()
        let presenter = RecipesPresenter(view: view, coordinator: coordinator)
        view.presenter = presenter
        view.tabBarItem = UITabBarItem(
            title: Constants.recipesViewTitle,
            image: .recipes,
            selectedImage: .recipesSet
        )
        return view
    }

    func makeFavoritesModule(coordinator: BaseModuleCoordinator) -> FavoritesView {
        let view = FavoritesView()
        let presenter = FavoritesPresenter(view: view, coordinator: coordinator, database: Database.shared)
        view.presenter = presenter
        view.tabBarItem = UITabBarItem(title: Constants.favoritesViewTitle, image: .favorites, selectedImage: .favorSet)
        return view
    }

    func makeProfileModule(coordinator: BaseModuleCoordinator) -> ProfileView {
        let profileView = ProfileView()
        let profilePresenter = ProfilePresenter(view: profileView, coordinator: coordinator)
        profileView.profilePresenter = profilePresenter
        profileView.tabBarItem = UITabBarItem(
            title: Constants.profileViewTitle,
            image: .prof,
            selectedImage: .profileSet
        )
        return profileView
    }

    func makeCategoryModule(coordinator: BaseModuleCoordinator, category: Category) -> CategoryView {
        let view = CategoryView()
        let presenter = CategoryPresenter(view: view, coordinator: coordinator, category: category)
        view.presenter = presenter
        return view
    }

    func makeDetailModule(coordinator: BaseModuleCoordinator, recipe: Recipe) -> DetailView {
        let view = DetailView()
        let presenter = DetailPresenter(view: view, coordinator: coordinator, recipe: recipe, database: Database.shared)
        view.presenter = presenter
        return view
    }
}
