// RecipeCD+CoreDataClass.swift
// All rights reserved.

import CoreData
import Foundation

/// Core data model for recipe
public final class RecipeCD: NSManagedObject {
    @nonobjc static let entityName = "RecipeCD"
    @nonobjc class func fetchRequest() -> NSFetchRequest<RecipeCD> {
        NSFetchRequest<RecipeCD>(entityName: RecipeCD.entityName)
    }

    @NSManaged var name: String
    @NSManaged var recipeImage: String
    @NSManaged var timeToCook: Int16
    @NSManaged var calories: Int16
    @NSManaged var uri: String
}

extension RecipeCD: Identifiable {}
