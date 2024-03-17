// RecipeDetailedCD+CoreDataClass.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

/// Core data model for detailed recipe
public final class RecipeDetailedCD: NSManagedObject {
    @nonobjc static let entityName = "RecipeDetailedCD"
    @nonobjc class func fetchRequest() -> NSFetchRequest<RecipeDetailedCD> {
        NSFetchRequest<RecipeDetailedCD>(entityName: RecipeDetailedCD.entityName)
    }

    @NSManaged var name: String?
    @NSManaged var recipeImage: String
    @NSManaged var timeToCook: Double
    @NSManaged var calories: Double
    @NSManaged var recipeDescription: String
    @NSManaged var weight: Double
    @NSManaged var proteins: Double
    @NSManaged var fats: Double
    @NSManaged var carbohydrates: Double
}

extension RecipeDetailedCD: Identifiable {}
