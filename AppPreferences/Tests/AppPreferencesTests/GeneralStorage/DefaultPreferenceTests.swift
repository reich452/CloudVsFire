//
//  DefaultPreferenceTests.swift
//
//
//  Created by Nick Reichard on 1/26/24.
//

@testable import AppPreferences
import XCTest

final class DefaultPreferenceTests: XCTestCase {

    // MARK: Properties

    private let testKey = "testKey"
    private var mockUserDefaults: MockUserDefaults!

    // MARK: Override

    override func setUp() {
        super.setUp()
        mockUserDefaults = MockUserDefaults()
    }

    override func tearDown() {
        mockUserDefaults = nil
        super.tearDown()
    }

    // MARK: - Tests

    // Test that DefaultPreference correctly retrieves the stored value
    func testDefaultPreferenceRetrievesStoredValue() {
        // Arrange
        let storedValue = "testValue"
        var preference = DefaultPreference<String, StringKey>(key: .init(key: testKey),
                                                              defaultValue: storedValue,
                                                              container: mockUserDefaults)

        // Act
        preference.wrappedValue = "newValue"
        // Assert
        XCTAssertEqual(preference.wrappedValue, "newValue")
    }

    // Test that DefaultPreference correctly retrieves the stored value
    func testDefaultPreferenceRetrievesStoredValue_enumCase() {
        // Arrange
        let storedValue = false
        var preference = DefaultPreference<Bool, PreferenceKey>(key: .hasOnboarded,
                                                                defaultValue: storedValue,
                                                                container: mockUserDefaults)

        // Assert
        XCTAssertFalse(preference.wrappedValue)
        // Act
        preference.wrappedValue = true
        // Assert
        XCTAssertTrue(preference.wrappedValue)
    }

    // Test that DefaultPreference returns default value when no value is set
    func testDefaultPreferenceReturnsDefaultValue() {
        // Arrange
        let storedValue = "defaultValue"

        // Act
        let preference = DefaultPreference<String, StringKey>(key: .init(key: testKey),
                                                              defaultValue: storedValue,
                                                              container: mockUserDefaults)

        // Assert
        XCTAssertEqual(preference.wrappedValue, storedValue)
    }

    // Test that DefaultPreference correctly handles Codable values
    func testDefaultPreferenceHandlesCodableValue() {
        // Arrange
        let storedValue = MockCodableStruct(name: "Test", age: 25)
        let key = "testCodableKey"

        // Act
        var preference = DefaultPreference<MockCodableStruct, StringKey>(key: .init(key: key),
                                                                         defaultValue: storedValue,
                                                                         container: mockUserDefaults)

        // Assert. Test retrieving the default value
        XCTAssertEqual(preference.wrappedValue.name, storedValue.name)
        XCTAssertEqual(preference.wrappedValue.age, storedValue.age)

        // Act. Set a new value
        let newValue = MockCodableStruct(name: "NewTest", age: 33)
        preference.wrappedValue = newValue

        // Assert. Test retrieving the new value
        XCTAssertEqual(preference.wrappedValue, newValue)
        XCTAssertEqual(preference.wrappedValue.name, newValue.name)
        XCTAssertEqual(preference.wrappedValue.age, newValue.age)
    }
}

/// An example StorageKey implementation for testing
struct StringKey: StorageKey {
    var key: String
}
