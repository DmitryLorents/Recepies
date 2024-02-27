// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// class viewcontroller
class ProfileView: UIViewController {
    // MARK: - Types

    private enum CellTypes {
        case profile
        case options
    }

    // MARK: - Constants

    private enum Constants {
        static let mainTableViewCellIdentifier = "MainTableViewCell"
        static let otherTableViewCellIdentifier = "OtherTableViewCell"
        static let editNameTitle = "Change your name and surname"
        static let cancelActionTitle = "Cancel"
        static let conformActionTitle = "OK"
        static let textFieldPlaceholder = "Name Surname"
    }

    // MARK: - Public Properties

    var profilePresenter: ProfilePresenter?

    // MARK: - Private Properties

    private var tableView = UITableView()
    private let content: [CellTypes] = [.profile, .options]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        view.backgroundColor = .white
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func configureTable() {
        let nameLabel = UIBarButtonItem(title: "mary_rmLink", style: .done, target: nil, action: nil)
        nameLabel.tintColor = .black
        nameLabel.setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name: "Verdana-Bold", size: 18) ?? UIFont.systemFont(ofSize: 6)],
            for: .normal
        )
        navigationItem.leftBarButtonItem = nameLabel
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.mainTableViewCellIdentifier)
        tableView.register(OtherTableViewCell.self, forCellReuseIdentifier: Constants.otherTableViewCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ProfileView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        content.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countRow = content[section]
        switch countRow {
        case .profile:
            return 1
        case .options:
            return profilePresenter?.options.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = content[indexPath.section]
        switch items {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.mainTableViewCellIdentifier, for: indexPath
            )
                as? MainTableViewCell else { return UITableViewCell() }
            guard let profile = profilePresenter?.profileUser else { return UITableViewCell() }
            cell.setupCell(profile: profile)
            cell.editName = { [weak self] in
                self?.profilePresenter?.setupAlert()
            }

            return cell
        case .options:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier:
                Constants.otherTableViewCellIdentifier,
                for: indexPath
            ) as? OtherTableViewCell
            else { return UITableViewCell() }
            guard let options = profilePresenter?.options else { return UITableViewCell() }
            cell.accessoryType = .detailButton
            cell.setupCell(options: options[indexPath.row])
            return cell
        }
    }
}

// MARK: - ProfileViewController + ProfileViewProtocol

extension ProfileView: ProfileViewProtocol {
    func showEditNameAlert() {
        let alert = UIAlertController(title: Constants.editNameTitle, message: nil, preferredStyle: .alert)
        let conformAction = UIAlertAction(title: Constants.conformActionTitle, style: .default) { _ in
            if let text = alert.textFields?[0] {
                self.profilePresenter?.profileUser.userName = text.text ?? Constants.textFieldPlaceholder
                self.tableView.reloadData()
            }
        }
        let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .default)
        alert.addTextField { textField in
            textField.placeholder = Constants.textFieldPlaceholder
        }

        alert.addAction(conformAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}
