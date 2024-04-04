// PartnersView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for Partners view
protocol PartnersViewProtocol: AnyObject {
    /// View's presenter
    var presenter: PartnersPresenterProtocol? { get set }
//    /// Notify user if email format is incorrect
//    /// - Parameter decision: defines necessity to notify the user
//    func showIncorrectEmailFormat(_ decision: Bool)
//    /// Notify user if password format is incorrect
//    /// - Parameter decision: defines necessity to notify the user
//    func showIncorrectPasswordFormat(_ decision: Bool)
//    /// Notify user if email or password are not valid
//    /// - Parameter decision: defines necessity to notify the user
//    func showIncorrectUserData(_ decision: Bool)
//    /// Set password textField in secure/nonsecure mode
//    /// - Parameter decision: defines necessity to set secure
//    func setPasswordSecured(isSecured: Bool)
}

/// View to show authorization screen
final class PartnersView: UIViewController {
    // MARK: - Constants

    private enum Constants {
//        static let loginLabelTitle = "Login"
//        static let emailLabelTitle = "Email Adress"
//        static let emailPlaceholder = "Enter Email Address"
//        static let passwordLabelTitle = "Password"
//        static let passwordPlaceholder = "Enter Password"
//        static let loginButtonTitle = "Login"
//        static let warningLabelText = "Please check the accuracy of the entered credentials."
//        static let emailWarningText = "Incorrect format"
//        static let passwordWarningText = "You entered the wrong password"
//        static let defaultLoginButtonBottomConstraintValue = -37.0
    }

    // MARK: - Visual components

//    private lazy var gradientLayer: CAGradientLayer = {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        gradientLayer.colors = [UIColor.white.cgColor, UIColor.gradientBackground.cgColor]
//        return gradientLayer
//    }()
//
//    private let loginLabel: UILabel = {
//        let label = UILabel()
//        label.text = Local.AuthScreen.LoginLabel.title // Constants.loginLabelTitle
//        label.font = .makeVerdanaBold(size: 28)
//        label.textColor = .darkGrayApp
//        return label
//    }()
//
//    private let emailLabel: UILabel = {
//        let label = UILabel()
//        label.text = Constants.emailLabelTitle
//        label.font = .makeVerdanaBold(size: 18)
//        label.textColor = .darkGrayApp
//        return label
//    }()
//
//    private let passwordLabel: UILabel = {
//        let label = UILabel()
//        label.text = Constants.passwordLabelTitle
//        label.font = .makeVerdanaBold(size: 18)
//        label.textColor = .darkGrayApp
//        return label
//    }()
//
//    private lazy var emailTextField: UITextField = {
//        let textField = createTextField()
//        textField.placeholder = Constants.emailPlaceholder
//        textField.keyboardType = .emailAddress
//        textField.clearButtonMode = .whileEditing
//        textField.leftView = makeLeftView(emailImageView)
//        textField.leftViewMode = .always
//        return textField
//    }()
//
//    private lazy var passwordTextField: UITextField = {
//        let textField = createTextField()
//        textField.placeholder = Constants.passwordPlaceholder
//        textField.rightView = makeRightView(secureImageView)
//        textField.rightViewMode = .always
//        textField.leftView = makeLeftView(lockImageView)
//        textField.leftViewMode = .always
//        textField.isSecureTextEntry = true
//        return textField
//    }()
//
//    private lazy var secureImageView: UIImageView = {
//        let view = makeSubImageView(image: .eyeClose)
//        view.isUserInteractionEnabled = true
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(securePasswordButtonAction))
//        view.addGestureRecognizer(tapGesture)
//        return view
//    }()
//
//    private lazy var emailImageView = makeSubImageView(image: .email)
//    private lazy var lockImageView = makeSubImageView(image: .lock)
//
//    private lazy var loginButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .black
//        button.layer.cornerRadius = 12
//        button.setTitle(Constants.loginButtonTitle, for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .makeVerdanaRegular(size: 16)
//        button.addTarget(nil, action: #selector(loginButtonAction), for: .touchUpInside)
//        button.addSubview(activityIndicatorView)
//        button.disableTARMIC()
//        return button
//    }()
//
//    private let warningLabel: UILabel = {
//        let label = UILabel()
//        label.backgroundColor = .redWarning
//        label.layer.cornerRadius = 12
//        label.clipsToBounds = true
//        label.font = .makeVerdanaRegular(size: 18)
//        label.textColor = .systemBackground
//        label.text = Constants.warningLabelText
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.alpha = 0
//        return label
//    }()
//
//    private lazy var emailWarningLabel = makeAdviceRedLabel(title: Constants.emailWarningText)
//    private lazy var passwordWarningLabel = makeAdviceRedLabel(title: Constants.passwordWarningText)
//    private let activityIndicatorView: UIActivityIndicatorView = {
//        let view = UIActivityIndicatorView()
//        view.hidesWhenStopped = true
//        view.color = .white
//        return view
//    }()

    // MARK: - Public Properties

    var presenter: PartnersPresenterProtocol?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: - Private Methods

    private func setupVIew() {
//        view.layer.addSublayer(gradientLayer)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resignTextFields))
//        view.addGestureRecognizer(tapGesture)
//        view.addSubviews(
//            loginLabel,
//            emailLabel,
//            emailTextField,
//            passwordLabel,
//            passwordTextField,
//            loginButton,
//            warningLabel,
//            emailWarningLabel,
//            passwordWarningLabel
//        )
        view.disableTARMIC()
        setupConstraints()
    }
}

// MARK: - AuthView - AuthViewProtocol

extension PartnersView: PartnersViewProtocol {}

// MARK: - Constraints

private extension PartnersView {
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
