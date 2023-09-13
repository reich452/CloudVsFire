//
//  OnboardingPageViewModel.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Combine
import SwiftUI

@Observable class OnboardingPageViewModel {
    
    // MARK: - Properties
    
    private let onboardingPages: [Onboarding] = [.pageOne, .pageTwo, .pageThree]
    var currentPage: Int = 0
    
    // MARK: - Computed
    
    var currentOnboardingPage: Onboarding? {
        guard currentPage >= 0 && currentPage < onboardingPages.count else {
            return nil
        }
        return onboardingPages[currentPage]
    }
    
    var isLastPage: Bool {
        currentPage == onboardingPages.count - 1
    }
    
    var allOnboardingPages: [Onboarding] {
        return onboardingPages
    }
    
    func nextPage() {
        if !isLastPage {
            currentPage += 1
        }
    }
}
