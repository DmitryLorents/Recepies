// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Parts presenter protocol
protocol DetailPresenterProtocol: AnyObject {
    /// Protocol initialization
    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe, database: DataBaseProtocol)
    /// Recipe data
    var recipe: Recipe { get }
    /// Return to previous controller
    func goBack()
    /// Add/remove recipe to favorites
    func updateRecipeFavoriteStatus()
    /// shares recipe into Telegram
    func shareRecipe()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipe: Recipe
    var isFavorite: Bool {
        database.isFavorite(recipe)
    }

    // MARK: - Private Properties

    private weak var view: DetailViewProtocol?
    private weak var coordinator: BaseModuleCoordinator?
    private var database: DataBaseProtocol

    // MARK: - Initializers

    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe, database: DataBaseProtocol) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
        self.database = database
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
        // some code to share recipe into Telegram
        log(.shareRecipe(recipeName: recipe.name))
    }
}
