// AuthService.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthServiceProtocol {
    func checkUserData(email: String, password: String) -> Bool
}

final class AuthService: AuthServiceProtocol {
    func checkUserData(email: String, password: String) -> Bool {
        email == "1@2.com" && password.count > 0
    }
}
