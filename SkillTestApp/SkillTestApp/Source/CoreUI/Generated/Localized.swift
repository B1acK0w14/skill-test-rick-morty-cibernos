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
  public enum CharacterCell {
    /// Gender:
    public static let gender = L10n.tr("Localizable", "Character_Cell.gender", fallback: "Gender:")
    /// Last known location:
    public static let lastKnowLocation = L10n.tr("Localizable", "Character_Cell.last_know_location", fallback: "Last known location:")
    public enum Status {
      /// Alive
      public static let alive = L10n.tr("Localizable", "Character_Cell.Status.alive", fallback: "Alive")
      /// Dead
      public static let dead = L10n.tr("Localizable", "Character_Cell.Status.dead", fallback: "Dead")
      /// Unknown
      public static let unknown = L10n.tr("Localizable", "Character_Cell.Status.unknown", fallback: "Unknown")
    }
  }
  public enum Error {
    /// Error
    public static let generalError = L10n.tr("Localizable", "Error.general_error", fallback: "Error")
    /// Invalid URL
    public static let invalidUrl = L10n.tr("Localizable", "Error.invalid_url", fallback: "Invalid URL")
  }
  public enum FilterView {
    public enum GenderMenu {
      /// Female
      public static let female = L10n.tr("Localizable", "Filter_View.Gender_Menu.female", fallback: "Female")
      /// Genderless
      public static let genderless = L10n.tr("Localizable", "Filter_View.Gender_Menu.genderless", fallback: "Genderless")
      /// Male
      public static let male = L10n.tr("Localizable", "Filter_View.Gender_Menu.male", fallback: "Male")
      /// Unknown
      public static let unknown = L10n.tr("Localizable", "Filter_View.Gender_Menu.unknown", fallback: "Unknown")
    }
    public enum Search {
      /// Search
      public static let searchIcon = L10n.tr("Localizable", "Filter_View.Search.search_icon", fallback: "Search")
      /// Search
      public static let searchText = L10n.tr("Localizable", "Filter_View.Search.search_text", fallback: "Search")
      /// Search any character
      public static let searchTextfieldPlaceholder = L10n.tr("Localizable", "Filter_View.Search.search_textfield_placeholder", fallback: "Search any character")
    }
  }
  public enum HomeView {
    /// Home
    public static let homeIcon = L10n.tr("Localizable", "Home_View.home_icon", fallback: "Home")
    /// Next Page
    public static let nextPageButton = L10n.tr("Localizable", "Home_View.next_page_button", fallback: "Next Page")
    /// Prev Page
    public static let previusPageButton = L10n.tr("Localizable", "Home_View.previus_page_button", fallback: "Prev Page")
  }
  public enum URLEndpoint {
    /// character/
    public static let allCharacters = L10n.tr("Localizable", "URL_Endpoint.all_characters", fallback: "character/")
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
