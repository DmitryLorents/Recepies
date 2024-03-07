// LogCommand.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Describes types of possible log commands
enum LogCommand {
    /// User did open screen with name (string value)
    case userOpenScreen(screenName: String)
    /// User did move  from category with name (first string value) to screen with name (second string value)
    case userMove(categoryName: String, screenName: String)
    /// User did open recipe with name (string value)
    case openRecipe(recipeName: String)
    /// User did share recipe with name (string value)
    case shareRecipe(recipeName: String)

    var message: String {
        switch self {
        case .userOpenScreen(let screenName):
            return "User open \(screenName) screen"
        case .userMove(let categoryName, let screenName):
            return "User moved from \(categoryName) category to \(screenName) screen"
        case .openRecipe(let recipeName):
            return "User open \(recipeName) recipe"
        case .shareRecipe(let recipeName):
            return "User share \(recipeName) recipe"
        }
    }
}
