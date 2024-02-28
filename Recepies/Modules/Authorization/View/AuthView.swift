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

    private lazy var emailTextField: UITextField = {
        let textField = createTextField()
        textField.placeholder = Constants.emailPlaceholder
        textField.keyboardType = .emailAddress
        textField.clearButtonMode = .whileEditing
        textField.leftView = makeLeftView(emailImageView)
        textField.leftViewMode = .always
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = createTextField()
        textField.placeholder = Constants.passwordPlaceholder
        textField.rightView = makeRightView(secureImageView)
        textField.rightViewMode = .always
        textField.leftView = makeLeftView(lockImageView)
        textField.leftViewMode = .always
        return textField
    }()

    private lazy var secureImageView = makeSubImageView(image: .eyeClose)
    private lazy var emailImageView = makeSubImageView(image: .email)
    private lazy var lockImageView = makeSubImageView(image: .lock)

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(Constants.loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(size: 16)
        button.addTarget(nil, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
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
        view.addSubviews(loginLabel, emailLabel, emailTextField, passwordLabel, passwordTextField, loginButton)
        view.disableTARMIC()
        setupConstraints()
    }

    private func createTextField() -> UITextField {
        let textField = UITextField()
        textField.placeholder = Constants.passwordPlaceholder
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.backgroundColor = .systemBackground
        textField.font = .makeVerdanaRegular(size: 18)
        return textField
    }

    private func makeRightView(_ view: UIView) -> UIView {
        let rightView = UIView()
        rightView.addSubview(view)
        rightView.disableTARMIC()
        view.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -14).isActive = true
        view.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 0).isActive = true
        view.centerYAnchor.constraint(equalTo: rightView.centerYAnchor).isActive = true
        return rightView
    }

    private func makeLeftView(_ view: UIView) -> UIView {
        let leftView = UIView()
        leftView.addSubview(view)
        leftView.disableTARMIC()
        view.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -13).isActive = true
        view.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 17).isActive = true
        view.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        return leftView
    }

    private func makeSubImageView(image: UIImage) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        imageView.contentMode = .center
        return imageView
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
        setupLoginButtonConstraints()
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

    func setupLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -37),
            loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
