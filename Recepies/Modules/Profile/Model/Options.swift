// Options.swift
// Copyright © RoadMap. All rights reserved.

/// Название и картинка опции профиля
protocol OptionsProtocol {
    /// Иконка опции
    var icon: String { get set }
    /// Название опции
    var nameOptions: String { get set }
    /// Создает массив опций
    static func makeOption() -> [Self]
}

/// Рефлизация протокола
struct Options: OptionsProtocol {
    var icon: String
    var nameOptions: String
    static func makeOption() -> [Options] {
        [
            .init(icon: "star", nameOptions: "Bonuses"),
            .init(icon: "termsF", nameOptions: "Terms & Privacy Policy"),
            .init(icon: "logoutF", nameOptions: "Log out")
        ]
    }
}
