// Database.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
/// Protocol for storage service
protocol DataBaseProtocol {
    /// Adds recipe to favorites
    ///  - Parameter recipe: recipe model
    ///  - Returns true is success, false if not added to favorites
    func addToFavorites(_ recipe: Recipe)
    /// Remove recipe from favorites
    ///  - Parameter recipe: recipe model
    ///  - Returns true is success, false if not removed from favorites
    func removeFromFavorites(_ recipe: Recipe)
    /// Check if favorites contain recipe
    ///  - Parameter recipe: recipe model
    ///  - Returns true is contain, false if not
    func isFavorite(_ recipe: Recipe) -> Bool
    /// Provide array of recipes from internal storage
    ///  - Returns array of favorite recipe
    func getFavoriteRecipes() -> [Recipe]
}
/// Storage for recipes and categories
final class Database: DataBaseProtocol {
    // MARK: - Singletone
    static let shared = Database()
    
    // MARK: - Private Properties
    private var recipesSet: Set<Recipe> = []
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - DataBaseProtocol
    func addToFavorites(_ recipe: Recipe){
        recipesSet.insert(recipe)
    }
    
    func removeFromFavorites(_ recipe: Recipe) {
        recipesSet.remove(recipe)
    }
    
    func isFavorite(_ recipe: Recipe) -> Bool {
        recipesSet.contains(recipe)
    }
    func getFavoriteRecipes() -> [Recipe] {
        Array(recipesSet)
    }
}
