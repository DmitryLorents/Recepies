// AuthView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol AuthViewProtocol: AnyObject {}

final class AuthView: UIViewController, AuthViewProtocol {
    var presenter: AuthPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
    }
}
