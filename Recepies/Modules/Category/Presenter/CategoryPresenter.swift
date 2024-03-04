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
        switch predicates.count {
        case 2:
            sortByTwoPredicates(predicates)
        case 1:
            sortCategoryBy(predicates[0])
        default:
            dataSource = category
        }
    }

    private func sortByTwoPredicates(_ predicates: [SortingRecipeHandler]) {
        print(#function)
        if let sortedRecipes = category?.recipes.sorted(by: { lhsRecipe, rhsRecipe in
            if lhsRecipe.calories == rhsRecipe.calories {
                return predicates[1](lhsRecipe, rhsRecipe)
            }
            return predicates[0](lhsRecipe, rhsRecipe)

        }) {
            var sortedCategory = category
            sortedCategory?.recipes = sortedRecipes
            dataSource = sortedCategory
        }
    }

    private func sortCategoryBy(_ predicate: SortingRecipeHandler) {
        print(#function)
        if let sortedRecipes = category?.recipes.sorted(by: { predicate($0, $1) }) {
            var sortedCategory = category
            sortedCategory?.recipes = sortedRecipes
            dataSource = sortedCategory
        }
    }
}
