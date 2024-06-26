// AppCoordinator.swift
// All rights reserved.

import UIKit

/// Root application coordinator
final class AppCoordinator: BaseCoodinator {
    // MARK: - Constants

    private enum Constants {
        static let tabBarName = "MainTabBar"
        static let categoriesScreenName = "Categories"
        static let recipesScreenName = "Recipes"
        static let detailedScreenName = "Recipe detailed"
        static let profileScreenName = "Profile"
        static let authScreenName = "Authorization"
    }

    // MARK: - Private Properties

    private var mainTabBarViewController: MainTabBarViewController?
    private let builder: BuilderProtocol

    // MARK: - Initialization

    init(mainTabBarViewController: MainTabBarViewController?, builder: BuilderProtocol) {
        self.mainTabBarViewController = mainTabBarViewController
        self.builder = builder
    }

    // MARK: - Public Methods

    override func start() {
        if "login" == "login" {
            showMainTabBar()
        } else {
            showAuthScreen()
        }
    }

    func openFavorites() {
        showMainTabBar()
        mainTabBarViewController?.selectedIndex = 1
    }

    func openProfile() {
        showMainTabBar()
        mainTabBarViewController?.selectedIndex = 2
    }

    func change(userName: String) {
        openProfile()
        guard let navigationViewController = mainTabBarViewController?.children[2] as? UINavigationController,
              let profileView = navigationViewController.topViewController as? ProfileView,
              let profilePresenter = profileView.profilePresenter else { return }
        profilePresenter.setUserNameTitle(name: userName)
    }

    // MARK: - Private Methods

    private func showMainTabBar() {
        // Set Recipes
        let recipeCoordinator = RecipesCoordinator(builder: builder)
        let recipeModuleView = builder.makeRecipesModule(coordinator: recipeCoordinator)
        recipeCoordinator.setRootController(recipeModuleView)
        add(coordinator: recipeCoordinator)

        // Set Favorites
        let favoritesCoordinator = FavoritesCoordinator()
        let favoritesModelView = builder.makeFavoritesModule(coordinator: favoritesCoordinator)
        favoritesCoordinator.setRootController(favoritesModelView)
        add(coordinator: favoritesCoordinator)

        // Set Profile
        let profileCoordinator = ProfileCoordinator(builder: builder)
        let profileModelView = builder.makeProfileModule(coordinator: profileCoordinator)
        profileCoordinator.setRootController(profileModelView)
        profileCoordinator.finishFlowHandler = { [weak self] in
            self?.remove(coordinator: profileCoordinator)
            self?.showAuthScreen()
        }
        add(coordinator: profileCoordinator)

        // Set TabBarViewController
        mainTabBarViewController?.setViewControllers(
            [
                recipeCoordinator.publicRootController,
                favoritesCoordinator.publicRootController,
                profileCoordinator.publicRootController
            ],
            animated: false
        )
        setAsRoot(mainTabBarViewController ?? UIViewController())
        log(.openScreen(screenName: Constants.categoriesScreenName))
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
        log(.openScreen(screenName: Constants.authScreenName))
    }
}
