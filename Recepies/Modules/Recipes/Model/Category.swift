// Category.swift
// Copyright © RoadMap. All rights reserved.

/// Main ingredient of the recipe
struct Category {
    /// Ingredient name
    let name: String
    /// Ingredient image
    let categoryImage: String
    /// Array of recipes
    var recipes: [Recipe]
    /// Filling in category data
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
