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
        static let caloriesButtonTitle = "Calories"
        static let timeButtonTitle = "Time"
        static let searchPlaceholder = "Search recipes"
    }

    // MARK: - Visual components

    private lazy var caloriesButton: UIButton = makeSortingButton(
        title: Constants.caloriesButtonTitle,
        action: #selector(caloriesButtonAction(_:))
    )
    private lazy var timeButton: UIButton = makeSortingButton(
        title: Constants.timeButtonTitle,
        action: #selector(timeButtonAction(_:))
    )

    private let recipeSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.searchPlaceholder
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.backgroundColor = .searchBackground
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()

    private lazy var recipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
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
        view.addSubviews(
            recipesTableView,
            timeButton,
            caloriesButton,
            recipeSearchBar
        )
        view.disableTARMIC()
        setNavigationItem()
        setupConstraints()
    }

    private func setNavigationItem() {
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        backButton.setImage(.arrowLeft, for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)

        let titleLabel = UILabel()
        titleLabel.text = presenter?.recipes?.name
        titleLabel.font = .makeVerdanaBold(size: 28)
        titleLabel.textAlignment = .left

        let leftBarView = UIView()
        leftBarView.addSubviews(backButton, titleLabel)
        leftBarView.disableTARMIC()

        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leftBarView.leadingAnchor),
            backButton.centerYAnchor.constraint(equalTo: leftBarView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: leftBarView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: leftBarView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: leftBarView.trailingAnchor),
            leftBarView.heightAnchor.constraint(equalToConstant: 30)
        ])

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarView)
    }

    private func makeSortingButton(title: String, action: Selector) -> UIButton {
        let button = SortingButton(title: title, height: 36)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc private func caloriesButtonAction(_ sender: UIButton) {
        print(#function)
    }

    @objc private func timeButtonAction(_ sender: UIButton) {
        print(#function)
    }

    @objc private func backButtonAction() {
        presenter?.goBack()
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
        recipeSearchBarConstraints()
        setupRecipesTableViewConstraints()
        setupCaloriesButtonConstraints()
        setupTimeButtonConstraints()
    }

    func recipeSearchBarConstraints() {
        NSLayoutConstraint.activate([
            recipeSearchBar.leadingAnchor.constraint(equalTo: recipesTableView.leadingAnchor, constant: -8),
            recipeSearchBar.trailingAnchor.constraint(equalTo: recipesTableView.trailingAnchor, constant: 8),
            recipeSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
        ])
    }

    func setupCaloriesButtonConstraints() {
        NSLayoutConstraint.activate([
            caloriesButton.leadingAnchor.constraint(equalTo: recipesTableView.leadingAnchor),
            caloriesButton.topAnchor.constraint(equalTo: recipeSearchBar.bottomAnchor, constant: 20),
            caloriesButton.heightAnchor.constraint(equalToConstant: 36),
        ])
    }

    func setupTimeButtonConstraints() {
        NSLayoutConstraint.activate([
            timeButton.leadingAnchor.constraint(equalTo: caloriesButton.trailingAnchor, constant: 11),
            timeButton.topAnchor.constraint(equalTo: caloriesButton.topAnchor),
            timeButton.heightAnchor.constraint(equalTo: caloriesButton.heightAnchor),
        ])
    }

    func setupRecipesTableViewConstraints() {
        NSLayoutConstraint.activate([
            recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipesTableView.topAnchor.constraint(equalTo: caloriesButton.bottomAnchor, constant: 13),
            recipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

// MARK: - FavoritesView - UITableViewDelegate

extension FavoritesView: UITableViewDelegate {}

// MARK: - FavoritesView - UITableViewDataSource

extension FavoritesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.recipes?.recipes.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryViewCell.reuseID, for: indexPath) as? CategoryViewCell
        else { return .init() }
        let recipe = presenter?.recipes?.recipes[indexPath.row]
        cell.setupCell(with: recipe)
        return cell
    }
}
