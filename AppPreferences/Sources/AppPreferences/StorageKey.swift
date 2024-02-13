//
//  StorageKey.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation

/// A protocol that defines a storage key for user preferences.
///
/// This protocol is used to abstract the concept of a key used for storing values in
/// a persistent storage like UserDefaults. Conforming types provide a `key` property
/// that is used as the identifier for the stored value.
public protocol StorageKey {
    /// The key used for storing and retrieving the value in persistent storage.
    var key: String { get }
}

extension StorageKey where Self: RawRepresentable, RawValue == String {
    public var key: String { rawValue }
}
