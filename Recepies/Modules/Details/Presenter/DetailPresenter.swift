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
    /// shares recipe into Telegram
    func shareRecipe()
    var recipe: Recipe { get set }
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipeDetail: RecipeDetail? {
        didSet {
            view?.reloadData()
        }
    }

    var isFavorite: Bool {
        database.isFavorite(recipe)
    }

    // MARK: - Private Properties

    var recipe: Recipe {
        didSet {
            DispatchQueue.main.async {
                self.networkService
                    .getRecipe(url: "http://www.edamam.com/ontologies/edamam.owl#recipe_47dc96d52dc2ca66df1e008389617d97") { [weak self] result in
                        switch result {
                        case let .success(recipe):
                            print(recipe)
                            self?.recipeDetail = recipe
                            
                        case let .failure(error):
                            print(error)
                        }
                    }
            }
            
        }
    }

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
        
        DispatchQueue.main.async {
            self.networkService
                .getRecipe(url: "http://www.edamam.com/ontologies/edamam.owl#recipe_47dc96d52dc2ca66df1e008389617d97") { [weak self] result in
                    switch result {
                    case let .success(recipe):
                        print(recipe)
                        self?.recipeDetail = recipe
                        
                    case let .failure(error):
                        print(error)
                    }
                }
        }
//        log(.shareRecipe(recipeName: recipe.name))
    }
}
