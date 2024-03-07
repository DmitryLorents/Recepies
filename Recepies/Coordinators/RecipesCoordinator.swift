// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Recipe module
final class RecipesCoordinator: BaseModuleCoordinator {
    // MARK: - Private Properties

    private let builder = Builder()
    private let loggerInvoker = LoggerInvoker.shared

    // MARK: - Public methods

    func showCategoryScren(category: Category) {
        let recipeScreenName = "Recipe"
        let categoryScreen = builder.makeCategoryModule(coordinator: self, category: category)
        publicRootController.pushViewController(categoryScreen, animated: true)
        loggerInvoker.addLogCommand(.move(fromCategory: category.name, toScreen: recipeScreenName))
    }

    func goBack() {
        publicRootController.popViewController(animated: true)
    }

    func goToDetailed(recipe: Recipe) {
        let detailedViewController = builder.makeDetailModule(coordinator: self, recipe: recipe)
        publicRootController.pushViewController(detailedViewController, animated: true)
        loggerInvoker.addLogCommand(.openRecipe(recipeName: recipe.name))
    }
}
