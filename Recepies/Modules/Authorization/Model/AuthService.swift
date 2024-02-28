// AuthService.swift
// Copyright © RoadMap. All rights reserved.
/// Protocol for user authorisation service
protocol AuthServiceProtocol {
    /// Email validation
    /// - Parameter email: string value of user email
    /// - Returns: isFormatOk: True if email value contains charackters as @, ., etc. False if not
    /// - Returns: isValid: True if email fit to user email. False if not
    func validateEmail(_ email: String) -> (isFormatOk:Bool, isValid: Bool)
    
    /// Passwordl validation
    /// - Parameter password: string value of user pasword
    /// - Returns: isFormatOk: True if password lenght > 5. False if not
    /// - Returns: isValid: True if password fit to user password. False if not
    func validatePassword(_ password: String) -> (isFormatOk:Bool, isValid: Bool)
}
/// Service for user authorization
final class AuthService: AuthServiceProtocol {
    
    func validateEmail(_ email: String) -> (isFormatOk:Bool, isValid: Bool) {
        let isFormatOk = email.contains { character in
            character == "@"
        }
       let isValid =  email == "1@2.com"
        return (isFormatOk, isValid)
    }
    func validatePassword(_ password: String) -> (isFormatOk:Bool, isValid: Bool) {
        let isValid = password == "123456"
        let isFormatOk = password.count > 5
        return (isFormatOk, isValid)
    }
}
