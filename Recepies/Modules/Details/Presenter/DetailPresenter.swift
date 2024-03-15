// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Parts presenter protocol
protocol DetailPresenterProtocol: AnyObject {
    /// Protocol initialization
    init(
        view: DetailViewProtocol,
        coordinator: BaseModuleCoordinator,
        recipe: Recipe,
        database: DataBaseProtocol,
        networkService: NetworkServiceProtocol
    )
    /// Recipe data
    var recipeDetail: RecipeDetail? { get set }
    /// Return to previous controller
    func goBack()
    /// Add/remove recipe to favorites
    func updateRecipeFavoriteStatus()
    /// Shares recipe into Telegram
    func shareRecipe()
    /// Recipe data
    var recipe: Recipe { get set }
    /// Obtaining prescription data
    func fetchData()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipeDetail: RecipeDetail?

    var isFavorite: Bool {
        database.isFavorite(recipe)
    }

    var recipe: Recipe

    // MARK: - Private Properties

    private let networkService: NetworkServiceProtocol
    private weak var view: DetailViewProtocol?
    private weak var coordinator: BaseModuleCoordinator?
    private var database: DataBaseProtocol

    // MARK: - Initializers

    init(
        view: DetailViewProtocol,
        coordinator: BaseModuleCoordinator,
        recipe: Recipe,
        database: DataBaseProtocol,
        networkService: NetworkServiceProtocol
    ) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
        self.database = database
        self.networkService = networkService
    }

    // MARK: - Public Methods

    func updateRecipeFavoriteStatus() {
        if isFavorite {
            database.removeFromFavorites(recipe)
        } else { database.addToFavorites(recipe) }
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
        networkService.getDetailedRecipe(url: recipe.uri) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(recipeData):
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
