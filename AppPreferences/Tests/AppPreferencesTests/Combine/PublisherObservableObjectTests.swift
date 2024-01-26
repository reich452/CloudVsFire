//
//  PublisherObservableObjectTests.swift
//  
//
//  Created by Nick Reichard on 1/25/24.
//

@testable import AppPreferences
import Combine
import XCTest

final class PublisherObservableObjectTests: XCTestCase {

    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }

    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }

    // MARK: - Tests 

    func testObjectWillChangeSendsOnPublisherEmission() {
        // Arrange
        var didChange = false
        // 1. Setup the test environment
        let subject = PassthroughSubject<Void, Never>()

        // Act
        let observableObject = PublisherObservableObject(publisher: subject.eraseToAnyPublisher())
        // 2. Subscribe to the objectWillChange publisher
        observableObject.objectWillChange
            .sink { _ in
                didChange = true
            }
            .store(in: &cancellables)
        // 3. Trigger the publisher
        subject.send()

        // Assert. 4. Verify the result
        XCTAssertTrue(didChange, "objectWillChange should be triggered when the publisher emits")
    }

}
