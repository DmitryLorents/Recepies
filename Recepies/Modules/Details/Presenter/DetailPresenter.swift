// DetailPresenter.swift
// All rights reserved.

import Foundation

/// Parts presenter protocol
protocol DetailPresenterProtocol: AnyObject {
    /// Protocol initialization
    init(
        view: DetailViewProtocol,
        coordinator: BaseModuleCoordinator,
        recipe: Recipe,
        database: DataBaseProtocol?,
        networkService: NetworkServiceProtocol?,
        cacheService: CacheServiceProtocol?
    )
    /// Recipe data
    var recipeDetail: RecipeDetail? { get set }
    /// Recipe is stored in favorites or not
    var isFavorite: Bool { get }
    /// Return to previous controller
    func goBack()
    /// Add/remove recipe to favorites
    func updateRecipeFavoriteStatus()
    /// Shares recipe into Telegram
    func shareRecipe()
    /// Obtaining prescription data
    func fetchData()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipeDetail: RecipeDetail?
    var isFavorite: Bool {
        database?.isFavorite(recipe) == true
    }

    // MARK: - Private Properties

    private let recipe: Recipe
    private let cacheService: CacheServiceProtocol?
    private let networkService: NetworkServiceProtocol?
    private weak var view: DetailViewProtocol?
    private weak var coordinator: BaseModuleCoordinator?
    private var database: DataBaseProtocol?

    // MARK: - Initializers

    init(
        view: DetailViewProtocol,
        coordinator: BaseModuleCoordinator,
        recipe: Recipe,
        database: DataBaseProtocol?,
        networkService: NetworkServiceProtocol?,
        cacheService: CacheServiceProtocol?
    ) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
        self.database = database
        self.networkService = networkService
        self.cacheService = cacheService
    }

    // MARK: - Public Methods

    func updateRecipeFavoriteStatus() {
        if isFavorite {
            database?.removeFromFavorites(recipe)
        } else { database?.addToFavorites(recipe) }
        view?.updateFavoriteButton()
    }

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }

    func shareRecipe() {
        log(.shareRecipe(recipeName: recipe.name))
    }

    func fetchData() {
        view?.state = .loading
        if let recipeFromCache = cacheService?.getDetailedRecipe(for: recipe) {
            recipeDetail = recipeFromCache
            view?.state = .data
        } else {
            networkService?.getDetailedRecipe(url: recipe.uri) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case let .success(recipeData):
                        self?.cacheService?.save(recipeDetailed: recipeData)
                        self?.recipeDetail = recipeData
                        self?.view?.state = .data

                    case let .failure(error):
                        print("error")
                        self?.view?.state = .error(error)
                    }
                }
            }
        }
    }
}
