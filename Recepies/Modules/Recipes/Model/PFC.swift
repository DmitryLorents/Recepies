// PFC.swift
// Copyright © RoadMap. All rights reserved.

/// Содержиние белков, жиров и углеводов
struct PFC {
    /// Белки
    let proteins: Double
    /// Жиры
    let fats: Double
    /// Углеводы
    let carbohydrates: Double

    static func makeMockPFC() -> PFC {
        .init(proteins: 20.345, fats: 13.567, carbohydrates: 40.111)
    }
}
