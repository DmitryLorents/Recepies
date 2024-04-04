// PartnersView.swift
// Copyright © RoadMap. All rights reserved.

import GoogleMaps
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
        static let title = "Our Partners"
        static let okButtonTitle = "Ok"
        static let offerLabelText = "You can get gifts and discounts from our partners"
    }
    
    // MARK: - Visual components
    
    private lazy var okButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(Constants.okButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .makeVerdanaRegular(size: 16)
        button.addTarget(nil, action: #selector(okButtonAction), for: .touchUpInside)
        return button
    }()
    
    private let offerLabel: UILabel = {
        let label = UILabel()
        label.font = .makeVerdanaRegular(size: 18)
        label.text = Constants.offerLabelText
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let stubView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    
    // MARK: - Public Properties
    
    var presenter: PartnersPresenterProtocol?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVIew()
    }
    
    // MARK: - Private Methods
    
    private func setupVIew() {
        view.backgroundColor = .systemBackground
        title = Constants.title
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
    
    @objc private func okButtonAction() {
        print(#function)
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
