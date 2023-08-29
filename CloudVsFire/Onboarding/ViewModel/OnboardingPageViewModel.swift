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
    
    var onboardingPages: [Onboarding]
    var currentPage: Int = 0 
    
    // MARK: - init
    
    init(onboarding pages: [Onboarding] = [.pageOne, .pageTwo, .pageThree]) {
        self.onboardingPages = pages
    }
    
    // MARK: - Computed
    
    var currentOnboardingPage: Onboarding? {
        guard currentPage >= 0 && currentPage < onboardingPages.count else {
            return nil
        }
        return onboardingPages[currentPage]
    }
    
    var isLastPage: Bool {
        return currentPage >= onboardingPages.count - 1
    }
    
    // MARK: - Main
    
    func nextPage() {
        if !isLastPage {
            currentPage += 1
        }
    }
}
