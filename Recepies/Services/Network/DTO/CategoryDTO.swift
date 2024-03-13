// CategoryDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// MARK: - CategoryDTO

/// DTO for search by category
struct CategoryDTO: Codable {
    /// Array of recipesDTO containers
    let hits: [Hit]
}

// MARK: - Hit

/// RecipeDTO container
struct Hit: Codable {
    /// Recipe
    let recipe: RecipeDTO
}

// MARK: - Recipe

/// DTO for recipe
struct RecipeDTO: Codable {
    /// Base link for detailed search
    let uri: String
    /// Recipe name
    let label: String
    /// Recipe image url
    let image: String
    /// Calories amount
    let calories: Double
    /// Cooking time
    let totalTime: Int
}
