// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Type of handler from sorting button
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
    /// Search necessary element
    /// - Parameter text: text value from searchBar
    func filterCategory(text: String)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Constants

    private enum Constants {
        static let countText = 3
    }

    // MARK: - Public Properties

    var dataSource: Category? {
        didSet {
            view?.updateTableView()
        }
    }

    // MARK: - Private Properties

    private var conteinerCategory: Category?

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
        dataSource = category
        imitateNetworkRequest()
    }

    // MARK: - Public Methods

    func filterCategory(text: String) {
        if text.count < Constants.countText {
            dataSource = category
            view?.clearSortingButtonState()
            view?.updateTableView()
        } else {
            guard let categorySearch = dataSource else { return }
            let searchingRecipe = categorySearch.recipes.filter { $0.name.lowercased().contains(text.lowercased()) }
            dataSource?.recipes = searchingRecipe
            view?.updateTableView()
        }
    }

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
        // Remova all nil predicates and put predicates in correct order in array
        let predicates = [caloriesPredicate, timePredicate].compactMap { $0 }
        // Sorting recipes in category
        let sortedRecipes = dataSource?.recipes.sorted(by: { lhsRecipe, rhsRecipe in
            for predicate in predicates {
                // Case lhs == rhs
                if !predicate(lhsRecipe, rhsRecipe), !predicate(rhsRecipe, lhsRecipe) {
                    continue
                }
                return predicate(lhsRecipe, rhsRecipe)
            }
            return false
        })
        // Set new dataSource
        if let sortedRecipes {
            var sortedCategory = category
            sortedCategory?.recipes = sortedRecipes
            dataSource = sortedCategory
        }
    }

    private func imitateNetworkRequest() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.view?.updateState(with: .loading)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view?.updateState(with: .loaded)
        }
    }
}
