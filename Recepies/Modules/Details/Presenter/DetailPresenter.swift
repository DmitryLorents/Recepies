// DetailPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Parts presenter protocol
protocol DetailPresenterProtocol: AnyObject {
    /// Protocol initialization
    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe)
    /// Recipe data
    var recipe: Recipe? { get }
    /// Return to previous controller
    func goBack()
    /// Add recipe to favorites
    func addRecipeToFavorites()
    /// shares recipe into Telegram
    func shareRecipe()
}

final class DetailPresenter: DetailPresenterProtocol {
    // MARK: - Public Properties

    var recipe: Recipe?

    // MARK: - Private Properties

    private weak var view: DetailViewProtocol?
    private weak var coordinator: BaseModuleCoordinator?

    // MARK: - Initializers

    init(view: DetailViewProtocol, coordinator: BaseModuleCoordinator, recipe: Recipe) {
        self.view = view
        self.coordinator = coordinator
        self.recipe = recipe
    }

    // MARK: - Public Methods

    func addRecipeToFavorites() {
        view?.setButtonColor()
    }

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }

    func shareRecipe() {
        // some code to share recipe into Telegram
        LoggerInvoker.shared.addLogCommand(.shareRecipe(recipeName: recipe?.name ?? "No name"))
    }
}
