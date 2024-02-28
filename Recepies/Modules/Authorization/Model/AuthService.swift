// AuthService.swift
// Copyright © RoadMap. All rights reserved.

protocol AuthServiceProtocol {
    func validateEmail(_ email: String) -> (isFormatOk: Bool, isValid: Bool)
    func validatePassword(_ password: String) -> (isFormatOk: Bool, isValid: Bool)
}

final class AuthService: AuthServiceProtocol {
    func validateEmail(_ email: String) -> (isFormatOk: Bool, isValid: Bool) {
        let isFormatOk = email.contains { character in
            character == "@"
        }
        let isValid = email == "1@2.com"
        return (isFormatOk, isValid)
    }

    func validatePassword(_ password: String) -> (isFormatOk: Bool, isValid: Bool) {
        let isValid = password == "123456"
        let isFormatOk = password.count > 5
        return (isFormatOk, isValid)
    }
}
