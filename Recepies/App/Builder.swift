// Builder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Builder {
    static func makeAuthModule() -> UIViewController
    static func makeRecepiesModule() -> UIViewController
    static func makeFavoritesModule() -> UIViewController
    static func makeProfileModule() -> UIViewController
}

final class ModuleBuilder: Builder {
    
    static func makeAuthModule() -> UIViewController {
        let authService = AuthService()
        let view = AuthView()
        let presenter = AuthPresenter(view: view, authService: authService)
        view.presenter = presenter
        authService.presenter = presenter
        return view
    }
    
    static func makeRecepiesModule() -> UIViewController {
        return .init()
    }
    
    static func makeFavoritesModule() -> UIViewController {
        return .init()
    }
    
    static func makeProfileModule() -> UIViewController {
        return .init()
    }
    
    
}
