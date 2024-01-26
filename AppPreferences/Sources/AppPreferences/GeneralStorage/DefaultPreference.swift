//
//  DefaultPreference.swift
//
//
//  Created by Nick Reichard on 1/26/24.
//

import Foundation

/// A property wrapper for standard user preferences storage with a default value.
///
/// `DefaultPreference` provides a convenient and type-safe way to interact with `UserDefaults`.
/// It abstracts the underlying `UserDefaults` mechanics, making it easier to work with preferences
/// throughout your application. This wrapper can be used in any part of your app that doesn't require
/// SwiftUI-specific functionality.
///
/// - Important: Ensure that the `Key` conforms to `StorageKey` protocol to maintain type safety.
///
/// Usage Example:
/// ```
/// DefaultPreference(key: .favoriteSetting, defaultValue: "App Update Info")
/// var username: String
/// ```
@propertyWrapper
public struct DefaultPreference<Value, Key: StorageKey> where Value: Codable {

    /// The key used to store and retrieve the value from `UserDefaults`.
    public let key: Key

    /// The default value to use when the preference is not set or cannot be found.
    public let defaultValue: Value

    /// The `UserDefaultsProvider` instance used for storing and retrieving data.
    /// Defaults to `UserDefaults.standard`.
    private let container: UserDefaultsProvider

    /// Initializes a new `StandardPreference` instance.
    ///
    /// - Parameters:
    ///   - key: The key corresponding to the preference value. Must conform to `StorageKey`.
    ///   - defaultValue: The default value to use when the value cannot be found in `UserDefaults`.
    ///   - container: The `UserDefaultsProvider` instance to use. Defaults to `UserDefaults.standard`.
    public init(key: Key, defaultValue: Value, container: UserDefaultsProvider = UserDefaults.standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.container = container
        self.container.register(defaults: [key.key: defaultValue])
    }

    /// The current value of the preference.
    ///
    /// Accessing this property reads from and writes to `UserDefaults`, using the specified key.
    /// If the value does not exist in `UserDefaults`, the `storedValue` is returned.
   public var wrappedValue: Value {
        get { container.value(for: key) as? Value ?? self.defaultValue }
        set { container.setValue(newValue, for: key) }
    }
}
