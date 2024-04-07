// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Local {
  internal enum AuthScreen {
    /// Enter Email Address
    internal static let emailPlaceholder = Local.tr("Localizable", "authScreen.emailPlaceholder", fallback: "Enter Email Address")
    /// EmailTextFieldID
    internal static let emailTextFieldID = Local.tr("Localizable", "authScreen.emailTextFieldID", fallback: "EmailTextFieldID")
    /// EmailWarningLabelID
    internal static let emailWarningLabelID = Local.tr("Localizable", "authScreen.emailWarningLabelID", fallback: "EmailWarningLabelID")
    /// Incorrect format
    internal static let emailWarningText = Local.tr("Localizable", "authScreen.emailWarningText", fallback: "Incorrect format")
    /// Localizable.strings
    ///   Recepies
    /// 
    ///   Created by Dmitry on 28.03.2024.
    internal static let id = Local.tr("Localizable", "authScreen.ID", fallback: "AuthView")
    /// Enter Password
    internal static let passwordPlaceholder = Local.tr("Localizable", "authScreen.passwordPlaceholder", fallback: "Enter Password")
    /// PasswordTextFieldID
    internal static let passwordTextFieldID = Local.tr("Localizable", "authScreen.passwordTextFieldID", fallback: "PasswordTextFieldID")
    /// PasswordWarningLabelID
    internal static let passwordWarningLabelID = Local.tr("Localizable", "authScreen.passwordWarningLabelID", fallback: "PasswordWarningLabelID")
    /// You entered the wrong password
    internal static let passwordWarningText = Local.tr("Localizable", "authScreen.passwordWarningText", fallback: "You entered the wrong password")
    /// WarningLabelID
    internal static let warningLabelID = Local.tr("Localizable", "authScreen.warningLabelID", fallback: "WarningLabelID")
    internal enum EmailLabel {
      /// Email Adress
      internal static let title = Local.tr("Localizable", "authScreen.emailLabel.title", fallback: "Email Adress")
    }
    internal enum LoginButton {
      /// Login
      internal static let title = Local.tr("Localizable", "authScreen.loginButton.title", fallback: "Login")
    }
    internal enum LoginLabel {
      /// Login
      internal static let title = Local.tr("Localizable", "authScreen.loginLabel.title", fallback: "Login")
    }
    internal enum PasswordLabel {
      /// Password
      internal static let title = Local.tr("Localizable", "authScreen.passwordLabel.title", fallback: "Password")
    }
    internal enum WarningLabel {
      /// Please check the accuracy of the entered credentials.
      internal static let text = Local.tr("Localizable", "authScreen.warningLabel.text", fallback: "Please check the accuracy of the entered credentials.")
    }
  }
  internal enum RecipesScreen {
    /// RecipesView
    internal static let viewID = Local.tr("Localizable", "recipesScreen.viewID", fallback: "RecipesView")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Local {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
