//
//  OnboardingPageView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var body: some View {
        TabView {
            OnboardingView()
            OnboardingView()
            OnboardingView()
            OnboardingView()
            
        }
        .environmentObject(OnboardingViewModel())
        .tabViewStyle(.page)
        .animation(.bouncy, value: 100)
        
    }
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .magenta
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.magenta.withAlphaComponent(0.2)
    }
}

#Preview {
    OnboardingPageView()
}
