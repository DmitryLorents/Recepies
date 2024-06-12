// CategoryPresenter.swift
// All rights reserved.

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
        coordinator: BaseModuleCoordinator?,
        networkService: NetworkServiceProtocol?,
        cacheService: CacheServiceProtocol?
    )
    /// Move back to parent screen
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
    func searchRecipes(text: String)
    /// Start downloading data from network
    func fetchData(searchText: String)
    /// Fetch data from cache or network during first open of screen
    func fetchInitialData()
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Constants

    private enum Constants {
        static let minSearchTextLenght = 3
    }

    // MARK: - Public Properties

    var category: Category
    var dataSource: [Recipe]?

    // MARK: - Private Properties

    private var isInitialRun: Bool = true
    private let networkService: NetworkServiceProtocol?
    private let cacheService: CacheServiceProtocol?
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
        coordinator: BaseModuleCoordinator?,
        networkService: NetworkServiceProtocol?,
        cacheService: CacheServiceProtocol?
    ) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
        self.networkService = networkService
        self.cacheService = cacheService
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
        view?.updateState(with: .data)
    }

    func fetchInitialData() {
        view?.updateState(with: .loading)
        if let cachedRecipes = cacheService?.getRecipes(for: category) {
            recipes = cachedRecipes
            view?.updateState(with: .data)
        }
        fetchData(searchText: "")
    }

    func fetchData(searchText: String) {
        if isInitialRun || recipes == nil {
            isInitialRun = false
        } else {
            view?.updateState(with: .loading)
        }
        networkService?.getRecipes(type: category.type, text: searchText) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .failure(error):
                    if self.recipes == nil {
                        print("Error:", error)
                        self.view?.updateState(with: .error(error))
                    }
                case let .success(downloadedRecipes):
                    let currentRecipesSorted = self.recipes?.sorted(by: { $0.name < $1.name })
                    let downloadedRecipeSorted = downloadedRecipes.sorted(by: { $0.name < $1.name })
                    if currentRecipesSorted != downloadedRecipeSorted {
                        self.recipes = downloadedRecipes
                        self.cacheService?.save(recipes: downloadedRecipes, for: self.category)
                        let state: CategoryState = downloadedRecipes.count > 0 ? .data : .noData
                        self.view?.updateState(with: state)
                    } else { self.view?.updateState(with: .data) }
                }
            }
        }
    }

    func searchRecipes(text: String) {
        view?.clearSortingButtonState()
        if text.count >= Constants.minSearchTextLenght {
            fetchData(searchText: text)
        } else if dataSource?.count == 0 || text.isEmpty {
            fetchData(searchText: "")
        }
    }
}
