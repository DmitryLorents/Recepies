// PFC.swift
// Copyright © RoadMap. All rights reserved.

/// Content of proteins, fats and carbohydrates
struct PFC: Hashable {
    /// Proteins
    let proteins: Double
    /// Fats
    let fats: Double
    /// Carbohydrates
    let carbohydrates: Double

    static func makeMockPFC() -> PFC {
        .init(proteins: 20.345, fats: 13.567, carbohydrates: 40.111)
    }
}
