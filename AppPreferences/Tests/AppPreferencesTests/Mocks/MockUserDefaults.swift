//
//  MockUserDefaults.swift
//
//
//  Created by Nick Reichard on 1/25/24.
//

import Foundation
@testable import AppPreferences

final class MockUserDefaults: UserDefaultsProvider {

    var store = [String: Any]()

    // MARK: UserDefaults API

    func object(forKey defaultName: String) -> Any? {
        return store[defaultName]
    }

    func set(_ value: Any?, forKey defaultName: String) {
        store[defaultName] = value
    }

    func register(defaults registrationDictionary: [String: Any]) {
        store.merge(registrationDictionary) { (_, new) in new }
    }

    // MARK: Type-safe Key

    func value(for key: StorageKey) -> Any? {
        return store[key.key]
    }

    func setValue(_ value: Any?, for key: StorageKey) {
        store[key.key] = value
    }
}
