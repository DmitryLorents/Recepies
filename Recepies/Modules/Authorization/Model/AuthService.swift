// AuthService.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Protocol for user authorisation service
protocol AuthServiceProtocol {
    /// Email validation
    /// - Parameter email: string value of user email
    /// - Returns: isFormatOk: True if email value contains charackters as @, ., etc. False if not
    /// - Returns: isValid: True if email fit to user email. False if not
    func validateEmail(_ email: String) -> (isFormatOk: Bool, isValid: Bool)

    /// Passwordl validation
    /// - Parameter password: string value of user pasword
    /// - Returns: isFormatOk: True if password lenght > 5. False if not
    /// - Returns: isValid: True if password fit to user password. False if not
    func validatePassword(_ password: String) -> (isFormatOk: Bool, isValid: Bool)
}

/// Service for user authorization
final class AuthService: AuthServiceProtocol {
    func validateEmail(_ email: String) -> (isFormatOk: Bool, isValid: Bool) {
        let isFormatOk = email.contains { character in
            character == "@"
        }

        var isValid: Bool
        let userLogin = Caretaker.shared.loadUser().login

        if userLogin.isEmpty {
            Caretaker.shared.updateLogin(login: email)
        }
        if Caretaker.shared.loadUser().login == email {
            isValid = true
        } else {
            isValid = false
        }

        return (isFormatOk, isValid)
    }

    func validatePassword(_ password: String) -> (isFormatOk: Bool, isValid: Bool) {
        let isFormatOk = password.count > 5

        var isValid: Bool
        let userPassword = Caretaker.shared.loadUser().password

        if userPassword.isEmpty {
            Caretaker.shared.updatePassword(password: password)
        }
        if Caretaker.shared.loadUser().password == password {
            isValid = true
        } else {
            isValid = false
        }

        return (isFormatOk, isValid)
    }
}

// протокол мементор
// структру подписана должна быть
struct User: Codable {
    var login: String
    var password: String
    var nickName: String
    var avatar: String
}

// 1. Originator

// каретакер
final class Caretaker {
    static var shared = Caretaker()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"

    private var user: User = .init(login: "", password: "", nickName: "", avatar: "avatar") {
        didSet {
            save(records: user)
        }
    }

    func updateLogin(login: String) {
        user.login = login
    }

    func updatePassword(password: String) {
        user.password = password
    }

    func updateNameUser(name: String) {
        user.nickName = name
    }

    func loadUser() -> User {
        user = load() ?? User(login: "", password: "", nickName: "", avatar: "")
        return user
    }

    func saveImage(data: Data) {
        let encoded = try? PropertyListEncoder().encode(data)
        UserDefaults.standard.set(encoded, forKey: "avatar")
    }

    func loadImage() -> Data? {
        guard let data = UserDefaults.standard.data(forKey: "avatar") else {
            return nil
        }
        do {
            return try PropertyListDecoder().decode(Data.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }

    private func save(records: User) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }

    private func load() -> User? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode(User.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}
