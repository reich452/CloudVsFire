//
//  CloudVsFireApp.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import AppPreferences
import SwiftUI

@main
struct CloudVsFireApp: App {
    
    // MARK: Dependancies
    @UIApplicationDelegateAdaptor(AppDelegate.self) 
    var delegate
    @BindablePreference(\.hasCompletedOnboarding)
    private var hasCompletedOnboarding
    
    @State private var selection: RootTab? = .home

    // MARK: Scene
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                AppTabView(selection: $selection)
            } else {
                onboardingPageView()
            }
        }
    }
}

private extension CloudVsFireApp {
    
    func onboardingPageView() -> some View {
         let viewModel = OnboardingPageViewModel()
         viewModel.didCompleteOnboarding = {
             self.hasCompletedOnboarding = true
         }
         return OnboardingPageView(viewModel: viewModel)
     }
}
