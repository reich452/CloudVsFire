//
//  CloudVsFireApp.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

@main
struct CloudVsFireApp: App {
    
    init() {
        AppResolver.sharedServices.onboardingPageProviding = OnboardingPageProviding()
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingPageView()
                .environmentObject(OnboardingViewModel())
        }
    }
}
