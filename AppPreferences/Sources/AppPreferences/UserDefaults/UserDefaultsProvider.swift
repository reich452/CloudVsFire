//
//  UserDefaultsProvider.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation

/// A protocol that abstracts the functionality of storing and retrieving key-value pairs.
///
/// This protocol is designed to mimic the basic functionality of `UserDefaults`,
/// allowing for easier testing and more flexible implementations.
public protocol UserDefaultsProvider {

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
}

extension UserDefaults: UserDefaultsProvider {
    // no opp.
}
