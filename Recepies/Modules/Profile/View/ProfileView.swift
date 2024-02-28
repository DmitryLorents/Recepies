// ProfileView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfileView: UIViewController {
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
        static let showLogOutTitle = "Are you sure you want to log out?"
        static let cancelActionTitle = "Cancel"
        static let conformActionTitle = "OK"
        static let yesActionTitle = "Yes"
        static let textFieldPlaceholder = "Name Surname"
        static let titleLabel = "Profile"
        static let veradanaBoldFont = "Verdana-Bold"
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
        setupNavBar()
    }

    // MARK: - Private Methods

    private func setupNavBar() {
        let nameLabel = UIBarButtonItem(title: Constants.titleLabel, style: .plain, target: nil, action: nil)
        nameLabel.tintColor = .black
        nameLabel.setTitleTextAttributes(
            [
                NSAttributedString.Key.font: UIFont(name: Constants.veradanaBoldFont, size: 28) ?? UIFont
                    .systemFont(ofSize: 6)
            ],
            for: .normal
        )
        navigationItem.leftBarButtonItem = nameLabel
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: Constants.mainTableViewCellIdentifier)
        tableView.register(OtherTableViewCell.self, forCellReuseIdentifier: Constants.otherTableViewCellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setConstarint()
    }

    private func setConstarint() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.backgroundColor = .white
    }
}

// MARK: - ProfileView + UITableViewDataSource

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
            cell.editNameHandler = { [weak self] in
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
            cell.accessoryType = .disclosureIndicator
            cell.setupCell(options: options[indexPath.row])
            return cell
        }
    }
}

// MARK: - ProfileView + UITableViewDelegate

extension ProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let items = content[indexPath.section]
        switch items {
        case .profile: break
        case .options:
            profilePresenter?.didSetectItem(index: indexPath.row)
        }
    }
}

// MARK: - ProfileView + ProfileViewProtocol

extension ProfileView: ProfileViewProtocol {
    func openBunusView() {
        let bonusPresenter = BonusPresenter()
        let bonusViewController = BonusViewController()
        if let sheet = bonusViewController.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 30
        }
        bonusViewController.bonusPresenter = bonusPresenter
        bonusPresenter.view = bonusViewController
        present(bonusViewController, animated: true)
    }

    func showLogOutAlert() {
        let alert = UIAlertController(title: Constants.showLogOutTitle, message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction(title: Constants.yesActionTitle, style: .default) { [weak self] _ in
            self?.profilePresenter?.logOutProfile()
        }
        let cancelAction = UIAlertAction(title: Constants.cancelActionTitle, style: .default)
        alert.addAction(yesAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

    func showEditNameAlert() {
        let alert = UIAlertController(title: Constants.editNameTitle, message: nil, preferredStyle: .alert)
        let conformAction = UIAlertAction(title: Constants.conformActionTitle, style: .default) { [weak self] _ in
            if let text = alert.textFields?[0] {
                self?.profilePresenter?.setTitleNameUser(name: text.text ?? "")
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

    func reloadData() {
        tableView.reloadData()
    }
}
