// CategoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Category view
protocol CategoryViewProtocol: AnyObject {
    /// Type of handler from sorting button
    typealias SortingRecipeHandler = (Recipe, Recipe) -> Bool
    /// State of category screen, changes view appearance
    var state: CategoryState { get }
    /// View's presenter
    var presenter: CategoryPresenterProtocol? { get }
    /// Reload tableView
    func updateTableView()
    /// Set sorting buttons state .none
    func clearSortingButtonState()
    /// Set new state to view
    func updateState(with state: CategoryState)
}

/// View to show screen with recipes
final class CategoryView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let caloriesButtonTitle = "Calories"
        static let timeButtonTitle = "Time"
        static let searchPlaceholder = "Search recipes"
    }

    // MARK: - Visual components

    private lazy var caloriesButton: SortingButton = makeSortingButton(
        title: Constants.caloriesButtonTitle,
        action: #selector(sortingButtonPressed)
    )
    private lazy var timeButton: SortingButton = makeSortingButton(
        title: Constants.timeButtonTitle,
        action: #selector(sortingButtonPressed)
    )

    private lazy var recipeSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.searchPlaceholder
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 10
        searchBar.searchTextField.backgroundColor = .searchBackground
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
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

    var presenter: CategoryPresenterProtocol?
    var state: CategoryState = .initial {
        didSet {
            updateViewAppearance(for: state)
        }
    }

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
        titleLabel.text = presenter?.dataSource?.name
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

    private func makeSortingButton(title: String, action: Selector) -> SortingButton {
        let button = SortingButton(title: title, height: 36)
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    private func updateViewAppearance(for state: CategoryState) {
        recipesTableView.reloadData()
        let cells = recipesTableView.visibleCells as? [CategoryViewCell]
        switch state {
        case .loading:
            cells?.forEach { $0.startCellShimmerAnimation() }
        case .loaded, .error:
            cells?.forEach { $0.stopCellShimmerAnimation() }
            recipesTableView.reloadData()
        default:
            break
        }
    }

    @objc private func backButtonAction() {
        presenter?.goBack()
    }

    @objc func sortingButtonPressed() {
        let caloriesSortingHandler: SortingRecipeHandler?
        let timeSortingHandler: SortingRecipeHandler?

        if let caloriesButtonPredicate = caloriesButton.getSortingPredicate() {
            caloriesSortingHandler = { lhsRecipe, rhsRecipe in
                caloriesButtonPredicate(lhsRecipe.calories, rhsRecipe.calories)
            }
        } else { caloriesSortingHandler = nil }

        if let timePredicate = timeButton.getSortingPredicate() {
            timeSortingHandler = { lhsRecipe, rhsRecipe in
                timePredicate(lhsRecipe.timeToCook, rhsRecipe.timeToCook)
            }
        } else { timeSortingHandler = nil }

        presenter?.sortRecipesBy(caloriesSortingHandler, timeSortingHandler)
    }
}

// MARK: - CategoryView + UISearchBarDelegate

extension CategoryView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.filterCategory(text: searchText)
    }
}

// MARK: - AuthView - CategoryViewProtocol

extension CategoryView: CategoryViewProtocol {
    func clearSortingButtonState() {
        caloriesButton.sortingState = .none
        timeButton.sortingState = .none
    }

    func updateTableView() {
        recipesTableView.reloadData()
    }

    func updateState(with state: CategoryState) {
        self.state = state
    }
}

// MARK: - Constraints

private extension CategoryView {
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

// MARK: - CategoryView - UITableViewDelegate

extension CategoryView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showDetailedScreen(for: indexPath)
    }
}

// MARK: - CategoryView - UITableViewDataSource

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case .initial:
            return 0
        case .loading:
            return 10
        default:
            return presenter?.dataSource?.recipes.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryViewCell.reuseID, for: indexPath) as? CategoryViewCell
        else { return .init() }
        let recipe = presenter?.dataSource?.recipes[indexPath.row]
        cell.setupCell(with: recipe)
        return cell
    }
}
