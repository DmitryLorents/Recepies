// PFC.swift
// Copyright © RoadMap. All rights reserved.

/// Content of proteins, fats and carbohydrates
struct PFC: Codable, Hashable {
    /// Proteins
    let proteins: Double
    /// Fats
    let fats: Double
    /// Carbohydrates
    let carbohydrates: Double
}