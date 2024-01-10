//
//  OnboardingViewModelTests.swift
//  CloudVsFireTests
//
//  Created by Nick Reichard on 9/12/23.
//

@testable import CloudVsFire
import XCTest

class OnboardingPageViewModelTests: XCTestCase {

    func testInitialState() {
        // Arrange
        let viewModel = OnboardingPageViewModel()

        // Assert
        XCTAssertEqual(viewModel.currentOnboardingPage, .pageOne, "Initial page should be pageOne")
        XCTAssertFalse(viewModel.isLastPage, "Initial state should not be the last page")
    }

    func testNextPage() {
        // Arrange
        let viewModel = OnboardingPageViewModel()

        // Act
        viewModel.nextPage()

        // Assert
        XCTAssertEqual(viewModel.currentOnboardingPage,
            .pageTwo,
                       "After one nextPage call, current page should be pageTwo")
        XCTAssertEqual(viewModel.currentPage,
                       1,
                       "Current page index should be 1 after one nextPage call")
    }

    func testMultipleNextPageCalls() {
        // Arrange
        let viewModel = OnboardingPageViewModel()

        // Act
        viewModel.nextPage()
        viewModel.nextPage()
        viewModel.nextPage()

        // Assert
        XCTAssertEqual(viewModel.currentOnboardingPage,
            .pageThree,
                       "After two nextPage calls, current page should be pageThree")
        XCTAssertEqual(viewModel.currentPage,
                       2,
                       "Current page index should be 2 after two nextPage calls")
        XCTAssertTrue(viewModel.isLastPage,
                      "Should not be the last page yet after two nextPage calls")

        // Act
        viewModel.nextPage()

        // Assert
        XCTAssertTrue(viewModel.isLastPage, "Should be the last page after three nextPage calls")

        // Act
        viewModel.nextPage()

        // Assert
        XCTAssertEqual(viewModel.currentOnboardingPage,
            .pageThree,
                       "currentOnboardingPage should remain at pageThree after extra nextPage calls")
        XCTAssertEqual(viewModel.currentPage,
                       2,
                       "Current page index should still be 2 after extra nextPage calls")
    }
}
