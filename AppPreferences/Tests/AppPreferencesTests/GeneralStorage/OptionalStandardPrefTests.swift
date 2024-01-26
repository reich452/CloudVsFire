//
//  OptionalStandardPrefTests.swift
//  
//
//  Created by Nick Reichard on 1/26/24.
//

@testable import AppPreferences
import XCTest

final class OptionalStandardPrefTests: XCTestCase {

    // MARK: Properties

    private let testKey = "testOptionalKey"
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

    // Test that OptionalStandardPref correctly retrieves a set value
    func testOptionalStandardPrefRetrievesSetValue() {
        var optionalStandardPref = OptionalStandardPref<String, StringKey>(key: .init(key: testKey),
                                                                           container: mockUserDefaults)

        // Set a value
        optionalStandardPref.wrappedValue = "TestValue"

        // Assert that the value is correctly retrieved
        XCTAssertEqual(optionalStandardPref.wrappedValue, "TestValue")
    }

    // Test that OptionalStandardPref returns nil when no value is set
    func testOptionalStandardPrefReturnsNilForUnsetValue() {
        // Arrange & Act
        let preference = OptionalStandardPref<String, StringKey>(key: .init(key: testKey), container: mockUserDefaults)

        // Assert that nil is returned for an unset value
        XCTAssertNil(preference.wrappedValue)
    }

    // Test that OptionalStandardPref correctly handles Codable values
    func testOptionalStandardPrefHandlesCodableValue() {
        // Arrange
        let key = "testCodableKey"
        var preference = OptionalStandardPref<MockCodableStruct, StringKey>(key: .init(key: key),
                                                                            container: mockUserDefaults)

        // Assert. Test retrieving nil for an unset Codable value
        XCTAssertNil(preference.wrappedValue)

        // Act. Set a Codable value
        let newValue = MockCodableStruct(name: "NewTest", age: 33)
        preference.wrappedValue = newValue

        // Assert. Test retrieving the newly set Codable value
        XCTAssertEqual(preference.wrappedValue, newValue)
        XCTAssertEqual(preference.wrappedValue?.name, newValue.name)
        XCTAssertEqual(preference.wrappedValue?.age, newValue.age)
    }
}
