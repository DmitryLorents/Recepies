// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Type of handler from sorting button
    typealias SortingRecipeHandler = (Recipe, Recipe) -> Bool
    /// Recipes to show by view
    var dataSource: [Recipe]? { get }
    /// Category received from initialization phase
    var category: Category { get }
    /// Main initializer
    init(
        category: Category,
        view: CategoryViewProtocol,
        coordinator: BaseModuleCoordinator,
        networkService: NetworkServiceProtocol
    )
    /// Asking presenter to set delegate and dataSource for TableView
    func goBack()
    /// Shows detailed recipe screen
    func showDetailedScreen(for indexPath: IndexPath)
    /// Sorting recipes in category by given predicates
    /// - Parameters:
    /// caloriesPredicate: sorting predicate from caloriesButton
    /// timePredicate: sorting predicate from timeButton
    func sortRecipesBy(_ caloriesPredicate: SortingRecipeHandler?, _ timePredicate: SortingRecipeHandler?)
    /// Search necessary element
    /// - Parameter text: text value from searchBar
    func filterRecipes(text: String)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Constants

    private enum Constants {
        static let minTextLenght = 3
    }

    // MARK: - Public Properties

    var category: Category
    var dataSource: [Recipe]? {
        didSet {
            view?.updateTableView()
        }
    }

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?
    private var recipes: [Recipe]? {
        didSet {
            dataSource = recipes
        }
    }

    // MARK: - Initialization

    init(
        category: Category,
        view: CategoryViewProtocol,
        coordinator: BaseModuleCoordinator,
        networkService: NetworkServiceProtocol
    ) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
        self.networkService = networkService
    }

    // MARK: - Public Methods

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }

    func showDetailedScreen(for indexPath: IndexPath) {
        if let recipesCoordinator = coordinator as? RecipesCoordinator, let recipe = dataSource?[indexPath.row] {
            recipesCoordinator.goToDetailed(recipe: recipe)
        }
    }

    func sortRecipesBy(_ caloriesPredicate: SortingRecipeHandler?, _ timePredicate: SortingRecipeHandler?) {
        // Remova all nil predicates and put predicates in correct order in array
        let predicates = [caloriesPredicate, timePredicate].compactMap { $0 }
        // Sorting recipes in category
        let sortedRecipes = dataSource?.sorted(by: { lhsRecipe, rhsRecipe in
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
        dataSource = sortedRecipes
    }

    private func imitateNetworkRequest(completionHandler: @escaping VoidHandler) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.view?.updateState(with: .loading)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.view?.updateState(with: .loaded)
            completionHandler()
        }
    }

    func filterRecipes(text: String) {
        if text.count < Constants.minTextLenght {
            dataSource = recipes
            view?.clearSortingButtonState()
            view?.updateTableView()
        } else {
//            imitateNetworkRequest { [weak self] in
//                guard let self else { return }
//                guard let categorySearch = dataSource else { return }
//                let searchingRecipe = categorySearch.recipes.filter { $0.name.lowercased().contains(text.lowercased())
//                }
//                dataSource?.recipes = searchingRecipe
//            }
        }
    }
}
