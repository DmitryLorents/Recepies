// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Recipe module
final class RecipesCoordinator: BaseModuleCoordinator {
    // MARK: - Private Properties

    private let builder: BuilderProtocol?

    // MARK: - Initialization

    init(builder: BuilderProtocol?) {
        self.builder = builder
    }

    // MARK: - Public methods

    func showCategoryScren(category: Category) {
        let recipeScreenName = "Recipe"
        if let categoryScreen = builder?.makeCategoryModule(coordinator: self, category: category) {
            publicRootController.pushViewController(categoryScreen, animated: true)
            log(.move(fromCategory: category.name, toScreen: recipeScreenName))
        }
    }

    func goBack() {
        publicRootController.popViewController(animated: true)
    }

    func goToDetailed(recipe: Recipe) {
        guard let detailedViewController = builder?.makeDetailModule(coordinator: self, recipe: recipe) else { return }
        publicRootController.pushViewController(detailedViewController, animated: true)
        log(.openRecipe(recipeName: recipe.name))
    }
}
