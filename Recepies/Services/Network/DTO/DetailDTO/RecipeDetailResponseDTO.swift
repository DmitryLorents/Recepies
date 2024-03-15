// RecipeDetailResponseDTO.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// General data container for Detailed recipe fromserver
struct RecipeDetailResponseDTO: Codable {
    let hits: [RecipeDTOContainer]
}
