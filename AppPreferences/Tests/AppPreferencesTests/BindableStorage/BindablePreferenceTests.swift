//
//  BindablePreferenceTests.swift
//  
//
//  Created by Nick Reichard on 1/26/24.
//

@testable import AppPreferences
import Combine
import SwiftUI
import XCTest

final class BindablePreferenceTests: XCTestCase {

    // MARK: Properties

    private var mockAppPreferences: MockAppPreferences!
    private var cancellables: Set<AnyCancellable>!

    // MARK: Override

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

    // MARK: - Tests

    func testPreferenceWrapper() {
        // Arrange & Act
        let bindeablePref = BindablePreference(\PreferenceStore.hasOnboarded, bindePreferences: mockAppPreferences)

        // Assert
        XCTAssertFalse(bindeablePref.wrappedValue, "Default value should be false")

        // Act
        bindeablePref.wrappedValue = true
        // Assert
        XCTAssertEqual(bindeablePref.wrappedValue, true, "Value should be 'true' after setting it")
    }

    func testPreferenceWrapperProjectedValue() {
        // Arrange
        let bindeablePref = BindablePreference(\PreferenceStore.hasOnboarded, bindePreferences: mockAppPreferences)
        let binding: Binding<Bool> = bindeablePref.projectedValue

        // Assert initial value
        XCTAssertFalse(binding.wrappedValue, "Default value should be false")

        // Act & Assert
        binding.wrappedValue = true
        XCTAssertTrue(binding.wrappedValue, "Binding value should be 'true' after setting it")
        XCTAssertTrue(bindeablePref.wrappedValue, "Preference wrapped value should be 'true' after setting binding")
    }
}
