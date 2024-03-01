// RecipesCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Coordinator for Recipe module
final class RecipesCoordinator: BaseModuleCoordinator {
    func showCategoryScren(category: Category) {
        let categoryScreen = Builder().makeCategoryModule(coordinator: self, category: category)
        publicRootController.pushViewController(categoryScreen, animated: true)
    }

    func goBack() {
        publicRootController.popViewController(animated: true)
    }
}
