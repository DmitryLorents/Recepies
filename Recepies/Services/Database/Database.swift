// Database.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Protocol for storage service
protocol DataBaseProtocol {
    /// Adds recipe to favorites
    ///  - Parameter recipe: recipe model
    ///  - Returns true is success, false if not added to favorites
    func addToFavorites(_ recipe: Recipe) -> Bool
    /// Remove recipe from favorites
    ///  - Parameter recipe: recipe model
    ///  - Returns true is success, false if not removed from favorites
    func removeFromFavorites(_ recipe: Recipe) -> Bool
    /// Check if favorites contain recipe
    ///  - Parameter recipe: recipe model
    ///  - Returns true is contain, false if not
    func isFavorite(_ recipe: Recipe) -> Bool
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

    func addToFavorites(_ recipe: Recipe) -> Bool {
        let (isAdded, _) = recipesSet.insert(recipe)
        return isAdded
    }

    func removeFromFavorites(_ recipe: Recipe) -> Bool {
        recipesSet.remove(recipe) != nil
    }

    func isFavorite(_ recipe: Recipe) -> Bool {
        recipesSet.contains(recipe)
    }
}
