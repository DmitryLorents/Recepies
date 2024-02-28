// Recepies.swift
// Copyright © RoadMap. All rights reserved.

/// Название и описание рецепта
struct Recepies {
    /// Название рецепта
    let name: String
    /// Изображение рецепта
    let receptImage: String
    /// Время на готовку блюда
    let timeToCook: Int
    /// Колличество калорий
    let calories: Int
}

/// Основной ингридиент рецепта
struct Category {
    /// Название ингридиента
    let name: String
    /// Изображение ингридиента
    let categoryImage: String
    /// Массив рецептов
    let recepies: [Recepies]
    /// Заполнение данных категории
    static func makeCategory() -> [Category] {
        [
            .init(
                name: "Salad",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Soup",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Chicken",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Meat",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(name: "Fish", categoryImage: "salad", recepies: [.init(name: "Simple Fish And Corn",
                                                                         receptImage: "", timeToCook: 60,
                                                                         calories: 274),
                                                                   .init(
                                                                       name: "",
                                                                       receptImage: "",
                                                                       timeToCook: 0,
                                                                       calories: 0
                                                                   ),
                                                                   .init(
                                                                       name: "",
                                                                       receptImage: "",
                                                                       timeToCook: 0,
                                                                       calories: 0
                                                                   ),
                                                                   .init(
                                                                       name: "",
                                                                       receptImage: "",
                                                                       timeToCook: 0,
                                                                       calories: 0
                                                                   ),
                                                                   .init(
                                                                       name: "",
                                                                       receptImage: "",
                                                                       timeToCook: 0,
                                                                       calories: 0
                                                                   ),
                                                                   .init(
                                                                       name: "",
                                                                       receptImage: "",
                                                                       timeToCook: 0,
                                                                       calories: 0
                                                                   ),
                ]),
            .init(
                name: "Side dish",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Drinks",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Pancake",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Desserts",
                categoryImage: "salad",
                recepies: [.init(name: "", receptImage: "", timeToCook: 0, calories: 0)]
            ),
        ]
    }
}
