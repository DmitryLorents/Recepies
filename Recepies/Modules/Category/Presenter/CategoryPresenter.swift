// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    typealias SortingRecipeHandler = (Recipe, Recipe) -> Bool

    /// Categories of product to show by view
    var dataSource: Category? { get }
    /// Main initializer
    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category)
    /// Asking presenter to set delegate and dataSource for TableView
    func goBack()
    /// Shows detailed recipe screen
    func showDetailedScreen(for indexPath: IndexPath)
    /// Sorting recipes in category by given predicates
    /// - Parameter caloriesPredicate: sorting predicate from caloriesButton
    /// - Parameter timePredicate: sorting predicate from timeButton
    func sortRecipesBy(_ caloriesPredicate: SortingRecipeHandler?, _ timePredicate: SortingRecipeHandler?)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Types

    // MARK: - Public Properties

    var dataSource: Category? {
        didSet {
            print("Set datasource")
            view?.updateTableView()
        }
    }

    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?
    private var category: Category? {
        didSet {
            print("Set category")
            dataSource = category
        }
    }

    // MARK: - Initialization

    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
        dataSource = category
    }

    // MARK: - Public Methods

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }

    func showDetailedScreen(for indexPath: IndexPath) {
        if let recipesCoordinator = coordinator as? RecipesCoordinator, let recipe = category?.recipes[indexPath.row] {
            recipesCoordinator.goToDetailed(recipe: recipe)
        }
    }

    func sortRecipesBy(_ caloriesPredicate: SortingRecipeHandler?, _ timePredicate: SortingRecipeHandler?) {
        let predicates = [caloriesPredicate, timePredicate].compactMap { $0 }
        let sortedRecipes = category?.recipes.sorted(by: { lhsRecipe, rhsRecipe in
            for predicate in predicates {
                if !predicate(lhsRecipe, rhsRecipe), !predicate(rhsRecipe, lhsRecipe) {
                    continue
                }
                return predicate(lhsRecipe, rhsRecipe)
            }
            return false
        })
        if let sortedRecipes {
            var sortedCategory = category
            sortedCategory?.recipes = sortedRecipes
            dataSource = sortedCategory
        }
    }
}
