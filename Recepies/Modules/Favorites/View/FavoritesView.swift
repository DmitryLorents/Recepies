// FavoritesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Favorites view
protocol FavoritesViewProtocol: AnyObject {
    /// View's presenter
    var presenter: FavoritesPresenterProtocol? { get }
    /// Reload tableView
    func updateTableView()
}

/// Screen to show and delete favorites recipes
final class FavoritesView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let title = "Favorites"
    }

    // MARK: - Visual components

    private let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.title
        label.font = .makeVerdanaBold(size: 28)
        return label
    }()

    private lazy var recipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 114
        tableView.register(CategoryViewCell.self, forCellReuseIdentifier: CategoryViewCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()

    // MARK: - Public Properties

    var presenter: FavoritesPresenterProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }

    // MARK: - Private Methods

    private func setupVIew() {
        view.backgroundColor = .systemBackground
        view.addSubviews(mainTitleLabel, recipesTableView)
        view.disableTARMIC()
        setupConstraints()
    }
}

// MARK: - FavoritesView - FavoritesViewProtocol

extension FavoritesView: FavoritesViewProtocol {
    func updateTableView() {
        recipesTableView.reloadData()
    }
}

// MARK: - Constraints

private extension FavoritesView {
    func setupConstraints() {
        setupTitleLabelConstraints()
        setupRecipesTableViewConstraints()
    }

    func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            mainTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }

    func setupRecipesTableViewConstraints() {
        NSLayoutConstraint.activate([
            recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            recipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            recipesTableView.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 15),
            recipesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - FavoritesView - UITableViewDelegate

extension FavoritesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            presenter?.removeRecipe(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - FavoritesView - UITableViewDataSource

extension FavoritesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.recipes?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryViewCell.reuseID, for: indexPath) as? CategoryViewCell
        else { return .init() }
        let recipe = presenter?.recipes?[indexPath.row]
        cell.setupCell(with: recipe)
        return cell
    }
}
