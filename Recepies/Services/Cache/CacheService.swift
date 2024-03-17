// CacheService.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation


/// Protocol for cashe recipes service
protocol CacheServiceProtocol {
    /// Get recipes from cache
    /// - Parameter category: category of recipes
    /// - Returns optional array of recipes if available in cache
    func getRecipes(for category: Category) -> [Recipe]?
    /// Get detailed recipe from cache
    ///  - Parameter recipe: recipe model
    ///  - Returns optional detailed recipe if available in cache
    func getDetailedRecipe(for recipe: Recipe) -> RecipeDetail?
    /// Save array of recipes to cache for dsired category of recipes
    /// - Parameters
    /// recipes: array of recipes
    /// category: category of recipes
    func save(recipes: [Recipe], for category: Category)
    /// Save detailed recipe to cache
    /// - Parameter recipeDetailed: detailed recipe
    func save(recipeDetailed: RecipeDetail)
    /// Remove all recipes from cache
    func removeAllRecipes()
}

/// Service to cache recipes
final class CacheService {
    // MARK: - Singletone

    static let shared = CacheService(coreDataManager: CoreDataManager.shared)

    // MARK: - Private Parameters

    private let coreDataManager: CoreDataManager

    // MARK: - Initialization

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
}

// MARK: - CacheService - CacheServiceProtocol

extension CacheService: CacheServiceProtocol {
    // TODO: Add category
    func save(recipes: [Recipe], for category: Category) {
        var categoryCD: CategoryCD
        if let existingCategoryCD = coreDataManager.fetchCategoryCD(for: category) {
            categoryCD = existingCategoryCD
            categoryCD.recipesSet?.forEach { coreDataManager.remove(recipeCD: $0) }
        } else if let newCategoryCD = coreDataManager.makeCategoryCD(for: category) {
            categoryCD = newCategoryCD
        } else {
            print("Failed to save recipes for category to core data")
            return
        }
        categoryCD.name = category.name
        let recipesSet = Set(recipes.compactMap { coreDataManager.makeRecipeCD(for: $0) })
        categoryCD.recipesSet = recipesSet
        coreDataManager.saveContext()
    }

    func save(recipeDetailed: RecipeDetail) {
        if coreDataManager.makeRecipeDetailedCD(for: recipeDetailed) != nil {
            coreDataManager.saveContext()
        }
    }

    func getDetailedRecipe(for recipe: Recipe) -> RecipeDetail? {
        guard let recipeCD = coreDataManager.fetchRecipeDetailedCD(for: recipe) else { return nil }
        return RecipeDetail(recipeCD)
    }

    func getRecipes(for category: Category) -> [Recipe]? {
        if let categoryCD = coreDataManager.fetchCategoryCD(for: category),
           let recipesSet = categoryCD.recipesSet
        {
            return Array(recipesSet).map { Recipe(recipeCD: $0)
            }
        }
        return nil
    }

    func removeAllRecipes() {}
}
