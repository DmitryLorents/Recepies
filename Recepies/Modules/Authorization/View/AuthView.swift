// AuthView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Authorisation view
protocol AuthViewProtocol: AnyObject {
    func badUserData()
}

/// View to show authorization screen
final class AuthView: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let loginLabelTitle = "Login"
        static let emailLabelTitle = "Email Adress"
        static let emailPlaceholder = "Enter Email Address"
        static let passwordLabelTitle = "Password"
        static let passwordPlaceholder = "Enter Password"
        static let loginButtonTitle = "Login"
    }

    // MARK: - Public Properties

    var presenter: AuthPresenterProtocol?

    // MARK: - Visual components

    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.gradientBackground.cgColor]
        return gradientLayer
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.loginLabelTitle
        label.font = .makeVerdanaBold(size: 28)
        label.textColor = .darkGrayApp
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.emailLabelTitle
        label.font = .makeVerdanaBold(size: 18)
        label.textColor = .darkGrayApp
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.passwordLabelTitle
        label.font = .makeVerdanaBold(size: 18)
        label.textColor = .darkGrayApp
        return label
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.emailPlaceholder
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        textField.font = .makeVerdanaRegular(size: 18)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.passwordPlaceholder
        textField.borderStyle = .roundedRect
        textField.font = .makeVerdanaRegular(size: 18)
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(size: 16)
        button.addTarget(nil, action: #selector(loginButtonAction), for: .touchUpInside)
//        button.isEnabled = false
//        button.alpha = 0.5
        return button
    }()

    private lazy var secureImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 352, y: 423, width: 22, height: 19))
        imageView.image = UIImage(systemName: "eye.slash")
        imageView.tintColor = .gray
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Private Methods

    private func setupVIew() {
        view.layer.addSublayer(gradientLayer)
        view.addSubviews(loginLabel, emailLabel, emailTextField, passwordLabel, passwordTextField)
        view.disableTARMIC()
        setupConstraints()
    }

    @objc func loginButtonAction() {
        // TODO: Set correct data
        presenter?.tryLogin(email: "", password: "")
    }
}

extension AuthView: AuthViewProtocol {
    func badUserData() {
        // show some warning
    }
}

private extension AuthView {
    func setupConstraints() {
        setupLoginLabelConstraints()
        setupEmailLabelConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordLabelConstraints()
        setupPasswordTextFieldConstraints()
    }

    func setupLoginLabelConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(
                equalToSystemSpacingAfter: view.layoutMarginsGuide.leadingAnchor,
                multiplier: 1
            ),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 82),
        ])
    }

    func setupEmailLabelConstraints() {
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 23),
        ])
    }

    func setupEmailTextFieldConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 6),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupPasswordLabelConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 23),
        ])
    }

    func setupPasswordTextFieldConstraints() {
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 7),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
