// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// Localizable.strings
  ///   SkillTestApp
  /// 
  ///   Created by David Penagos on 21/02/23.
  public static let baseURL = L10n.tr("Localizable", "Base_URL", fallback: "https://rickandmortyapi.com/api/")
  public enum Error {
    /// Invalid URL
    public static let invalidUrl = L10n.tr("Localizable", "Error.invalid_url", fallback: "Invalid URL")
  }
  public enum URLEndpoint {
    /// character
    public static let allCharacters = L10n.tr("Localizable", "URL_Endpoint.all_characters", fallback: "character")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
