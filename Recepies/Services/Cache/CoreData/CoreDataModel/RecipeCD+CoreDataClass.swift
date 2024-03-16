// RecipeCD+CoreDataClass.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

/// Core data model for recipe
public final class RecipeCD: NSManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<RecipeCD> {
        NSFetchRequest<RecipeCD>(entityName: "RecipeCD")
    }

    @NSManaged var name: String
    @NSManaged var recipeImage: String
    @NSManaged var timeToCook: Int16
    @NSManaged var calories: Int16
}

extension RecipeCD: Identifiable {}
