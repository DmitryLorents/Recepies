// CategoryView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorisation view
protocol CategoryViewProtocol: AnyObject {
    /// View's presenter
    var presenter: AuthPresenterProtocol? { get set }
    /// Notify user if email format is incorrect
    /// - Parameter decision: defines necessity to notify the user
    func showIncorrectEmailFormat(_ decision: Bool)
    /// Notify user if password format is incorrect
    /// - Parameter decision: defines necessity to notify the user
    func showIncorrectPasswordFormat(_ decision: Bool)
    /// Notify user if email or password are not valid
    /// - Parameter decision: defines necessity to notify the user
    func showIncorrectUserData(_ decision: Bool)
    /// Set password textField in secure/nonsecure mode
    /// - Parameter decision: defines necessity to set secure
    func setPasswordSecured(isSecured: Bool)
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

    // MARK: - Public Properties

    var presenter: AuthPresenterProtocol?

    // MARK: - Private Properties

    var loginButtonBottomConstraint: NSLayoutConstraint?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }

    // MARK: - Private Methods

    private func setupVIew() {
        view.addSubviews(
        )
        view.disableTARMIC()
        setupConstraints()
    }
}

// MARK: - AuthView - CategoryViewProtocol

// extension CategoryView: CategoryViewProtocol {
//
// }

// MARK: - Constraints

private extension CategoryView {
    func setupConstraints() {
//        setupLoginLabelConstraints()
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

//    func setupLoginLabelConstraints() {
//        NSLayoutConstraint.activate([
//            loginLabel.leadingAnchor.constraint(
//                equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor,
//                multiplier: 1
//            ),
//            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
//        ])
//    }
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
