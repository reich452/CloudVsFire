// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  AppPreferences.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Combine
import Foundation

/// Class for managing application preferences.
///
/// `AppPreferences` provides a centralized point for managing user settings and preferences
/// within the application. It uses a `UserDefaultsProvider` to persist these preferences,
/// allowing for easy retrieval and modification. This class can be extended to include
/// additional preference properties as needed.
public class AppPreferences {

    /// The shared instance of `AppPreferences`.
    public static let standard = AppPreferences()

    /// The underlying provider used for storing and retrieving user defaults.
    private let userDefaultsProvider: UserDefaultsProvider
    /// Sends through the changed key path whenever a change occurs.
    var preferencesChangedSubject = PassthroughSubject<AnyKeyPath, Never>()

    // MARK: Init

    /// Initializes a new instance of `AppPreferences`.
    ///
    /// - Parameter userDefaultsProvider: The provider used for storing and retrieving user defaults.
    ///
    public init(userDefaultsProvider: UserDefaultsProvider = UserDefaults.standard) {
        self.userDefaultsProvider = userDefaultsProvider
    }

    // MARK: - App Stored Preferences

    @UserDefault(PreferenceKey.hasOnboarded)
    public var hasOnboarded: Bool = false

    // MARK: Helper

    func value<T>(forKey key: String) -> T? {
        userDefaultsProvider.object(forKey: key) as? T
    }

    func setValue<T>(_ value: T?, forKey key: String) {
        userDefaultsProvider.set(value, forKey: key)
    }
}
