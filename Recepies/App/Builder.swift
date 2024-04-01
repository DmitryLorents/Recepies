// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import Swinject

/// General protocol for all builders in app
protocol BuilderProtocol {
    /// Container for all services in app
    var serviceContainer: Container? {get}
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
    
    // MARK: - Public Properties
    var serviceContainer: Container?
    
    // MARK: - Initialization
    
    init(serviceContainer: Container?) {
        self.serviceContainer = serviceContainer
    }

    // MARK: - Public Methods

    func makeAuthModule(coordinator: BaseModuleCoordinator) -> AuthView {
        let authService = serviceContainer?.resolve(AuthServiceProtocol.self)
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
        let database = serviceContainer?.resolve(DataBaseProtocol.self)
        let presenter = FavoritesPresenter(view: view, coordinator: coordinator, database: database)
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
        let networkService = serviceContainer?.resolve(NetworkServiceProtocol.self)
        let cachService = serviceContainer?.resolve(CacheServiceProtocol.self)
        let presenter = CategoryPresenter(
            category: category,
            view: view,
            coordinator: coordinator,
            networkService: networkService,
            cacheService: cachService
        )
        view.presenter = presenter
        return view
    }

    func makeDetailModule(coordinator: BaseModuleCoordinator, recipe: Recipe) -> DetailView {
        let view = DetailView()
        let networkService = serviceContainer?.resolve(NetworkServiceProtocol.self)
        let cacheService = serviceContainer?.resolve(CacheServiceProtocol.self)
        let dataBase = serviceContainer?.resolve(DataBaseProtocol.self)
        let presenter = DetailPresenter(
            view: view,
            coordinator: coordinator,
            recipe: recipe,
            database: dataBase,
            networkService: networkService,
            cacheService: cacheService
        )
        view.presenter = presenter
        return view
    }
}
