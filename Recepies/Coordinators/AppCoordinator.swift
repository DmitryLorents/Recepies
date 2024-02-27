// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Root application coordinator
final class AppCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private var tabBarViewController: MainTabBarViewController?
    private var builder = Builder()

    // MARK: - Public Methods

    override func start() {
        if "login" == "ogin" {
            toMain()
        } else {
            toAuth()
        }
    }

    // MARK: - Private Methods

    private func toMain() {
        // Set Recepies
        let recipeModuleView = builder.makeRecepiesModule()
        let recipeCoordinator = RecipesCoordinator(rootController: recipeModuleView)
        // TODO: - Uncomment when module is ready
//        recipeModuleView.presenter?.coordinator = recipeCoordinator

        // Set Favorites
        let favoritesModelView = builder.makeFavoritesModule()
        let favoritesCoordinator = FavoritesCoordinator(rootController: favoritesModelView)
        // TODO: - Uncomment when module is ready
//        favoritesModelView.presenter?.coordinator = favoritesCoordinator

        // Set Profile
        let profileModelView = builder.makeProfileModule()
        let profileCoordinator = ProfileCoordinator(rootController: profileModelView)
        profileModelView.profilePresenter?.coordinator = profileCoordinator
        profileCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: profileCoordinator)
            self?.toMain()
        }
        add(coordinator: profileCoordinator)
//        profileCoordinator.start()
        // Set TabBarViewController
        tabBarViewController = MainTabBarViewController()
        tabBarViewController?.setViewControllers(
            [recipeCoordinator.rootController, favoritesCoordinator.rootController, profileCoordinator.rootController],
            animated: false
        )
        setAsRoot(tabBarViewController ?? UIViewController())
    }

    private func toAuth() {
        let authModuleView = builder.makeAuthModule()
        let authCoordinator = AuthCoordinator(rootController: authModuleView)
        authModuleView.presenter?.coordinator = authCoordinator
        authCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: authCoordinator)
            self?.toMain()
        }
        add(coordinator: authCoordinator)
        authCoordinator.start()
    }
}
