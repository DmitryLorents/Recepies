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
}

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
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Soup",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Chicken",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Meat",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(name: "Fish", categoryImage: "salad", recipes: [.init(name: "Simple Fish And Corn",
                                                                        recipeImage: "dish1", timeToCook: 60,
                                                                        calories: 274),
                                                                  .init(
                                                                      name: "Baked Fish with Lemon Herb Sauce",
                                                                      recipeImage: "dish2",
                                                                      timeToCook: 90,
                                                                      calories: 616
                                                                  ),
                                                                  .init(
                                                                      name: "Lemon and Chilli Fish Burrito",
                                                                      recipeImage: "dish3",
                                                                      timeToCook: 99,
                                                                      calories: 226
                                                                  ),
                                                                  .init(
                                                                      name: "Fast Roast Fish & Show Peas Recipes",
                                                                      recipeImage: "dish4",
                                                                      timeToCook: 100,
                                                                      calories: 410
                                                                  ),
                                                                  .init(
                                                                      name: "Salmon with Cantaloupe and Fried Shallots",
                                                                      recipeImage: "dish5",
                                                                      timeToCook: 100,
                                                                      calories: 94
                                                                  ),
                                                                  .init(
                                                                      name: "Chilli and Tomato Fish",
                                                                      recipeImage: "dish6",
                                                                      timeToCook: 100,
                                                                      calories: 174
                                                                  ),
                ]),
            .init(
                name: "Side dish",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Drinks",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Pancake",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
            .init(
                name: "Desserts",
                categoryImage: "salad",
                recipes: [.init(name: "", recipeImage: "", timeToCook: 0, calories: 0)]
            ),
        ]
    }
}
