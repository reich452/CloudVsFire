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

    func object(forKey defaultName: String) -> Any? {
        return store[defaultName]
    }

    func set(_ value: Any?, forKey defaultName: String) {
        store[defaultName] = value
    }
}
