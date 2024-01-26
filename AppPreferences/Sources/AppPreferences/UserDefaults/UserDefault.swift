//
//  UserDefault.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation

/// A property wrapper for storing and retrieving values from `BindePreferences`.
///
/// This property wrapper simplifies the interface for interacting with user preferences,
/// allowing values to be stored and retrieved using property-like syntax. It is designed
/// to be used within an `BindePreferences` instance and not as a standalone property.
///
/// - Warning: Direct access to `wrappedValue` is not supported and will result in a runtime error.
///            Use subscript access through the `BindePreferences` instance instead.
@propertyWrapper
public struct UserDefault<Value> {

    /// The default value to be returned when no value is found in the preferences.
    public let defaultValue: Value
    /// The key used to store the value in the preferences.
    public let storageKey: String

    /// The property for accessing the value.
    /// Accessing this property directly is unsupported and will cause a runtime error.
    public var wrappedValue: Value {
        get {
            // swiftlint:disable:next line_length
            fatalError("Direct access to the wrapped value of UserDefault property wrapper is not supported. Use subscript access through the Preferences instance.")
        }
        // swiftlint:disable:next unused_setter_value
        set {
            // swiftlint:disable:next line_length
            fatalError("Direct modification of the wrapped value of UserDefault property wrapper is not supported. Use subscript access through the Preferences instance.")
        }
    }

    /// Initializes a new user default with the specified default value and storage key string.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value to use when no value is stored.
    ///   - storageKeyString: The key used for storing the value in the preferences.
    public init(wrappedValue: Value, _ storageKeyString: String) {
        self.defaultValue = wrappedValue
        self.storageKey = storageKeyString
    }

    /// Initializes a new user default with the specified default value and storage key.
    ///
    /// - Parameters:
    ///   - wrappedValue: The default value to use when no value is stored.
    ///   - storageKey: The `StorageKey` used for storing the value in the preferences.
    public init(wrappedValue: Value, _ storageKey: StorageKey) {
        self.init(wrappedValue: wrappedValue, storageKey.key)
    }

    /// A static subscript for accessing or modifying the values in `BindePreferences`.
    ///
    /// - Parameters:
    ///   - instance: The instance of `BindePreferences`.
    ///   - wrappedKeyPath: The key path to the specific `UserDefault` instance.
    ///   - storageKeyPath: The key path to the storage key in `BindePreferences`.
    /// - Returns: The value stored in the user defaults or the default value if no value is found.
    public static subscript(
        _enclosingInstance instance: BindePreferences,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<BindePreferences, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<BindePreferences, Self>
    ) -> Value {
        get {
            let key = instance[keyPath: storageKeyPath].storageKey
            let defaultValue = instance[keyPath: storageKeyPath].defaultValue
            return instance.value(forKey: key) ?? defaultValue
        }
        set {
            let key = instance[keyPath: storageKeyPath].storageKey
            instance.setValue(newValue, forKey: key)
            instance.preferencesChangedSubject.send(wrappedKeyPath)
        }
    }
}
