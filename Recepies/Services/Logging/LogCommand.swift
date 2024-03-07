// LogCommand.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Describes types of possible log commands
enum LogCommand {
    case one
    case two

    var message: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        }
    }
}
