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
        print(#function)
        var categoryCD: CategoryCD
        if let existingCategoryCD = coreDataManager.fetchCategoryCD(for: category) {
            print("Found existing category with name: \(existingCategoryCD.name)")
            categoryCD = existingCategoryCD
            categoryCD.recipesSet?.forEach { coreDataManager.remove(recipeCD: $0) }
        } else if let newCategoryCD = coreDataManager.makeCategoryCD(for: category) {
            print("Created new catewgoryCD with name: \(newCategoryCD.name)")
            categoryCD = newCategoryCD

        } else {
            print("Failed to save recipes for category to core data")
            return
        }
//        categoryCD.name = category.name
        let recipesSet = Set(recipes.compactMap { coreDataManager.makeRecipeCD(for: $0) })
        print("Created recipes set, count: \(recipesSet.count)")
        print("First recipe name: \(recipesSet.first?.name)")
        categoryCD.recipesSet = recipesSet
        coreDataManager.saveContext()
    }

    func save(recipeDetailed: RecipeDetail) {
        print(#function)
        if coreDataManager.makeRecipeDetailedCD(for: recipeDetailed) != nil {
            coreDataManager.saveContext()
        }
    }

    func getDetailedRecipe(for recipe: Recipe) -> RecipeDetail? {
        print(#function)
        guard let recipeCD = coreDataManager.fetchRecipeDetailedCD(for: recipe) else {
            print("Not find such recipe in cache")
            return nil
        }
        let reci = RecipeDetail(recipeCD)
        print("Got detailed recipe from cache with name: \(reci.name)")
        return RecipeDetail(recipeCD)
    }

    func getRecipes(for category: Category) -> [Recipe]? {
        print(#function)
        if let categoryCD = coreDataManager.fetchCategoryCD(for: category),
           let recipesSet = categoryCD.recipesSet
        {
            let recipes = Array(recipesSet.map { Recipe(recipeCD: $0) })
            print("Returned recipes from cache count: \(recipes.count)")
            print("First recipe name: \(recipes.first?.name)")
            return Array(recipesSet.map { Recipe(recipeCD: $0) })
        }
        return nil
    }

    func removeAllRecipes() {}
}
