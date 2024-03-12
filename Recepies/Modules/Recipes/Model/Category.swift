// Category.swift
// Copyright © RoadMap. All rights reserved.

/// Main ingredient of the recipe
struct Category {
    /// Type of category
    let type: CategoryType
    /// Category name
    var name: String {
        type.rawValue.capitalized
    }

    /// Ingredient image
    var categoryImage: String {
        type.rawValue
    }

    /// Filling in category data
    static func makeCategories() -> [Category] {
        var categories: [Category] = []
        for categoryType in CategoryType.allCases {
            let category = Category(type: categoryType)
            categories.append(category)
        }
        return categories
    }
}
