// CategoryType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
/// Describe types of dishes
enum CategoryType: String, CaseIterable {
    case salad
    case soup
    case chicken
    case meat
    case fish
    case sideDish = "side Dish"
    case pancake
    case drinks
    case desserts
    /// Describe category name, used in Category model and search through RestAPI
    var description: String {
        switch self {
        case .chicken, .meat, .sideDish:
            return "Main course"
        default:
            return rawValue.capitalized
        }
    }
}
