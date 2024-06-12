// CategoryDTO.swift
// All rights reserved.

import Foundation

// MARK: - CategoryDTO

/// DTO for search by category
struct CategoryDTO: Codable {
    /// Array of recipesDTO containers
    let hits: [HitDTO]
}
