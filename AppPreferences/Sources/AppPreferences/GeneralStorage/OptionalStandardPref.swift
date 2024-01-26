//
//  OptionalStandardPref.swift
//
//
//  Created by Nick Reichard on 1/26/24.
//

import Foundation

// A property wrapper for optionally storing user preferences.
///
/// `OptionalStandardPref` is similar to `StandardPreference`, but it does not require
/// a default value. It is useful for preferences that may or may not be present.
/// When a value for a given key is not found in `UserDefaults`, it returns `nil` instead.
///
/// Usage Example:
/// ```
/// @OptionalStandardPref(key: .lastOpenedDate)
/// var lastOpenedDate: Date?
/// ```
@propertyWrapper
public struct OptionalStandardPref<Value, Key: StorageKey> where Value: Codable {

    /// The key used to store and retrieve the value from `UserDefaults`.
    public let key: Key

    /// The `UserDefaultsProvider` instance used for storing and retrieving data.
    /// Defaults to `UserDefaults.standard`.
    private let container: UserDefaultsProvider

    /// Initializes a new `OptionalStandardPref` instance.
    ///
    /// - Parameters:
    ///   - key: The key corresponding to the preference value. Must conform to `StorageKey`.
    ///   - container: The `UserDefaultsProvider` instance to use. Defaults to `UserDefaults.standard`.
    public init(key: Key, container: UserDefaultsProvider = UserDefaults.standard) {
        self.key = key
        self.container = container
    }

    /// The current optional value of the preference.
    ///
    /// Accessing this property reads from and writes to `UserDefaults`, using the specified key.
    /// If the value does not exist in `UserDefaults`, `nil` is returned.
    public var wrappedValue: Value? {
        get { container.value(for: key) as? Value }
        set { container.setValue(newValue, for: key) }
    }
}
