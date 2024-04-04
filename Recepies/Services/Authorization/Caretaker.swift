// Caretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import Keychain

/// Saves and load user date into UserDefaults
protocol CareTakerProtocol {
    /// Update user login
    /// - Parameter login: user login
    func updateLogin(login: String)
    /// Update user password
    /// - Parameter password: user password
    func updatePassword(password: String)
    /// Load user instance if existed from UserDefaults
    /// - Returns: user instance in case of existed, otherwise returns nil
    func loadUser() -> User
    /// Update user name in UserDefaults
    /// - Parameter name: user name
    func updateUserName(name: String)
    /// Save user image to UserDefaults
    /// - Parameter data: user image converted to Data format
    func saveImage(data: Data)
    /// Load user image from UserDefaults
    /// - Returns user image in Data format
    func loadImage() -> Data?
}

/// Load and save user data into UserDefaults
final class Caretaker: CareTakerProtocol {
    // MARK: - Constants

    enum Constants {
        static let userKey = "user"
        static let avatarImageKey = "avatar"
        static let userPassword = "password"
    }

    // MARK: - Private Properties

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private var user: User = .init(login: "", password: "", nickName: "", avatar: "") {
        didSet {
            save(user)
        }
    }

    // MARK: - Public Methods

    func updateLogin(login: String) {
        user.login = login
    }

    func updatePassword(password: String) {
        user.password = password
    }

    func updateUserName(name: String) {
        user.nickName = name
    }

    func loadUser() -> User {
        user = getUser() ?? User(login: "", password: "", nickName: "", avatar: "")
        return user
    }

    func saveImage(data: Data) {
        do {
            let encoded = try PropertyListEncoder().encode(data)
            UserDefaults.standard.set(encoded, forKey: Constants.userKey)
        } catch {
            print(error)
        }
    }

    func loadImage() -> Data? {
        guard let data = UserDefaults.standard.data(forKey: Constants.userKey) else {
            return nil
        }
        do {
            return try PropertyListDecoder().decode(Data.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }

    // MARK: - Private Methods

    private func savePassword(for user: User) {
        print(#function)
        let _ = Keychain.save(user.password, forKey: Constants.userPassword)
        UserDefaults.standard.setValue(user.password, forKey: Constants.userPassword)
        print("User password: \(user.password)")
    }

    private func getUserPassword() -> String {
        print(#function)
        let keychainPassword = Keychain.load(Constants.userPassword) ?? ""
        print("Keychain password: \(keychainPassword)")
//        let userdefaultsPassword = UserDefaults.standard.string(forKey: Constants.userPassword) ?? ""
//        print("UserDefaults password: \(userdefaultsPassword)")
//        return userdefaultsPassword
        let user = getUser()
        let password = user?.password
        print("Userdefaults password: \(password)")
        return password ?? ""
    }

    private func save(_ user: User) {
        savePassword(for: user)
//        var userCopy = user
//        userCopy.password = ""
        do {
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: Constants.userKey)
        } catch {
            print(error)
        }
    }

    private func getUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: Constants.userKey) else {
            return nil
        }
        do {
            var user = try decoder.decode(User.self, from: data)
//            user.password = getUserPassword()
            return user
        } catch {
            print(error)
            return nil
        }
    }
}
