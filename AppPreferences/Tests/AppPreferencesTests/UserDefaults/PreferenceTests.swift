//
//  PreferenceTests.swift
//  
//
//  Created by Nick Reichard on 1/25/24.
//

@testable import AppPreferences
import Combine
import SwiftUI
import XCTest

class PreferenceTests: XCTestCase {

    var mockAppPreferences: MockAppPreferences!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockAppPreferences = MockAppPreferences()
        cancellables = []
    }

    override func tearDown() {
        mockAppPreferences = nil
        cancellables = nil
        super.tearDown()
    }

    func testPreferenceWrapper() {
        // Arrange & Act
        let preference = Preference(\AppPreferences.hasOnboarded, preferences: mockAppPreferences)

        // Assert
        XCTAssertFalse(preference.wrappedValue, "Default value should be false")

        // Act
        preference.wrappedValue = true
        // Assert
        XCTAssertEqual(preference.wrappedValue, true, "Value should be 'true' after setting it")
    }

    func testPreferenceWrapperProjectedValue() {
        // Arrange
        let preference = Preference(\AppPreferences.hasOnboarded, preferences: mockAppPreferences)
        let binding: Binding<Bool> = preference.projectedValue

        // Assert initial value
        XCTAssertFalse(binding.wrappedValue, "Default value should be false")

        // Act & Assert
        binding.wrappedValue = true
        XCTAssertTrue(binding.wrappedValue, "Binding value should be 'true' after setting it")
        XCTAssertTrue(preference.wrappedValue, "Preference wrapped value should be 'true' after setting binding")
    }

}
