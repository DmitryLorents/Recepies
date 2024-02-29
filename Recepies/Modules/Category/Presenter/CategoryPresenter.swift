// CategoryPresenter.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorization screen presenter
protocol CategoryPresenterProtocol: AnyObject {
    /// Main initializer
    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category)
    /// Asking presenter to set delegate and dataSource for TableView
    func askForCategory()
    /// move back in navigation flow
    func goBack()
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?
    private var category: Category?

    // MARK: - Initialization

    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
    }

    // MARK: - Public Methods

    func askForCategory() {
        view?.set(category: category)
    }

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }
}
