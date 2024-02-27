//
//  OnboardingPageViewModel.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import SwiftUI

@Observable
class OnboardingPageViewModel {
    
    // MARK: - Properties
    
    let onboardingPages = Onboarding.allCases
    var currentPageIndex: Int = 0
    
    // MARK: - Computed Properties

    private var isLastPage: Bool {
        currentPageIndex == onboardingPages.count - 1
    }
    
    var currentOnboardingPage: Onboarding {
        onboardingPages[currentPageIndex]
    }
    
    /// Closure to be called when onboarding is completed
    var didCompleteOnboarding: (() -> Void)?
    
    // MARK: - Methods
    
    func nextPage() {
        if isLastPage {
            didCompleteOnboarding?()
        } else {
            currentPageIndex += 1
        }
    }
}
