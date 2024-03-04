// Category.swift
// Copyright © RoadMap. All rights reserved.

/// Основной ингридиент рецепта
struct Category {
    /// Название ингридиента
    let name: String
    /// Изображение ингридиента
    let categoryImage: String
    /// Массив рецептов
    var recipes: [Recipe]
    /// Заполнение данных категории
    static func makeMockCategory() -> [Category] {
        [
            .init(
                name: "Salad",
                categoryImage: "salad",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Soup",
                categoryImage: "soup",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Chicken",
                categoryImage: "chicken",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Meat",
                categoryImage: "meat",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Side dish",
                categoryImage: "side dish",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Drinks",
                categoryImage: "drinks",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Pancakes",
                categoryImage: "pancakes",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recipes: Recipe.makeMockRecipes()
            ),
            .init(
                name: "Desserts",
                categoryImage: "desserts",
                recipes: Recipe.makeMockRecipes()
            ),
        ]
    }
}
