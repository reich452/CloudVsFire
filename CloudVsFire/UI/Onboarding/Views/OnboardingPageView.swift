//
//  OnboardingPageView.swift
//  CloudVsFire
//
//  Created by Nick Reichard on 8/5/23.
//

import SwiftUI

struct OnboardingPageView: View {
    @Bindable var viewModel: OnboardingPageViewModel
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPageIndex) {
                ForEach(viewModel.onboardingPages.indices, id: \.self) { index in
                    OnboardingView(from: viewModel.currentOnboardingPage)
                        .tag(index)
                }
            }
            .tabViewStyle(.page)
            .animation(.bouncy, value: 100)
            Button("Next") {
                withAnimation {
                    viewModel.nextPage()
                }
            }
            .padding()
        }
    }
    
    // MARK: - Init 
  
    init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
        setupAppearance()
    }
    
    private func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .magenta
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.magenta.withAlphaComponent(0.2)
    }
}

// MARK: - Preview

#Preview {
    OnboardingPageView(viewModel: OnboardingPageViewModel())
}
