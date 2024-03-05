// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Categories of product to show by view
    var category: Category? { get }
    /// Main initializer
    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category)
    /// Asking presenter to set delegate and dataSource for TableView
    func goBack()
    /// Shows detailed recipe screen
    func showDetailedScreen(for indexPath: IndexPath)
    /// Функция поиска нужного лемента
    func filterCategory(text: String)
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Public Properties

    var category: Category?

    // MARK: - Private Properties

    private var conteinerCategory: Category?

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?

    // MARK: - Initialization

    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
        conteinerCategory = category
    }

    // MARK: - Public Methods

    func filterCategory(text: String) {
        if text.count < 3 {
            category = conteinerCategory
            view?.updateTableView()
        } else {
            guard let categorySearch = category else { return }
            let searchingRecipe = categorySearch.recipes.filter { $0.name.lowercased().contains(text.lowercased()) }
            category?.recipes = searchingRecipe
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
}
