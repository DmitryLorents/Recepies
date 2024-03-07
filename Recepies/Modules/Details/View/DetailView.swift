// DetailView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for detail screen
protocol DetailViewProtocol: AnyObject {
    /// Change button color
    func setButtonColor()
}

/// Screen with detailed information about the cell
final class DetailView: UIViewController {
    // MARK: - Types

    /// Types of cells
    enum CellTypesDetail {
        /// Cell with title and picture
        case title
        /// Cell with characteristics
        case characteristics
        /// Box with a full description of the recipe
        case fullDescription
    }

    // MARK: - Visual Components

    private let tableView = UITableView()
    private let addFavoritesButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

    // MARK: - Public Properties

    var presenter: DetailPresenter?

    // MARK: - Private Properties

    private let cellTypes: [CellTypesDetail] = [.title, .characteristics, .fullDescription]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setLeftNavigationItem()
        setRightNavigationItem()
        configureTableView()
    }

    // MARK: - Private Methods

    private func configureView() {
        view.backgroundColor = .white
    }

    private func setLeftNavigationItem() {
        let backButton = UIBarButtonItem(
            image: .arrowLeft,
            style: .plain,
            target: self,
            action: #selector(backButtonAction)
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }

    private func setRightNavigationItem() {
        addFavoritesButton.setImage(.favorites, for: .normal)
        addFavoritesButton.addTarget(self, action: #selector(addFavoritesRecipe), for: .touchUpInside)

        let shareButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        shareButton.setImage(.send, for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)

        let rightBarView = UIView()
        rightBarView.addSubviews(shareButton, addFavoritesButton)
        rightBarView.disableTARMIC()

        NSLayoutConstraint.activate([
            addFavoritesButton.trailingAnchor.constraint(equalTo: rightBarView.trailingAnchor),
            addFavoritesButton.centerYAnchor.constraint(equalTo: rightBarView.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: addFavoritesButton.leadingAnchor, constant: -8),
            shareButton.centerYAnchor.constraint(equalTo: rightBarView.centerYAnchor),
            rightBarView.heightAnchor.constraint(equalToConstant: 30),
            rightBarView.widthAnchor.constraint(equalToConstant: 70)
        ])

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarView)
    }

    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseID)
        tableView.register(
            FullDescriptionTableViewCell.self,
            forCellReuseIdentifier: FullDescriptionTableViewCell.reuseID
        )
        tableView.register(PFCViewCell.self, forCellReuseIdentifier: PFCViewCell.reuseID)
        setConstraint()
    }

    private func setConstraint() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    @objc private func addFavoritesRecipe() {
        presenter?.addRecipeToFavorites()
    }

    @objc private func backButtonAction() {
        presenter?.goBack()
    }

    @objc private func shareButtonAction() {
        presenter?.shareRecipe()
    }
}

// MARK: - DetailView + UITableViewDataSource

extension DetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cellTypes[indexPath.row]
        switch item {
        case .title:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TitleTableViewCell.reuseID,
                for: indexPath
            ) as? TitleTableViewCell else { return UITableViewCell() }
            guard let recipe = presenter?.recipe else { return cell }
            cell.setupView(recipe: recipe)
            return cell
        case .characteristics:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PFCViewCell.reuseID, for: indexPath) as? PFCViewCell
            else { return UITableViewCell() }
            guard let recipe = presenter?.recipe else { return cell }
            cell.setupCell(with: recipe)
            return cell
        case .fullDescription:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: FullDescriptionTableViewCell.reuseID,
                    for: indexPath
                ) as? FullDescriptionTableViewCell
            else { return UITableViewCell() }
            guard let recipe = presenter?.recipe else { return cell }
            cell.setupCell(recipe: recipe)
            return cell
        }
    }
}

// MARK: - DetailView + DetailViewProtocol

extension DetailView: DetailViewProtocol {
    func setButtonColor() {
        addFavoritesButton.setImage(.favoritesHig, for: .normal)
    }
}
