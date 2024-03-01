// Recipe.swift
// Copyright © RoadMap. All rights reserved.

/// Название и описание рецепта
struct Recipe {
    /// Название рецепта
    let name: String
    /// Изображение рецепта
    let recipeImage: String
    /// Время на готовку блюда
    let timeToCook: Int
    /// Колличество калорий
    let calories: Int
    /// Детальный рецепт
    let description: String
    /// Вес блюда
    let weight: Int
    /// БЖУ
    let pfc: PFC

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

    static func makeMockRecipes() -> [Recipe] {
        [
            .init(
                name: "Simple Fish And Corn",
                recipeImage: "dish1",
                timeToCook: 60,
                calories: 274,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Baked Fish with Lemon Herb Sauce",
                recipeImage: "dish2",
                timeToCook: 90,
                calories: 616,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Lemon and Chilli Fish Burrito",
                recipeImage: "dish3",
                timeToCook: 99,
                calories: 226,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Fast Roast Fish & Show Peas Recipes",
                recipeImage: "dish4",
                timeToCook: 100,
                calories: 410,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Salmon with Cantaloupe and Fried Shallots",
                recipeImage: "dish5",
                timeToCook: 100,
                calories: 94,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Chilli and Tomato Fish",
                recipeImage: "dish6",
                timeToCook: 100,
                calories: 174,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
        ]
    }
}
