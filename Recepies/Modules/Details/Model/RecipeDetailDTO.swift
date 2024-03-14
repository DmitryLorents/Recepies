// RecipeDetailDTO.swift
// Copyright © RoadMap. All rights reserved.

// MARK: - RecipeDTOContainer

//// esf
struct RecipeDetailResponseDTO: Codable {
    let hits: [RecipeDTOContainer]
}

/// Container for RecipeDetailDTO
struct RecipeDTOContainer: Codable {
    let recipe: RecipeDetailDTO
}

// MARK: - RecipeDetailDTO

/// DTO model for recipe received from nerwork
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
    /// All Nutrients
    let totalNutrients: NutrientsDTO
}

// MARK: - NutrientsDTO

/// PFC data container
struct NutrientsDTO: Codable {
    /// Number of calories
    let calories: Total
    /// Number of fat
    let fat: Total
    /// Number of proteins
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

// MARK: - Total

/// Container for PFC amount
struct Total: Codable {
    /// Amount of PFC components in gramms
    let quantity: Double
}
