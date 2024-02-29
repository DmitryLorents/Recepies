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
        static let loginLabelTitle = "Login"
        static let emailLabelTitle = "Email Adress"
        static let emailPlaceholder = "Enter Email Address"
        static let passwordLabelTitle = "Password"
        static let passwordPlaceholder = "Enter Password"
        static let loginButtonTitle = "Login"
        static let warningLabelText = "Please check the accuracy of the entered credentials."
        static let emailWarningText = "Incorrect format"
        static let passwordWarningText = "You entered the wrong password"
        static let defaultLoginButtonBottomConstraintValue = -37.0
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
            recipesTableView
        )
        view.disableTARMIC()
        setupConstraints()
    }

    func setSubViews(with: Category) {
        recipesTableView.reloadData()
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
//        setupEmailLabelConstraints()
//        setupEmailTextFieldConstraints()
//        setupPasswordLabelConstraints()
//        setupPasswordTextFieldConstraints()
//        setupLoginButtonConstraints()
//        setupWarningLabelConstraints()
//        setupEmailWarningLabelConstraints()
//        setupPasswordWarningLabelConstraints()
//        setupActivityIndicatorConstraints()
    }

    func setupRecipesTableViewConstraints() {
        NSLayoutConstraint.activate([
            recipesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recipesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            recipesTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            recipesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
//
//    func setupEmailLabelConstraints() {
//        NSLayoutConstraint.activate([
//            emailLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 23),
//        ])
//    }
//
//    func setupEmailTextFieldConstraints() {
//        NSLayoutConstraint.activate([
//            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
//            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//
//    func setupPasswordLabelConstraints() {
//        NSLayoutConstraint.activate([
//            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 23),
//        ])
//    }
//
//    func setupPasswordTextFieldConstraints() {
//        NSLayoutConstraint.activate([
//            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 7),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
//
//    func setupLoginButtonConstraints() {
//        loginButtonBottomConstraint = loginButton.bottomAnchor.constraint(
//            equalTo: view.safeAreaLayoutGuide.bottomAnchor,
//            constant: Constants.defaultLoginButtonBottomConstraintValue
//        )
//        loginButtonBottomConstraint?.isActive = true
//
//        NSLayoutConstraint.activate([
//            loginButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
//            loginButton.heightAnchor.constraint(equalToConstant: 48)
//        ])
//    }
//
//    func setupWarningLabelConstraints() {
//        NSLayoutConstraint.activate([
//            warningLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
//            warningLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
//            warningLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -49),
//            warningLabel.heightAnchor.constraint(equalToConstant: 87)
//        ])
//    }
//
//    func setupEmailWarningLabelConstraints() {
//        NSLayoutConstraint.activate([
//            emailWarningLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            emailWarningLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
//        ])
//    }
//
//    func setupPasswordWarningLabelConstraints() {
//        NSLayoutConstraint.activate([
//            passwordWarningLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
//            passwordWarningLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
//        ])
//    }
//
//    func setupActivityIndicatorConstraints() {
//        NSLayoutConstraint.activate([
//            activityIndicatorView.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
//            activityIndicatorView.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor),
//        ])
//    }
}

// MARK: - CategoryView - UITableViewDelegate

extension CategoryView: UITableViewDelegate {}

// MARK: - CategoryView - UITableViewDataSource

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category?.recipes.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryViewCell.reuseID, for: indexPath) as? CategoryViewCell
        else { return .init() }
        let recipe = category?.recipes[indexPath.row]
        cell.setupCell(with: recipe)
        return cell
    }
}
