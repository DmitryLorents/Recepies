// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Builder {
    static func makeAuthView() -> UIViewController
}

final class ModuleBuilder: Builder {
    static func makeAuthView() -> UIViewController {
        let authService = AuthService()
        let view = AuthView()
        let presenter = AuthPresenter(view: view, authService: authService)
        view.presenter = presenter
        authService.presenter = presenter
        return view
    }
}
