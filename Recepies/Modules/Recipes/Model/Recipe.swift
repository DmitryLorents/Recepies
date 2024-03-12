// Recipe.swift
// Copyright © RoadMap. All rights reserved.

/// Name and description of the recipe
struct Recipe: Codable {
    /// Recipe name
    let name: String
    /// Recipe image
    let recipeImage: String
    /// Time to prepare the dish
    let timeToCook: Int
    /// Number of calories
    let calories: Int
    
    init(_ recipeDTO: RecipeDTO) {
        self.name = recipeDTO.label
        self.recipeImage = recipeDTO.image
        self.timeToCook = recipeDTO.totalTime
        calories = Int(recipeDTO.calories)
    }

    
}

extension Recipe: Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
        lhs.name == rhs.name
    }
}
