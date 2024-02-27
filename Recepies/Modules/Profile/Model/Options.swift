// Options.swift
// Copyright © RoadMap. All rights reserved.

/// ПРОТОКОЛ
/// Название и картинка опции профиля
struct Options {
    /// Иконка опции
    let icon: String
    /// Название опции
    let nameOptions: String
    /// Создает массив опций
    static func makeOption() -> [Options] {
        [
            .init(icon: "star", nameOptions: "Bonuses"),
            .init(icon: "termsF", nameOptions: "Terms & Privacy Policy"),
            .init(icon: "logoutF", nameOptions: "Log out")
        ]
    }
}
