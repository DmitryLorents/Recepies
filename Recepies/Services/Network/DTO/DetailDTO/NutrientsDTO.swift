// NutrientsDTO.swift
// Copyright © RoadMap. All rights reserved.

/// NutrientsDTO
struct NutrientsDTO: Codable {
    /// Number of calories
    let calories: TotalDTO
    /// Number of fat
    let fat: TotalDTO
    /// Number of proteins
    let protein: TotalDTO
    /// Number of calories
    let chocdf: TotalDTO
    enum CodingKeys: String, CodingKey {
        case calories = "ENERC_KCAL"
        case fat = "FAT"
        case protein = "PROCNT"
        case chocdf = "CHOCDF"
    }
}
