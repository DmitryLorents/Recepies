// CategoryCD+CoreDataClass.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

/// Core data model for recipe
public final class CategoryCD: NSManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<CategoryCD> {
        NSFetchRequest<CategoryCD>(entityName: "CategoryCD")
    }

    @NSManaged var name: String?
    @NSManaged var recipes: NSSet?

    // MARK: Generated accessors for recipes

    @objc(addRecipesObject:)
    @NSManaged func addToRecipes(_ value: RecipeCD)

    @objc(removeRecipesObject:)
    @NSManaged func removeFromRecipes(_ value: RecipeCD)

    @objc(addRecipes:)
    @NSManaged func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged func removeFromRecipes(_ values: NSSet)
}

extension CategoryCD: Identifiable {}
