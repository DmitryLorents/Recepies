// Recipe.swift
// Copyright © RoadMap. All rights reserved.

/// Name and description of the recipe
struct Recipe {
    /// Recipe name
    let name: String
    /// Recipe image
    let recipeImage: String
    /// Time to prepare the dish
    let timeToCook: Int
    /// Number of calories
    let calories: Int
    /// Detailed recipe
    let description: String
    /// Weight of the dish
    let weight: Int
    /// BJU
    let pfc: PFC

    static let descriptionText = """
    1/2 to 2 fish heads, depending on size, about 5 pounds total
    2 tablespoons vegetable oil
    1/4 cup red or green thai curry paste
    3 tablespoons fish sauce or anchovy sauce
    1 tablespoon sugar
    1 can coconut milk, about 12 ounces
    3 medium size asian eggplants, cut int 1 inch rounds
    Handful of bird's eye chilies
    1/2 cup thai basil leaves
    Juice of 3 limes
    1/2 to 2 fish heads, depending on size, about 5 pounds total
    2 tablespoons vegetable oil
    1/4 cup red or green thai curry paste
    3 tablespoons fish sauce or anchovy sauce
    1 tablespoon sugar
    1 can coconut milk, about 12 ounces
    3 medium size asian eggplants, cut int 1 inch rounds
    Handful of bird's eye chilies
    1/2 cup thai basil leaves
    Juice of 3 limes
    1/2 to 2 fish heads, depending on size, about 5 pounds total
    2 tablespoons vegetable oil
    1/4 cup red or green thai curry paste
    3 tablespoons fish sauce or anchovy sauce
    1 tablespoon sugar
    1 can coconut milk, about 12 ounces
    3 medium size asian eggplants, cut int 1 inch rounds
    Handful of bird's eye chilies
    1/2 cup thai basil leaves
    Juice of 3 limes
    """
    static func makeMockRecipes() -> [Recipe] {
        [
            .init(
                name: "Simple Fish And Corn",
                recipeImage: "dish1",
                timeToCook: 60,
                calories: 300,
                description: Recipe.descriptionText,
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Baked Fish with Lemon Herb Sauce",
                recipeImage: "dish2",
                timeToCook: 80,
                calories: 300,
                description: "MAny many text",
                weight: 1300,
                pfc: PFC.makeMockPFC()
            ),
            .init(
                name: "Lemon and Chilli Fish Burrito",
                recipeImage: "dish3",
                timeToCook: 90,
                calories: 300,
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
                timeToCook: 120,
                calories: 410,
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
