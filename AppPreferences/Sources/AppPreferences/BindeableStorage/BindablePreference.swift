// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  BindablePreference.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 1/25/24.
//

import Combine
import SwiftUI

/// A SwiftUI property wrapper that provides a SwiftUI dynamic property for accessing and modifying
/// values stored in `PreferenceStore`.
///
/// This property wrapper allows SwiftUI views to bind to user preference values, automatically
/// updating the view when these values change. The `Preference` wrapper should be used
/// within SwiftUI views that require interaction with user preferences.
///
/// - Note: The `BindablePreference` wrapper leverages SwiftUI's `Binding` to enable two-way data flow
///         between the view and the preferences storage. Only use this with SwiftUI views.
@propertyWrapper
public struct BindablePreference<Value>: DynamicProperty {

    // MARK: Private Properties - Should remain private

    /// An observer for changes in preferences, ensuring the SwiftUI view updates when preferences change./
    @ObservedObject private var preferencesObserver: PublisherObservableObject
    /// The key path to the specific value in `AppPreferences`.
    private let keyPath: ReferenceWritableKeyPath<PreferenceStore, Value>
    /// The instance of `AppPreferences` used for accessing and modifying the preference value.
    private let appPreferences: PreferenceStore

    // MARK: init

    /// Initializes a new preference property wrapper.
    ///
    /// - Parameters:
    ///   - keyPath: A key path to the specific preference value in `PreferenceStore`.
    ///   - preferences: An instance of `PreferenceStore`. Defaults to `.standard` if not specified.
    public init(_ keyPath: ReferenceWritableKeyPath<PreferenceStore, Value>,
                bindePreferences: PreferenceStore = .standard) {
        self.keyPath = keyPath
        self.appPreferences = bindePreferences
        let publisher = bindePreferences
            .preferencesChangedSubject
            .filter { changedKeyPath in
                changedKeyPath == keyPath
            }.map { _ in () }
            .eraseToAnyPublisher()
        self.preferencesObserver = .init(publisher: publisher)
    }

    // MARK: - Main

    /// The current value of the preference.
    ///
    /// Accessing or modifying this property directly interacts with the `AppPreferences` instance,
    /// using the specified key path.
    public var wrappedValue: Value {
        get { appPreferences[keyPath: keyPath] }
        nonmutating set { appPreferences[keyPath: keyPath] = newValue }
    }

    /// A `Binding` to the preference value, allowing it to be used in SwiftUI views.
    ///
    /// This projected value enables the integration of the preference into SwiftUI's
    /// declarative UI paradigm, facilitating the creation of data-driven views.
    public var projectedValue: Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
}
