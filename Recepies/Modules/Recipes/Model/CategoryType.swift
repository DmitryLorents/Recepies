// CategoryType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

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
    
    var description: String {
        switch self {
        case .chicken, .meat, .sideDish:
            return "Main course"
        default:
            return self.rawValue.capitalized
        }
    }
}
