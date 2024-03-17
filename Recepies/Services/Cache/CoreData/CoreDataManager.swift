// CoreDataManager.swift
// Copyright © RoadMap. All rights reserved.

import CoreData
import Foundation

final class CoreDataManager {
    // MARK: - Singletone

    static let shared = CoreDataManager()
    private init() {}

    // MARK: - Piblic Properties

    lazy var context = persistentContainer.viewContext
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Recepies")
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                print("Persistent container error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Public Methods

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Failed to save context \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchCategoryCD(for category: Category) -> CategoryCD? {
        let fetchRequest = CategoryCD.fetchRequest()
        let categories = try? context.fetch(fetchRequest)
        return categories?.first(where: { $0.name == category.name })
    }

    func fetchRecipeCD(for recipe: Recipe) -> RecipeCD? {
        let fetchRequest = RecipeCD.fetchRequest()
        let recipes = try? context.fetch(fetchRequest)
        return recipes?.first(where: { $0.uri == recipe.uri })
    }

    func fetchRecipeDetailedCD(for recipe: Recipe) -> RecipeDetailedCD? {
        let fetchRequest = RecipeDetailedCD.fetchRequest()
        let recipes = try? context.fetch(fetchRequest)
        return recipes?.first(where: { $0.name == recipe.name })
    }

    func makeCategoryCD(for category: Category) -> CategoryCD? {
        guard let categoryCDEntityDescruption = NSEntityDescription.entity(
            forEntityName: CategoryCD.entityName,
            in: context
        ) else {
            print("Failed to create CategoryCD entity")
            return nil
        }
        let categoryCD = CategoryCD(entity: categoryCDEntityDescruption, insertInto: context)
        categoryCD.name = category.name
        return categoryCD
    }

    func makeRecipeCD(for recipe: Recipe) -> RecipeCD? {
        guard let recipeCDEntityDescription = NSEntityDescription
            .entity(forEntityName: RecipeCD.entityName, in: context)
        else {
            print("Failed to create RecipeCd entity")
            return nil
        }
        let recipeCD = RecipeCD(entity: recipeCDEntityDescription, insertInto: context)
        recipeCD.name = recipe.name
        recipeCD.recipeImage = recipe.recipeImage
        recipeCD.timeToCook = Int16(recipe.timeToCook)
        recipeCD.calories = Int16(recipe.calories)
        recipeCD.uri = recipe.uri
        return recipeCD
    }

    func makeRecipeDetailedCD(for recipeDetailed: RecipeDetail) -> RecipeDetailedCD? {
        guard let recipeDetailCDEntityDescription = NSEntityDescription.entity(
            forEntityName: RecipeDetailedCD.entityName,
            in: context
        ) else {
            print("Failed to create RecipeDetailedCD entity")
            return nil
        }
        let recipeDetailCD = RecipeDetailedCD(entity: recipeDetailCDEntityDescription, insertInto: context)
        recipeDetailCD.name = recipeDetailed.name
        recipeDetailCD.calories = recipeDetailed.calories
        recipeDetailCD.carbohydrates = recipeDetailed.carbohydrates
        recipeDetailCD.recipeImage = recipeDetailed.recipeImage
        recipeDetailCD.fats = recipeDetailed.fats
        recipeDetailCD.timeToCook = recipeDetailed.timeToCook
        recipeDetailCD.recipeDescription = recipeDetailed.description
        recipeDetailCD.weight = recipeDetailed.weight
        recipeDetailCD.proteins = recipeDetailed.proteins
        return recipeDetailCD
    }

    func remove(recipeCD: RecipeCD) {
        print("Remove recipeCd with name: \(recipeCD.name)")
        context.delete(recipeCD)
    }
}
