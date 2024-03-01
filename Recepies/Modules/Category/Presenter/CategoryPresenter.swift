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
}

final class CategoryPresenter: CategoryPresenterProtocol {
    // MARK: - Public Properties

    var category: Category?

    // MARK: - Private Properties

    private weak var coordinator: BaseModuleCoordinator?
    private weak var view: CategoryViewProtocol?

    // MARK: - Initialization

    init(view: CategoryViewProtocol, coordinator: BaseModuleCoordinator, category: Category) {
        self.view = view
        self.coordinator = coordinator
        self.category = category
    }

    // MARK: - Public Methods

    func goBack() {
        if let recipesCoordinator = coordinator as? RecipesCoordinator {
            recipesCoordinator.goBack()
        }
    }
}
