// RecipeDetailDTO.swift
// Copyright © RoadMap. All rights reserved.

/// Welcome
struct Welcome: Codable {
    let recipe: RecipeDetailDTO
}

/// Recipe details
struct RecipeDetailDTO: Codable {
    /// Recipe name
    let label: String
    /// Recipe image
    let image: String
    /// Time to prepare the dish
    let totalTime: Double
    /// Detailed recipe
    let ingredientLines: [String]
    /// Weight of the dish
    let totalWeight: Double
    /// Total Nutrients
    let totalNutrients: NutrientsDTO
}

/// Information about kbzhu
struct NutrientsDTO: Codable {
    /// Number of calories
    let calories: Total
    /// Number of fat
    let fat: Total
    /// Number of calories
    let protein: Total
    /// Number of calories
    let chocdf: Total
    enum CodingKeys: String, CodingKey {
        case calories = "ENERC_KCAL"
        case fat = "FAT"
        case protein = "PROCNT"
        case chocdf = "CHOCDF"
    }
}

/// Number of grams in a dish
struct Total: Codable {
    /// Value
    let quantity: Double
}
