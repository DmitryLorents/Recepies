// CacheService.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

/// Protocol for cashe recipes service
protocol CacheServiceProtocol {
    func fetchRecipes(for category: Category) -> [Recipe]?
    func fetchDetailedRecipe(for recipe: Recipe) -> RecipeDetail?
    func save(recipes: [Recipe], to category: Category)
    func save(recipeDetailed: RecipeDetail, to recipe: Recipe)
    func removeAllRecipes()
}

final class CacheService {
    let coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
}

// MARK: - CacheService - CacheServiceProtocol

extension CacheService: CacheServiceProtocol {
    func save(recipes: [Recipe], to category: Category) {
        // Some code here
    }

    func save(recipeDetailed: RecipeDetail, to recipe: Recipe) {
        // Some code here
    }

    func fetchDetailedRecipe(for recipe: Recipe) -> RecipeDetail? {
        // Some code here
        nil
    }

    func fetchRecipes(for category: Category) -> [Recipe]? {
        // Some code here
        nil
    }

    func removeAllRecipes() {}
}
