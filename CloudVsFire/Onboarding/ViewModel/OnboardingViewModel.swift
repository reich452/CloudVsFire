//
//  OnboardingViewModel.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/16/23.
//

import Combine
import Foundation


class OnboardingViewModel: ObservableObject {
    
    // MARK: - Properties
    @Injected(\.onboardingPageProviding) private var onboardingPageProvider: OnboardingPageProvider
    
    @Published private(set) var onboardingPages: [Onboarding] = []
    @Published private(set) var selectedPage: Int = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchOnboardingPages()
    }
    
    // MARK: - Main
    
    func moveToNextPage() {
        if selectedPage < onboardingPages.count - 1 {
            selectedPage += 1
        }
    }
}

private extension OnboardingViewModel {
    
    func fetchOnboardingPages() {
        onboardingPages = onboardingPageProvider.getOnboardingPages()
    }
}
