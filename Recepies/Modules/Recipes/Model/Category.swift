// Category.swift
// Copyright © RoadMap. All rights reserved.

/// Основной ингридиент рецепта
struct Category {
    /// Название ингридиента
    let name: String
    /// Изображение ингридиента
    let categoryImage: String
    /// Массив рецептов
    let recipes: [Recipe]
    /// Заполнение данных категории
    static func makeCategory() -> [Category] {
        [
            .init(
                name: "Salad",
                categoryImage: "salad",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Soup",
                categoryImage: "soup",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Chicken",
                categoryImage: "chicken",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Meat",
                categoryImage: "meat",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Side dish",
                categoryImage: "side dish",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Drinks",
                categoryImage: "drinks",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Pancakes",
                categoryImage: "pancakes",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recipes: Recipe.makeRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recipes: Recipe.makeRecipes()
            ),
        ]
    }
}
