//
//  MockAppPreferences.swift
//
//
//  Created by Nick Reichard on 1/25/24.
//

@testable import AppPreferences
import Combine
import Foundation

final class MockAppPreferences: BindePreferences {

    var testStore = [String: Any]()

    override func value<T>(forKey key: String) -> T? {
         return testStore[key] as? T
     }

     override func setValue<T>(_ value: T?, forKey key: String) {
         testStore[key] = value
         preferencesChangedSubject.send(\MockAppPreferences.testStore)
     }
}
