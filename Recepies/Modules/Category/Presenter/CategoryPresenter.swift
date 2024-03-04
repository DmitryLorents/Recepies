// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
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
    func sortRecipesBy(
        _ caloriesPredicate: @escaping (Recipe, Recipe) -> Bool,
        _ timePredicate: @escaping (Recipe, Recipe) -> Bool
    )
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Public Properties

    var dataSource: Category? {
        didSet {
            view?.updateTableView()
        }
    }

    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?
    private var category: Category? {
        didSet {
            dataSource = category
        }
    }

    // MARK: - Initialization

    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
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

    func sortRecipesBy(
        _ caloriesPredicate: @escaping (Recipe, Recipe) -> Bool,
        _ timePredicate: @escaping (Recipe, Recipe) -> Bool
    ) {
        let sortedRecipe = dataSource?.recipes.sorted(by: { lhsRecipe, rhsRecipe in
            if lhsRecipe.calories == rhsRecipe.calories {
                return timePredicate(lhsRecipe, rhsRecipe)
            }
            return caloriesPredicate(lhsRecipe, rhsRecipe)
        })
        if let sortedRecipe {
            var sortedCategory = category
            sortedCategory?.recipes = sortedRecipe
            dataSource = sortedCategory
        }
    }
}
