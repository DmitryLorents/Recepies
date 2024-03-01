// Category.swift
// Copyright © RoadMap. All rights reserved.

/// Основной ингридиент рецепта
struct Category {
    /// Название ингридиента
    let name: String
    /// Изображение ингридиента
    let categoryImage: String
    /// Массив рецептов
    let recepes: [Recipe]
    /// Заполнение данных категории
    static func makeCategory() -> [Category] {
        [
            .init(
                name: "Salad",
                categoryImage: "salad",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Soup",
                categoryImage: "soup",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Chicken",
                categoryImage: "chicken",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Meat",
                categoryImage: "meat",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Side dish",
                categoryImage: "side dish",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Drinks",
                categoryImage: "drinks",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Pancakes",
                categoryImage: "pancakes",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recepes: Recipe.makeRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recepes: Recipe.makeRecipes()
            ),
        ]
    }
}
