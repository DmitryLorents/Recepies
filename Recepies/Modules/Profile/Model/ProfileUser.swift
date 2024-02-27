// ProfileUser.swift
// Copyright © RoadMap. All rights reserved.

//
//  ProfileUser.swift
//  UiKitDz
//
//  ПРОТОКОЛ
//
/// Профиль пользователя
struct ProfileUser {
    /// Имя и фамилия пользователя
    var userName: String
    /// Аватар пользователя
    var avatarImage: String
    /// Фукция создает пользователя
    static func makeProfile() -> ProfileUser {
        .init(userName: "Name Surname", avatarImage: "avatar")
    }
}
