// CacheService.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

/// Protocol for cashe recipes service
protocol CacheServiceProtocol {
    /// Get recipes from cache
    /// - Parameter category: category of recipes
    /// - Returns optional array of recipes if available in cache
    func fetchRecipes(for category: Category) -> [Recipe]?
    /// Get detailed recipe from cache
    ///  - Parameter recipe: recipe model
    ///  - Returns optional detailed recipe if available in cache
    func fetchDetailedRecipe(for recipe: Recipe) -> RecipeDetail?
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
        guard let recipeEntityDescription = NSEntityDescription.entity(
            forEntityName: "RecipeCD",
            in: coreDataManager.context
        ) else { return }
        for recipe in recipes {
            let recipeCD = RecipeCD(entity: recipeEntityDescription, insertInto: coreDataManager.context)
            recipeCD.name = recipe.name
            recipeCD.calories = Int16(recipe.calories)
            recipeCD.timeToCook = Int16(recipe.timeToCook)
            recipeCD.recipeImage = recipe.recipeImage
//            recipeCD.category = category.name
            coreDataManager.saveContext()
        }
    }

    func save(recipeDetailed: RecipeDetail) {
        guard let recipeEntityDescription = NSEntityDescription.entity(
            forEntityName: "RecipeDetailedCD",
            in: coreDataManager.context
        )
        else { return }
        let recipeDetaiCD = RecipeDetailedCD(entity: recipeEntityDescription, insertInto: coreDataManager.context)
        recipeDetaiCD.name = recipeDetailed.name
        recipeDetaiCD.calories = recipeDetailed.calories
        recipeDetaiCD.carbohydrates = recipeDetailed.carbohydrates
        recipeDetaiCD.recipeImage = recipeDetailed.recipeImage
        recipeDetaiCD.fats = recipeDetailed.fats
        recipeDetaiCD.timeToCook = recipeDetailed.timeToCook
        recipeDetaiCD.recipeDescription = recipeDetailed.description
        recipeDetaiCD.weight = recipeDetailed.weight
        recipeDetaiCD.proteins = recipeDetailed.proteins
        coreDataManager.saveContext()
    }

    func fetchDetailedRecipe(for recipe: Recipe) -> RecipeDetail? {
        do {
            let recipes = try? coreDataManager.context.fetch(RecipeDetailedCD.fetchRequest())
            guard let recipes = recipes else { return nil }
            for item in recipes where item.name == recipe.name {
                return RecipeDetail(CD: item)
            }
            return nil
        }
    }

    // TODO: Add category to search
    func fetchRecipes(for category: Category) -> [Recipe]? {
        do {
            let recipes = try? coreDataManager.context.fetch(RecipeCD.fetchRequest())
//            guard let categoryRecipes = recipes?.filter({ $0.category == category.name }) else { return nil }
//            return categoryRecipes.map { Recipe(recipeCD: $0) }
        }
        return nil
    }

    func removeAllRecipes() {}
}
