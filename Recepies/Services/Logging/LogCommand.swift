// LogAction.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Describes types of possible log commands
public enum LogCommand {
    /// User did open screen with name (string value)
    case userOpenScreen(screenName: String)
    /// User did move  from category with name (first string value) to screen with name (second string value)
    case userMove(fromCategory: String, toScreen: String)
    /// User did open recipe with name (string value)
    case openRecipe(recipeName: String)
    /// User did share recipe with name (string value)
    case shareRecipe(recipeName: String)
    /// Return message for writing to log
    var logMessage: String {
        switch self {
        case let .userOpenScreen(screenName):
            return "User open \(screenName) screen"
        case let .userMove(fromCategory, toScreen):
            return "User moved from \(fromCategory) category to \(toScreen) screen"
        case let .openRecipe(recipeName):
            return "User open \(recipeName) recipe"
        case let .shareRecipe(recipeName):
            return "User share \(recipeName) recipe"
        }
    }
}
