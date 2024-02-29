// CategoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorisation view
protocol CategoryViewProtocol: AnyObject {
    /// View's presenter
    var presenter: CategoryPresenterProtocol? { get set }
    /// Setting category into view
    /// - Parameter category: producnt category
    func set(category: Category?)
}

/// View to show authorization screen
final class CategoryView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let caloriesButtonTitle = "Calories"
        static let timeButtonTitle = "Time"
    }

    // MARK: - Visual components

    private lazy var recipesTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 114
        tableView.register(CategoryViewCell.self, forCellReuseIdentifier: CategoryViewCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    private lazy var caloriesButton: UIButton = makeSortingButton(
        title: Constants.caloriesButtonTitle,
        action: #selector(caloriesButtonAction)
    )
    private lazy var timeButton: UIButton = makeSortingButton(
        title: Constants.timeButtonTitle,
        action: #selector(timeButtonAction)
    )

    // MARK: - Public Properties

    var presenter: CategoryPresenterProtocol?

    // MARK: - Private Properties

    private var category: Category? {
        didSet {
            if let category {
                setSubViews(with: category)
            }
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.askForCategory()
        setupVIew()
    }

    // MARK: - Private Methods

    private func setupVIew() {
        view.addSubviews(
            recipesTableView,
            timeButton,
            caloriesButton
        )
        view.disableTARMIC()
        setupConstraints()
    }

    private func setSubViews(with: Category) {
        recipesTableView.reloadData()
    }

    private func makeSortingButton(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .cellBackground
        button.titleLabel?.font = UIFont.makeVerdanaRegular(size: 14)
        button.setTitle(title, for: .normal)
        button.setImage(.up, for: .normal)
        button.layer.cornerRadius = 18
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc private func caloriesButtonAction() {
        print(#function)
    }

    @objc private func timeButtonAction() {
        print(#function)
    }
}

// MARK: - AuthView - CategoryViewProtocol

extension CategoryView: CategoryViewProtocol {
    func set(category: Category?) {
        self.category = category
    }
}

// MARK: - Constraints

private extension CategoryView {
    func setupConstraints() {
        setupRecipesTableViewConstraints()
        setupCaloriesButtonConstraints()
        setupTimeButtonConstraints()
    }

    func setupRecipesTableViewConstraints() {
        NSLayoutConstraint.activate([
            recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipesTableView.topAnchor.constraint(equalTo: caloriesButton.bottomAnchor, constant: 13),
            recipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupCaloriesButtonConstraints() {
        NSLayoutConstraint.activate([
            caloriesButton.leadingAnchor.constraint(equalTo: recipesTableView.leadingAnchor),
            caloriesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 152),
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
}

// MARK: - CategoryView - UITableViewDelegate

extension CategoryView: UITableViewDelegate {}

// MARK: - CategoryView - UITableViewDataSource

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category?.recepies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryViewCell.reuseID, for: indexPath) as? CategoryViewCell
        else { return .init() }
        let recipe = category?.recepies[indexPath.row]
        cell.setupCell(with: recipe)
        return cell
    }
}
