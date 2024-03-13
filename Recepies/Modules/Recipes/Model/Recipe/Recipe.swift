// Recipe.swift
// Copyright © RoadMap. All rights reserved.

/// Data related to recipe
struct Recipe: Codable {
    /// Recipe name
    let name: String
    /// Recipe image url
    let recipeImage: String
    /// Time to cook the dish
    let timeToCook: Int
    /// Calories amount
    let calories: Int
    /// Converting from DTO model
    init(_ recipeDTO: RecipeDTO) {
        name = recipeDTO.label
        recipeImage = recipeDTO.image
        timeToCook = recipeDTO.totalTime
        calories = Int(recipeDTO.calories)
    }
}

extension Recipe: Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.name == rhs.name
    }
}
