// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Root application coordinator
final class AppCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private var mainTabBarViewController: MainTabBarViewController?
    private var builder = Builder()

    // MARK: - Public Methods

    override func start() {
        if "login" == "login" {
            showMainTabBar()
        } else {
            showAuthScreen()
        }
    }

    // MARK: - Private Methods

    private func showMainTabBar() {
        // Set Recepies
        let recipeCoordinator = RecipesCoordinator()
        let recipeModuleView = builder.makeRecepiesModule(coordinator: recipeCoordinator)
        // TODO: - Uncomment when module is ready
//        recipeModuleView.presenter?.coordinator = recipeCoordinator

        // Set Favorites
        let favoritesCoordinator = FavoritesCoordinator()
        let favoritesModelView = builder.makeFavoritesModule(coordinator: favoritesCoordinator)
        favoritesCoordinator.setRootController(favoritesModelView)

        // Set Profile
        let profileCoordinator = ProfileCoordinator()
        let profileModelView = builder.makeProfileModule(coordinator: profileCoordinator)
        profileCoordinator.setRootController(profileModelView)
        profileCoordinator.finishFlowHandler = { [weak self] in
            self?.remove(coordinator: profileCoordinator)
            self?.showAuthScreen()
        }
        add(coordinator: profileCoordinator)
        // Set TabBarViewController
        mainTabBarViewController = MainTabBarViewController()
        mainTabBarViewController?.setViewControllers(
            [
                recipeCoordinator.publicRootController,
                favoritesCoordinator.publicRootController,
                profileCoordinator.publicRootController
            ],
            animated: false
        )
        setAsRoot(mainTabBarViewController ?? UIViewController())
    }

    private func showAuthScreen() {
        let authCoordinator = AuthCoordinator()
        let authModuleView = builder.makeAuthModule(coordinator: authCoordinator)
        authCoordinator.setRootController(authModuleView)
        authCoordinator.finishFlowHandler = { [weak self] in
            self?.remove(coordinator: authCoordinator)
            self?.showMainTabBar()
        }
        add(coordinator: authCoordinator)
        authCoordinator.start()
    }
}
