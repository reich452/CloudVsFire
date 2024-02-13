//
//  AppPreferencesTests.swift
//
//
//  Created by Nick Reichard on 1/25/24.
//

import Combine
@testable import AppPreferences
import XCTest

final class PreferencesTests: XCTestCase {

    private var appPreferences: PreferenceStore!
    private var mockUserDefaults: MockUserDefaults!
    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockUserDefaults = MockUserDefaults()
        appPreferences = PreferenceStore(userDefaultsProvider: mockUserDefaults)
        cancellables = []
    }

    override func tearDown() {
        appPreferences = nil
        mockUserDefaults = nil
        cancellables = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testHhasCompletedOnboarding() {
        // Act & Assert
        XCTAssertFalse(appPreferences.hasCompletedOnboarding,
                       "Default value for hasCompletedOnboarding should be false")

        // Act
        appPreferences.hasCompletedOnboarding = true

        // Assert
        XCTAssertTrue(appPreferences.hasCompletedOnboarding, "hasCompletedOnboarding should be true after setting")
        XCTAssertEqual(mockUserDefaults.store["hasCompletedOnboarding"] as? Bool, true)
    }

    func testPreferencesChangedSubject() {
        // Arrange
        let expectation = XCTestExpectation(description: "Preferences changed subject should emit a value")
        appPreferences.preferencesChangedSubject
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &cancellables)

        // Act
        appPreferences.hasCompletedOnboarding = true

        // Assert
        wait(for: [expectation], timeout: 1.0)
    }
}
