// Caretaker.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import Keychain

/// Class container
final class Caretaker {
    // MARK: - Singletone

    static let shared = Caretaker()

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
        Keychain.save(user.password, forKey: Constants.userPassword)
    }

    private func getUserPassword() -> String {
        Keychain.load(Constants.userPassword) ?? ""
    }

    private func save(_ user: User) {
        savePassword(for: user)
        var userCopy = user
        userCopy.password = ""
        do {
            let data = try encoder.encode(userCopy)
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
            user.password = getUserPassword()
            return user
        } catch {
            print(error)
            return nil
        }
    }
}
