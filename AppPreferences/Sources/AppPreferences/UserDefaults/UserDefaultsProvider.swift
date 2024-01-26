//
//  UserDefaultsProvider.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation

/// Protocol that abstracts the functionality of storing and retrieving key-value pairs.
///
/// This protocol is designed to mimic the basic functionality of `UserDefaults`,
/// allowing for easier testing and more flexible implementations.
public protocol UserDefaultsProvider: UserDefaultsStorageKeyProvider {

    /// Retrieves the value of the specified default key.
    ///
    /// - Parameter defaultName: A string used to identify the value.
    /// - Returns: The value associated with the specified key, or nil if the key was not found.
    func object(forKey defaultName: String) -> Any?

    /// Sets the value of the specified default key.
    ///
    /// - Parameters:
    ///   - value: The object to store in the defaults. This value can be nil.
    ///   - defaultName: The key with which to associate the value.
    func set(_ value: Any?, forKey defaultName: String)

    /// Adds the contents of the specified dictionary to the registration domain.
    ///
    /// The `register(defaults:)` method is used to set up the initial values of certain user preferences
    /// (defaults). These values are used when the user defaults system can't find any value for a given
    /// key in the user, global, or argument domains. This is typically used to ensure that your application
    /// always has a reasonable default value.
    ///
    /// The values you specify are not written to disk; they are, instead, stored in memory until
    /// overwritten by the user or the application.
    ///
    /// This is often used in the `AppDelegate` to set up initial preference values. It's a crucial step for
    /// ensuring that your app has sensible defaults before any user customization.
    func register(defaults registrationDictionary: [String: Any])
}

/// Protocol that abstracts key-value storage functionality.
///
/// `UserDefaultsStorageKeyProvider` is designed to abstract the underlying mechanics of key-value
/// storage systems like `UserDefaults`. This abstraction facilitates more flexible implementations and
/// makes unit testing easier by allowing you to mock or replace the standard `UserDefaults` storage mechanism.
///
/// Implementers of this protocol should provide methods to retrieve and set values using a `StorageKey`.
public protocol UserDefaultsStorageKeyProvider {
    /// Retrieves the value associated with the specified `StorageKey`.
    ///
    /// - Parameter key: The `StorageKey` used to identify the value.
    /// - Returns: The value associated with the specified key, or `nil` if the key was not found.
    func value(for key: StorageKey) -> Any?

    /// Sets the value for the specified `StorageKey`.
    ///
    /// - Parameters:
    ///   - value: The object to store. This value can be `nil`.
    ///   - key: The `StorageKey` with which to associate the value.
    func setValue(_ value: Any?, for key: StorageKey)
}

extension UserDefaults: UserDefaultsProvider {

    public func value(for key: StorageKey) -> Any? {
        value(forKey: key.key)
    }

    public func setValue(_ value: Any?, for key: StorageKey) {
        setValue(value, forKey: key.key)
    }
}
