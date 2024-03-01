// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Recipe module
final class RecipesCoordinator: BaseModuleCoordinator {
    let builder = Builder()

    func showCategoryScren(category: Category) {
        let categoryScreen = builder.makeCategoryModule(coordinator: self, category: category)
        publicRootController.pushViewController(categoryScreen, animated: true)
    }

    func goBack() {
        publicRootController.popViewController(animated: true)
    }

    func goToDetailed(recipe: Recipe) {
        let detailedViewController = builder.makeDetailModule(coordinator: self, recipe: recipe)
        publicRootController.pushViewController(detailedViewController, animated: true)
    }
}
