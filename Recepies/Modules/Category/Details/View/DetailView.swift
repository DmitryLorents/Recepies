// DetailView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class DetailView: UIViewController {
    
    // MARK: - Types
    /// Разновидности ячеек
    enum CellTypesDetail {
        /// Ячейка с тайтлом и картинкой
        case title
        /// Ячейка с характеристиками
        case characteristics
        /// Ячека с полным описанием рецепта
        case fullDescription
    }
    // MARK: - Visual Components
    private let tableView = UITableView()
    // MARK: - Public Properties
    var presenter: DetailPresenter?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Private Methods
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
    }
}

extension DetailView: DetailViewProtocol {

}
