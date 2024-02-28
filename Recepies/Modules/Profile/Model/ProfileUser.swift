// ProfileUser.swift
// Copyright © RoadMap. All rights reserved.

/// Профиль пользователя
protocol ProfileUserProtocol {
    /// Имя и фамилия пользователя
    var userName: String { get set }
    /// Аватар пользователя
    var avatarImage: String { get set }
    /// Фукция создает пользователя
    static func makeProfile() -> Self
}

/// Реализация протокола
struct ProfileUser: ProfileUserProtocol {
    var userName: String
    var avatarImage: String
    static func makeProfile() -> ProfileUser {
        .init(userName: "Name Surname", avatarImage: "avatar")
    }
}
